`timescale 1ps / 1ps
// Clock Wizzard For Convert 100 MHz to 25 MHz
module clock (
    // Clock out ports (25 MHz)
    output clk_out25,
    // Clock out ports (24 MHz)
    output clk_out24,
    // Status and control signals
    input  reset,
    // Clock in ports (100 MHz)
    input  clk_in
);
    clk_wiz_0 clk (
        .clk_out25(clk_out25),
        .clk_out24(clk_out24),
        .reset    (reset),
        .clk_in   (clk_in)
    );

endmodule