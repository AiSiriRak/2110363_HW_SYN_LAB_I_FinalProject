# Real-Time Video Capture and Processing System
2110363 Hardware Synthesis Laboratory I Final Project by B1 Team

FPGA-based real-time video capture and processing system using the OV7670 camera module and VGA output on the Basys 3 FPGA board.

## Hardware
- Basys 3 FPGA Board
- OV7670 Camera Module (without FIFO)
- VGA Monitor + VGA Cable
- USB Cable

## Features
- Real-time video capture
- VGA display output
- Frame buffer using BRAM
- SCCB (I2C-like) camera configuration
- Multi-clock domain handling
- Real-time image filters using switches
  - `SW0` → Grayscale filter
  - `SW1` → Negative filter
  - `SW2` → Threshold filter
- 320x240 and 640x480 versions

## Source Code
- 320px version → [HW_Final_Project_320px](./HW_Final_Project_320px/HW_Final_Project_320px.srcs/sources_1/imports/New folder)
- 640px version → [HW_Final_Project_640px](./HW_Final_Project_640px/HW_Final_Project_320px.srcs/sources_1/imports/New folder)
