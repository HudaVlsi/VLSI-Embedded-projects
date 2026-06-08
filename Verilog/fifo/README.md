# FIFO Design in Verilog

## Overview
This project implements an 8-bit wide, 8-depth synchronous FIFO in Verilog.

## Features
- Synchronous FIFO architecture
- Write and Read operations
- Full flag generation
- Empty flag generation
- Count-based occupancy tracking

## Files
- fifo.v : FIFO RTL design
- fifo_tb.v : Testbench
- waveform.png : Simulation results

## Simulation Results
The FIFO correctly stores and retrieves data in First-In First-Out order.

Example:
Input Sequence:
11 → 22 → 33

Output Sequence:
11 → 22 → 33

## Tools Used
- Verilog HDL
- ModelSim
