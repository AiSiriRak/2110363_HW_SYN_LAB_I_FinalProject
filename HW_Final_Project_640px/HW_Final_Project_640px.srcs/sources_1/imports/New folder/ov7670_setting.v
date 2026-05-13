// For Setting ov7670 Using SCCB Protocol

module ov7670_setting (
    input wire clk,
    input wire rst,

    output reg SIO_C,
    output reg SIO_D,

    output reg setting_finished
);

    // CLOCK DIVIDER
    localparam CLK_DIV = 249;

    reg [8:0] divcnt;
    reg       tick;

    always @(posedge clk) begin
        if (rst) begin
            divcnt <= 0;
            tick   <= 0;
        end else begin
            tick <= 0;

            if (divcnt == CLK_DIV) begin
                divcnt <= 0;
                tick   <= 1;
            end else divcnt <= divcnt + 1;
        end
    end

    // OV7670 REGISTER LOOKUP TABLE (CONFIG ROM)
    reg  [ 7:0] count;  // register index
    wire [15:0] setting;  // {register_address, register_value}
    ov7670_registers rom (
        .count  (count),
        .setting(setting)
    );

    localparam WAIT = 3'd0;
    localparam IDLE = 3'd1;
    localparam START = 3'd2;
    localparam SEND = 3'd3;
    localparam ACK = 3'd4;
    localparam STOP = 3'd5;
    localparam NEXT = 3'd6;
    localparam DONE = 3'd7;

    localparam WAIT_DELAY = 1_000_000;
    localparam OV7670_ADDR_W = 8'h42;
    localparam CONFIG_END = 16'hFFFF;

    reg [ 2:0] state;
    reg [ 1:0] phase;
    reg [ 2:0] bit_index;
    reg [ 1:0] byte_index;
    reg [ 7:0] current_byte;
    reg [19:0] wait_cnt;

    // FSM
    always @(posedge clk) begin

        if (rst) begin
            state            <= WAIT;
            SIO_C            <= 1;
            SIO_D            <= 1;
            count            <= 0;
            setting_finished <= 0;
            phase            <= 0;
            bit_index        <= 7;
            byte_index       <= 0;
            current_byte     <= 0;
            wait_cnt         <= 0;
        end else begin
            case (state)
                WAIT: begin
                    if (wait_cnt == WAIT_DELAY) begin
                        wait_cnt <= 0;
                        state    <= IDLE;
                    end else wait_cnt <= wait_cnt + 1;
                end

                IDLE: begin
                    SIO_C <= 1;
                    SIO_D <= 1;
                    if (setting == CONFIG_END) begin
                        setting_finished <= 1;
                        state            <= DONE;
                    end else begin
                        current_byte <= OV7670_ADDR_W;
                        byte_index   <= 0;
                        bit_index    <= 7;
                        phase        <= 0;
                        state        <= START;
                    end
                end

                START: begin

                    if (tick) begin
                        if (!phase) begin
                            SIO_D <= 0;
                            phase <= 1;
                        end else begin
                            SIO_C <= 0;
                            phase <= 0;
                            state <= SEND;
                        end
                    end
                end

                SEND: begin
                    if (tick) begin
                        if (!phase) begin
                            SIO_C <= 0;
                            SIO_D <= current_byte[bit_index];
                            phase <= 1;
                        end else begin
                            SIO_C <= 1;
                            phase <= 0;
                            if (bit_index == 0) state <= ACK;
                            else bit_index <= bit_index - 1;
                        end
                    end
                end

                ACK: begin
                    if (tick) begin
                        case (phase)
                            0: begin
                                SIO_C <= 0;
                                SIO_D <= 1;
                                phase <= 1;
                            end
                            1: begin
                                SIO_C <= 1;
                                phase <= 2;
                            end
                            2: begin
                                SIO_C <= 0;
                                phase <= 0;
                                if (byte_index == 2) state <= STOP;
                                else begin
                                    byte_index <= byte_index + 1;
                                    case (byte_index)
                                        0: current_byte <= setting[15:8];
                                        1: current_byte <= setting[7:0];
                                    endcase
                                    bit_index <= 7;
                                    state     <= SEND;
                                end
                            end
                        endcase
                    end
                end
                STOP: begin
                    if (tick) begin
                        if (!phase) begin
                            SIO_C <= 1;
                            SIO_D <= 0;
                            phase <= 1;
                        end else begin
                            SIO_D <= 1;
                            phase <= 0;
                            state <= NEXT;
                        end
                    end
                end
                NEXT: begin
                    count    <= count + 1;
                    wait_cnt <= 0;
                    state    <= WAIT;
                end
                DONE: begin
                    setting_finished <= 1;
                end
                default: state <= IDLE;

            endcase

        end

    end

endmodule
