# Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.00 [get_ports clk]

# Buttons
set_property PACKAGE_PIN U18 [get_ports rst]						
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {sw[0]}]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {sw[1]}]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {sw[2]}]

# VGA Sync
set_property PACKAGE_PIN P19 [get_ports hsync_vga]
set_property IOSTANDARD LVCMOS33 [get_ports hsync_vga]
set_property PACKAGE_PIN R19 [get_ports vsync_vga]
set_property IOSTANDARD LVCMOS33 [get_ports vsync_vga]

# VGA Red
set_property PACKAGE_PIN G19 [get_ports {vga_r[0]}]
set_property PACKAGE_PIN H19 [get_ports {vga_r[1]}]
set_property PACKAGE_PIN J19 [get_ports {vga_r[2]}]
set_property PACKAGE_PIN N19 [get_ports {vga_r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[3]}]

# VGA Green
set_property PACKAGE_PIN J17 [get_ports {vga_g[0]}]
set_property PACKAGE_PIN H17 [get_ports {vga_g[1]}]
set_property PACKAGE_PIN G17 [get_ports {vga_g[2]}]
set_property PACKAGE_PIN D17 [get_ports {vga_g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_g[3]}]

# VGA Blue
set_property PACKAGE_PIN N18 [get_ports {vga_b[0]}]
set_property PACKAGE_PIN L18 [get_ports {vga_b[1]}]
set_property PACKAGE_PIN K18 [get_ports {vga_b[2]}]
set_property PACKAGE_PIN J18 [get_ports {vga_b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_b[3]}]

# Data camera D0–D7
set_property PACKAGE_PIN P17 [get_ports {data_cam[0]}]
set_property PACKAGE_PIN N17 [get_ports {data_cam[1]}]
set_property PACKAGE_PIN M19 [get_ports {data_cam[2]}]
set_property PACKAGE_PIN M18 [get_ports {data_cam[3]}]
set_property PACKAGE_PIN L17 [get_ports {data_cam[4]}]
set_property PACKAGE_PIN K17 [get_ports {data_cam[5]}]
set_property PACKAGE_PIN C16 [get_ports {data_cam[6]}]
set_property PACKAGE_PIN B16 [get_ports {data_cam[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_cam[7]}]

set_property PACKAGE_PIN A17 [get_ports href_cam]
set_property PACKAGE_PIN B15 [get_ports vsync_cam]

set_property IOSTANDARD LVCMOS33 [get_ports href_cam]
set_property IOSTANDARD LVCMOS33 [get_ports vsync_cam]

set_property PACKAGE_PIN A16 [get_ports pclk]
set_property IOSTANDARD LVCMOS33 [get_ports pclk]
set_property PULLUP TRUE [get_ports pclk]

set_property PACKAGE_PIN C15 [get_ports xclk_cam]
set_property IOSTANDARD LVCMOS33 [get_ports xclk_cam]

set_property PACKAGE_PIN A14 [get_ports scl_cam]
set_property PACKAGE_PIN A15 [get_ports sda_cam]

set_property IOSTANDARD LVCMOS33 [get_ports scl_cam]
set_property IOSTANDARD LVCMOS33 [get_ports sda_cam]

set_property PACKAGE_PIN R18 [get_ports pwdn_cam]
set_property PACKAGE_PIN P18 [get_ports rst_cam]

set_property IOSTANDARD LVCMOS33 [get_ports pwdn_cam]
set_property IOSTANDARD LVCMOS33 [get_ports rst_cam]

set_property PULLUP TRUE [get_ports sda_cam]
set_property PULLUP TRUE [get_ports scl_cam]