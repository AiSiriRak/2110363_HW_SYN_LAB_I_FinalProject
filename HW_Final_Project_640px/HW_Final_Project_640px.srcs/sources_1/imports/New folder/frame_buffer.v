module frame_buffer (
    // Camera write port (Port A)
    input        clk_cam,
    input        w_valid,
    input [ 4:0] din,
    input [18:0] address_in,

    // VGA read port (Port B)
    input         clk_screen,
    input  [18:0] address_screen,
    output [ 4:0] dout
);

    // Use True Dual Port RAM
    // Width = 12 (RGB444)
    // Depth = 76,800 (320*240)

    blk_mem_gen_0 mem (
        .clka (clk_cam),
        .addra(address_in),
        .dina (din),
        .ena  (1'b1),
        .wea  (w_valid),

        .clkb (clk_screen),
        .addrb(address_screen),
        .doutb(dout),
        .enb  (1'b1),
        .web  (1'b0)
    );

endmodule
