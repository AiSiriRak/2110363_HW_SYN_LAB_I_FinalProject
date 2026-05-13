// For Get Image Data From ov7670

module ov7670_capture (
    input             pclk,     // Clock
    input             rst,      // Reset
    input             vsync,    // End Image Signal
    input             href,     // End Line Signal
    input      [ 7:0] din,      // Data From Camera
    output reg [15:0] dout,     // Output Data
    output reg [18:0] address,  // For Address of Output (640*480)
    output reg        w_valid   // Signal For Valid Data
);

    reg [7:0] d_firstbyte;  // Full Color Data (2 Bytes)
    reg       w_hold;  // In Between Same Pixel Signal

    reg [9:0] x;  // Pixel Horizontal Location
    reg [9:0] y;  // Pixel Vertical Location

    always @(posedge pclk) begin
        if (rst || vsync) begin  // Start Frame (Reset All Variable)
            x       <= 0;
            y       <= 0;
            address <= 0;
            w_valid <= 0;
            w_hold  <= 0;
        end else if (href) begin  // Data Valid
            w_hold <= ~w_hold;
            if (!w_hold) begin  // Get First Half of Color Byte
                d_firstbyte <= din;
                w_valid     <= 0;
            end else begin  // After Get Second Half, Save Directly on RAM
                dout    <= {d_firstbyte, din};
                address <= address + 1;
                w_valid <= 1;
            end
        end else begin  // End Line
            w_hold  <= 0;
            w_valid <= 0;
        end
    end

endmodule
