`timescale 1ns / 1ps

module top_module_tb;

    // ---------------------------------------------------------
    // 1. Signals Declaration
    // ---------------------------------------------------------
    reg clk;            // 100MHz System Clock
    reg rst;            // System Reset
    reg [2:0] sw;       // Filter Selection Switches
    reg pclk;           // Camera Pixel Clock
    reg vsync_cam;      // Camera Vertical Sync
    reg href_cam;       // Camera Horizontal Reference
    reg [7:0] data_cam; // Camera Data Bus

    wire xclk_cam;      // Camera Master Clock (Output from System)
    wire scl_cam;       // SCCB Clock
    wire sda_cam;       // SCCB Data
    wire pwdn_cam;      // Camera Power Down
    wire rst_cam;       // Camera Reset signal
    wire hsync_vga;     // VGA Horizontal Sync
    wire vsync_vga;     // VGA Vertical Sync
    wire [3:0] vga_r;   // VGA Red
    wire [3:0] vga_g;   // VGA Green
    wire [3:0] vga_b;   // VGA Blue

    // ---------------------------------------------------------
    // 2. Unit Under Test (UUT) Instantiation
    // ---------------------------------------------------------
    top_module uut (
        .clk(clk), 
        .rst(rst), 
        .sw(sw), 
        .pclk(pclk), 
        .vsync_cam(vsync_cam), 
        .href_cam(href_cam), 
        .data_cam(data_cam), 
        .xclk_cam(xclk_cam), 
        .scl_cam(scl_cam), 
        .sda_cam(sda_cam), 
        .pwdn_cam(pwdn_cam), 
        .rst_cam(rst_cam), 
        .hsync_vga(hsync_vga), 
        .vsync_vga(vsync_vga), 
        .vga_r(vga_r), 
        .vga_g(vga_g), 
        .vga_b(vga_b)
    );

    // ---------------------------------------------------------
    // 3. Clock Generation
    // ---------------------------------------------------------
    
    // Simulate 100MHz Basys3 On-board Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Simulate Camera Pixel Clock (PCLK ~25MHz)
    initial begin
        pclk = 0;
        forever #20 pclk = ~pclk; 
    end

    // ---------------------------------------------------------
    // 4. Helper Tasks (Efficiency Boost)
    // ---------------------------------------------------------

    // Task to simulate sending one pixel (2 bytes in RGB565)
    task send_pixel(input [15:0] rgb565_data);
        begin
            @(posedge pclk);
            data_cam = rgb565_data[15:8]; // Send first byte
            @(posedge pclk);
            data_cam = rgb565_data[7:0];  // Send second byte
        end
    endtask

    // Task to simulate a VSYNC start pulse
    task send_vsync();
        begin
            vsync_cam = 1;
            repeat(10) @(posedge pclk);
            vsync_cam = 0;
            repeat(10) @(posedge pclk);
        end
    endtask

    // ---------------------------------------------------------
    // 5. Main Simulation Logic
    // ---------------------------------------------------------
    initial begin
        // --- System Initialization ---
        $display("Simulation Started: Initializing System...");
        rst = 1;
        sw = 3'b000;
        vsync_cam = 0;
        href_cam = 0;
        data_cam = 8'h00;

        // Release Reset after 100ns
        #100;
        rst = 0;
        $display("Reset Released at %t", $time);
        
        // Wait for Clock Wizard to lock and SCCB config to start
        #50000; 

        // --- Verify System Clocking ---
        if (xclk_cam === 1'bx) 
            $display("Error: xclk_cam is undefined! Check Clock Wizard.");
        else 
            $display("Success: xclk_cam is toggling at %t", $time);

        // --- Step 1: Simulate Camera Image Frame ---
        $display("Step 1: Simulating Camera Frame Data...");
        send_vsync();

        href_cam = 1; // Start of Line
        
        // Pixel 1: Red (F800 in RGB565)
        send_pixel(16'hF800);
        
        // Pixel 2: Green (07E0 in RGB565)
        send_pixel(16'h07E0);
        
        // Pixel 3: Blue (001F in RGB565)
        send_pixel(16'h001F);
        
        // Pixel 4: White (FFFF in RGB565)
        send_pixel(16'hFFFF);

        href_cam = 0; // End of Line
        $display("Frame line transmission complete.");

        // --- Step 2: Test Filter Mode Switching ---
        $display("Step 2: Testing Filter Switching...");
        
        // Normal Mode
        sw = 3'b000;
        #1000;
        $display("Mode: Normal - VGA Output R:%h G:%h B:%h", vga_r, vga_g, vga_b);

        // Grayscale Mode
        sw = 3'b001; 
        #2000;
        $display("Mode: Grayscale - VGA Output R:%h G:%h B:%h", vga_r, vga_g, vga_b);

        // Inverse Mode
        sw = 3'b010;
        #2000;
        $display("Mode: Inverse - VGA Output R:%h G:%h B:%h", vga_r, vga_g, vga_b);

        // Threshold Mode
        sw = 3'b100;
        #2000;
        $display("Mode: Threshold - VGA Output R:%h G:%h B:%h", vga_r, vga_g, vga_b);
        
        // --- End Simulation ---
        $display("Simulation Finished Successfully at %t", $time);
        $finish;
    end

    // ---------------------------------------------------------
    // 6. Monitor Signals (Optional but helpful)
    // ---------------------------------------------------------
    initial begin
        // Monitor VGA sync signals to ensure the controller is running
        $monitor("Time: %t | VGA Sync: H=%b V=%b | Current Switch: %b", 
                  $time, hsync_vga, vsync_vga, sw);
    end

endmodule