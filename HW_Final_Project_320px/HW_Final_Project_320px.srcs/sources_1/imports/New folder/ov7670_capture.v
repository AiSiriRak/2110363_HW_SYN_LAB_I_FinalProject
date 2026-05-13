// For Get Image Data From ov7670

module ov7670_capture (
    input             pclk,     // Clock
    input             rst,      // Reset
    input             vsync,    // End Image Signal
    input             href,     // End Line Signal
    input      [ 7:0] din,      // Data From Camera
    output reg [15:0] dout,     // Output Data
    output reg [16:0] address,  // For Address of Output (320*240)
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
                // Check if the Location Number is Even (Get 1/4 of Real Pixel)
                if ((x[0] == 0) && (y[0] == 0)) begin
                    dout    <= {d_firstbyte, din};
                    address <= address + 1;
                    w_valid <= 1;
                end else begin
                    w_valid <= 0;
                end
                x <= x + 1;
            end
        end else begin  // End Line
            w_hold  <= 0;
            w_valid <= 0;
            if (x != 0) begin
                x <= 0;
                y <= y + 1;
            end
        end
    end

endmodule
