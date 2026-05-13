module filter_sel (
    input      [ 2:0] sw,
    input      [11:0] din,
    input             clk,
    output reg [11:0] dout
);

    // RGB444
    wire [3:0] r;
    wire [3:0] g;
    wire [3:0] b;

    assign r = din[11:8];
    assign g = din[7:4];
    assign b = din[3:0];

    // grayscale
    wire [5:0] gray;
    assign gray = (r + g + b) / 3;

    // invert
    wire [3:0] r_inv;
    wire [3:0] g_inv;
    wire [3:0] b_inv;

    assign r_inv = 4'hF - r;
    assign g_inv = 4'hF - g;
    assign b_inv = 4'hF - b;

    always @(posedge clk) begin
        case (sw)
            // Grey Scale
            3'b001:  dout <= {gray[3:0], gray[3:0], gray[3:0]};
            // Negative
            3'b010:  dout <= {r_inv, g_inv, b_inv};
            // Threshold
            3'b100:  dout <= (gray > 7) ? 12'hFFF : 12'h000;
            // Original
            default: dout <= {r, g, b};

        endcase
    end

endmodule
