// For Setting Register of ov7670

module ov7670_registers (
    input      [ 7:0] count,   // ROM index from configuration FSM
    output reg [15:0] setting  // {register address, register value}
);

    always @(*) begin
        case (count)
            // 0. RESET
            0: setting = 16'h1280;  // REG 0x12 (COM7)  = 0x80 : Reset all registers

            // 1. CLOCK / RGB FORMAT
            1: setting = 16'h1100;  // REG 0x11 (CLKRC) = 0x00 : Internal clock prescaler = 1
            2:
            setting = 16'h6B4A;  // REG 0x6B (DBLV)  = 0x4A : Enable PLL / internal clock settings
            3: setting = 16'h3B0A;  // REG 0x3B (COM11) = 0x0A : Fix RGB byte ordering / timing

            // 2. RGB / SCALING / OUTPUT FORMAT
            4: setting = 16'h1204;  // REG 0x12 (COM7)  = 0x04 : RGB output format
            5: setting = 16'h40D0;  // REG 0x40 (COM15) = 0xD0 : RGB565 full output range
            6: setting = 16'h3A04;  // REG 0x3A (TSLB)  = 0x04 : Set proper RGB ordering

            7: setting = 16'h0C00;  // REG 0x0C (COM3)  = 0x00 : Default scaling/DCW
            8: setting = 16'h3E00;  // REG 0x3E (COM14) = 0x00 : No manual scaling

            9:  setting = 16'h703A;  // REG 0x70 (SCALING_XSC) = 0x3A : Horizontal scaling
            10: setting = 16'h7135;  // REG 0x71 (SCALING_YSC) = 0x35 : Vertical scaling
            11: setting = 16'h7211;  // REG 0x72 (SCALING_DCWCTR)=0x11 : Downsample control
            12: setting = 16'h73F1;  // REG 0x73 (SCALING_PCLK_DIV)=0xF1 : Pixel clock divide
            13: setting = 16'hA202;  // REG 0xA2 (SCALING_PCLK_DELAY)=0x02 : PCLK delay


            // 3. WINDOWING
            14: setting = 16'h1713;  // REG 0x17 (HSTART) = 0x13 : Horizontal frame start
            15: setting = 16'h1801;  // REG 0x18 (HSTOP)  = 0x01 : Horizontal frame stop
            16: setting = 16'h32BF;  // REG 0x32 (HREF)   = 0xBF : HREF edge offset

            17: setting = 16'h1902;  // REG 0x19 (VSTART)= 0x02 : Vertical frame start
            18: setting = 16'h1A7A;  // REG 0x1A (VSTOP) = 0x7A : Vertical frame stop
            19: setting = 16'h030A;  // REG 0x03 (VREF)  = 0x0A : Vertical timing reference

            // 4. COLOR MATRIX (COLOR CALIBRATION)
            20: setting = 16'h4F80;  // REG 0x4F = 0x80 : Color matrix coefficient 1
            21: setting = 16'h5070;  // REG 0x50 = 0x70 : Color matrix coefficient 2
            22: setting = 16'h5100;  // REG 0x51 = 0x00 : Color matrix coefficient 3
            23: setting = 16'h5215;  // REG 0x52 = 0x15 : Color matrix coefficient 4
            24: setting = 16'h5394;  // REG 0x53 = 0x94 : Color matrix coefficient 5
            25: setting = 16'h54F0;  // REG 0x54 = 0xF0 : Color matrix coefficient 6
            26: setting = 16'h589E;  // REG 0x58 = 0x9E : Matrix coefficient signs

            // 5. AUTO CONTROL (AEC / AGC / AWB)
            27: setting = 16'h13EF;  // REG 0x13 (COM8) = 0xEF : Enable AEC AGC AWB
            28: setting = 16'h0000;  // REG 0x00 (GAIN) = 0x00 : Initial analog gain
            29: setting = 16'h1000;  // REG 0x10 (AECH) = 0x00 : Exposure high bits
            30: setting = 16'h0D40;  // REG 0x0D (COM4) = 0x40 : AEC control

            31: setting = 16'h1438;  // REG 0x14 (COM9) = 0x38 : AGC gain ceiling

            32: setting = 16'h2495;  // REG 0x24 (AEW)  = 0x95 : AEC upper limit
            33: setting = 16'h2533;  // REG 0x25 (AEB)  = 0x33 : AEC lower limit
            34: setting = 16'h26E3;  // REG 0x26 (VPT)  = 0xE3 : Fast AEC operation region

            // 6. GAMMA CURVE
            35: setting = 16'h7A20;  // REG 0x7A = 0x20 : Gamma curve point 1
            36: setting = 16'h7B10;  // REG 0x7B = 0x10 : Gamma curve point 2
            37: setting = 16'h7C1E;  // REG 0x7C = 0x1E : Gamma curve point 3
            38: setting = 16'h7D35;  // REG 0x7D = 0x35 : Gamma curve point 4
            39: setting = 16'h7E5A;  // REG 0x7E = 0x5A : Gamma curve point 5
            40: setting = 16'h7F69;  // REG 0x7F = 0x69 : Gamma curve point 6
            41: setting = 16'h8076;  // REG 0x80 = 0x76 : Gamma curve point 7
            42: setting = 16'h8180;  // REG 0x81 = 0x80 : Gamma curve point 8
            43: setting = 16'h8288;  // REG 0x82 = 0x88 : Gamma curve point 9
            44: setting = 16'h838F;  // REG 0x83 = 0x8F : Gamma curve point 10
            45: setting = 16'h8496;  // REG 0x84 = 0x96 : Gamma curve point 11
            46: setting = 16'h85A3;  // REG 0x85 = 0xA3 : Gamma curve point 12
            47: setting = 16'h86AF;  // REG 0x86 = 0xAF : Gamma curve point 13
            48: setting = 16'h87C4;  // REG 0x87 = 0xC4 : Gamma curve point 14
            49: setting = 16'h88D7;  // REG 0x88 = 0xD7 : Gamma curve point 15
            50: setting = 16'h89E8;  // REG 0x89 = 0xE8 : Gamma curve point 16

            // 7. DSP / IMAGE ENHANCEMENT
            51: setting = 16'h4108;  // REG 0x41 (COM16)= 0x08 : Enable edge enhancement
            52: setting = 16'h76E1;  // REG 0x76 = 0xE1 : DSP optimization
            53: setting = 16'h330B;  // REG 0x33 = 0x0B : DSP scaling
            54: setting = 16'h3C78;  // REG 0x3C = 0x78 : DSP output control
            55: setting = 16'h6900;  // REG 0x69 = 0x00 : Disable FIFO options
            56: setting = 16'h7400;  // REG 0x74 = 0x00 : Digital gain control

            57: setting = 16'hB084;  // REG 0xB0 = 0x84 : Color mode tuning
            58: setting = 16'hB100;  // REG 0xB1 = 0x00 : Reserved DSP tuning
            59: setting = 16'hB20E;  // REG 0xB2 = 0x0E : Reserved DSP tuning
            60: setting = 16'hB382;  // REG 0xB3 = 0x82 : Reserved DSP tuning

            // 8. SATURATION / CONTRAST
            61: setting = 16'h6780;  // REG 0x67 = 0x80 : Saturation control
            62: setting = 16'h6880;  // REG 0x68 = 0x80 : Saturation control
            63: setting = 16'h5640;  // REG 0x56 = 0x40 : Contrast / brightness tuning

            // 9. FRAME STABILITY / TIMING
            64: setting = 16'h1500;  // REG 0x15 (COM10)= 0x00 : Normal PCLK behavior
            65: setting = 16'h13EF;  // REG 0x13 (COM8) = 0xEF : Re-enable AEC AGC AWB
            66: setting = 16'h0E61;  // REG 0x0E (COM5) = 0x61 : PLL/frame timing
            67: setting = 16'h1600;  // REG 0x16 = 0x00 : Reserved timing control
            68: setting = 16'h1E07;  // REG 0x1E (MVFP) = 0x07 : Mirror / flip control


            default: setting = 16'hFFFF;

        endcase
    end
endmodule
