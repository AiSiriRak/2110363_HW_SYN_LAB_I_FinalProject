`timescale 1ns / 1ps

module testbench ();

    // --- 1. Board Inputs ---
    reg        clk;
    reg        rst;
    reg  [2:0] sw;
    wire [2:0] led;

    // --- 2.  Camera Inputs ---
    reg        pclk;
    reg        vsync_cam;
    reg        href_cam;
    reg  [7:0] data_cam;

    // --- 3.  Output from  System ---
    wire xclk_cam, scl_cam, pwdn_cam, rst_cam;
    wire sda_cam;  // inout
    wire hsync_vga, vsync_vga;
    wire [3:0] vga_r, vga_g, vga_b;

    // --- 4.  Top Module ---
    top_module uut (
        .clk      (clk),
        .rst      (rst),
        .sw       (sw),
        .led      (led),
        // Camera Interface
        .pclk     (pclk),
        .vsync_cam(vsync_cam),
        .href_cam (href_cam),
        .data_cam (data_cam),
        .xclk_cam (xclk_cam),
        .scl_cam  (scl_cam),
        .sda_cam  (sda_cam),
        .pwdn_cam (pwdn_cam),
        .rst_cam  (rst_cam),
        // VGA Interface
        .hsync_vga(hsync_vga),
        .vsync_vga(vsync_vga),
        .vga_r    (vga_r),
        .vga_g    (vga_g),
        .vga_b    (vga_b)
    );

    // --- 5. Clock Generation ---
    initial clk = 0;
    always #5 clk = ~clk;  // 100MHz (Basys 3)

    initial pclk = 0;
    always #20 pclk = ~pclk;  // ~25MHz (Camera Pixel Clock)

    // --- 6. Simulation Scenario ---
    initial begin
        rst       = 1;
        sw        = 3'b000;
        vsync_cam = 0;
        href_cam  = 0;
        data_cam  = 8'h00;
        #100;

        rst = 0;
        #100;

        sw        = 3'b001;

        vsync_cam = 1;
        #500;
        vsync_cam = 0;
        #500;
        repeat (5) begin
            href_cam = 1;
            repeat (640) begin
                @(posedge pclk);
                data_cam = data_cam + 1;
            end
            href_cam = 0;
            #1000;
        end
        #100000;

        $display("Simulation completed successfully!");
        $finish;
    end

endmodule
