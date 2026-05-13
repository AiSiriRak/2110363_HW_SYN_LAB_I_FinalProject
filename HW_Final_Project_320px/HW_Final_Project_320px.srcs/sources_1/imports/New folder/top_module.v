module top_module (
    // Board
    input       clk,
    input       rst,
    input [2:0] sw,

    // ov7670
    input       pclk,
    input       vsync_cam,
    input       href_cam,
    input [7:0] data_cam,

    output xclk_cam,
    output scl_cam,
    inout  sda_cam,
    output pwdn_cam,
    output rst_cam,

    // VGA
    output       hsync_vga,
    output       vsync_vga,
    output [3:0] vga_r,
    output [3:0] vga_g,
    output [3:0] vga_b
);

    // Clock
    wire clk_25mhz;
    wire clk_24mhz;
    clock clkgen (
        .clk_in   (clk),
        .clk_out25(clk_25mhz),
        .clk_out24(clk_24mhz),
        .reset    (rst)
    );

    // Camera Clock
    assign xclk_cam = clk_24mhz;
    // VGA Clock
    assign xclk_vga = clk_25mhz;

    // Camera Power
    assign pwdn_cam = 0;
    assign rst_cam  = 1;

    // Camera Setting
    wire setting_finished;

    ov7670_setting setting (
        .clk             (xclk_cam),
        .rst             (rst),
        .SIO_C           (scl_cam),
        .SIO_D           (sda_cam),
        .setting_finished(setting_finished)
    );

    // Camera Capture
    wire [15:0] cam_pixel;
    wire [16:0] cam_address;
    wire        cam_w_valid;
    ov7670_capture capture (
        .pclk   (pclk),
        .rst    (rst),
        .vsync  (vsync_cam),
        .href   (href_cam),
        .din    (data_cam),
        .dout   (cam_pixel),
        .address(cam_address),
        .w_valid(cam_w_valid)
    );

    // VGA Controller
    wire [9:0] x;
    wire [9:0] y;
    wire       video_on;
    wire       hsync_vga_raw;
    wire       vsync_vga_raw;
    vga_controller vga (
        .clk     (xclk_vga),
        .rst     (rst),
        .hsync   (hsync_vga_raw),
        .vsync   (vsync_vga_raw),
        .x       (x),
        .y       (y),
        .video_on(video_on)
    );

    // Delay VGA signal for waiting write data
    reg [4:0] hsync_vga_delay;
    reg [4:0] vsync_vga_delay;
    reg [4:0] video_on_delay;
    assign hsync_vga = hsync_vga_delay[4];
    assign vsync_vga = vsync_vga_delay[4];
    always @(posedge xclk_vga) begin
        hsync_vga_delay <= {hsync_vga_delay[3:0], hsync_vga_raw};
        vsync_vga_delay <= {vsync_vga_delay[3:0], vsync_vga_raw};
        video_on_delay  <= {video_on_delay[3:0], video_on};
    end

    // Frame Buffer Address Convert
    wire [16:0] screen_addr;
    assign screen_addr = ((y >> 1) << 8) + ((y >> 1) << 6) + (x >> 1);

    // Convert RGB565 to RGB444
    wire [11:0] rgb444;
    assign rgb444 = {cam_pixel[15:12], cam_pixel[10:7], cam_pixel[4:1]};

    // Frame Buffer
    wire [11:0] pixel;
    frame_buffer fb (
        .clk_cam       (pclk),
        .w_valid       (cam_w_valid),
        .din           (rgb444),
        .address_in    (cam_address),
        .clk_screen    (xclk_vga),
        .address_screen(screen_addr),
        .dout          (pixel)
    );

    // Convert Pixel to Filter
    wire [11:0] pixel_converted;
    filter_sel fs (
        .sw  (sw),
        .din (pixel),
        .clk (xclk_vga),
        .dout(pixel_converted)
    );

    // VGA RGB444 Output
    assign vga_r = video_on_delay[4] ? pixel_converted[11:8] : 0;
    assign vga_g = video_on_delay[4] ? pixel_converted[7:4] : 0;
    assign vga_b = video_on_delay[4] ? pixel_converted[3:0] : 0;

endmodule
