//To verify the correct operation of the color processing circuit.
`timescale 1ns / 1ps

module filter_sel_tb;

    // Inputs
    reg [2:0] sw;
    reg [11:0] din;
    reg clk;

    // Outputs
    wire [11:0] dout;

    // Instantiate the Unit Under Test (UUT)
    filter_sel uut (
        .sw(sw), 
        .din(din), 
        .clk(clk), 
        .dout(dout)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize
        sw = 3'b000;
        din = 12'hF00; // Red in RGB444 

        #100;

        // 1. Test Normal Mode (Red)
        sw = 3'b000; 
        #20;

        // 2. Test Grayscale Mode (Red)
        sw = 3'b001;
        #20;

        // 3. Change Input to Green
        din = 12'h0F0; // Green in RGB444 
        #20;

        // 4. Test Grayscale Mode (Green)
        sw = 3'b001;
        #20;

        // 5. Test Invert Mode (Green)
        sw = 3'b010;
        #20;
        
        // 6. Test Threshold Mode (Green) 
        sw = 3'b100;
        #20;
        
        // 7. Change Input to White
        din = 12'hFFF; // White in RGB444
        #20;

        $finish;
    end

endmodule