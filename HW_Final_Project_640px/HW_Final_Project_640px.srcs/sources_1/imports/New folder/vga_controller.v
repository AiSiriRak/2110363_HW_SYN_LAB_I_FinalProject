module vga_controller (
    input            clk,
    input            rst,
    output           hsync,
    output           vsync,
    output reg [9:0] x = 0,
    output reg [9:0] y = 0,
    output           video_on

);
    // VGA Parameter
    parameter H_S = 800;
    parameter H_DISP = 640;
    parameter H_PW = 96;
    parameter H_FP = 16;
    parameter H_BP = 48;

    parameter V_S = 521;
    parameter V_DISP = 480;
    parameter V_PW = 2;
    parameter V_FP = 10;
    parameter V_BP = 29;

    // Calculate Hsync And Vsync
    parameter HSYNC_START = H_DISP + H_FP;
    parameter HSYNC_END = H_DISP + H_FP + H_PW;
    parameter VSYNC_START = V_DISP + V_FP;
    parameter VSYNC_END = V_DISP + V_FP + V_PW;

    reg hsync_reg;
    reg vsync_reg;
    reg video_on_reg;
    assign hsync    = hsync_reg;
    assign vsync    = vsync_reg;
    assign video_on = video_on_reg;

    // Update Output X,Y on Screen
    always @(posedge clk) begin
        if (rst) begin
            x <= 0;
            y <= 0;
        end else begin
            if (x == H_S - 1) begin
                x <= 0;
                if (y == V_S - 1) y <= 0;
                else y <= y + 1;
            end else x <= x + 1;
        end
        hsync_reg    <= ~(x >= HSYNC_START && x < HSYNC_END);
        vsync_reg    <= ~(y >= VSYNC_START && y < VSYNC_END);
        video_on_reg <= (x < H_DISP) && (y < V_DISP);
    end

endmodule
