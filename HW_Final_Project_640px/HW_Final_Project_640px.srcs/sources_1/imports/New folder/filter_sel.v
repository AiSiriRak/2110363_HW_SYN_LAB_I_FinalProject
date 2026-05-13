module filter_sel (
    input      [2:0] sw,
    input      [4:0] din,
    input            clk,
    output reg [4:0] dout
);

    // RGB444
    wire [1:0] r;
    wire [1:0] g;
    wire       b;

    assign r = din[4:3];
    assign g = din[2:1];
    assign b = din[0];

    // grayscale
    wire [5:0] gray;
    assign gray = r + (g << 1) + b;
    // invert
    wire [1:0] r_inv;
    wire [1:0] g_inv;
    wire       b_inv;

    assign r_inv = 3 - r;
    assign g_inv = 3 - g;
    assign b_inv = ~b;

    always @(posedge clk) begin
        case (sw)
            // Grey Scale
            3'b001: dout <= {gray[3:2], gray[3:2], gray[3]};

            // Negative
            3'b010: dout <= {r_inv, g_inv, b_inv};

            // Threshold
            3'b100: dout <= (gray > 3) ? 5'b11111 : 5'b00000;

            // Original
            default: dout <= {r, g, b};
        endcase
    end

endmodule
