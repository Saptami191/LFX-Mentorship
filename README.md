# LFX-Mentorship
LFX Mentorship: Projects and Coding Challenges

# Quick Links

- [Fall 2025](https://github.com/merledu/LFX-Mentorship/tree/coding_challenge_2025)


# RISC-V LFX Mentorship Coding Challenge 2025

## Overview
This directory contains my submission for the **Atomic NucleusRV - Coding Challenge**.  
The task was to implement a hardware stack module in Verilog with the ability to **push**, **pop**, and **peek** values according to given instructions.  
A testbench was also created to simulate and verify the stack’s behavior.

---

## Files
- **stack.v** – Main hardware stack module.
- **tb_stack.v** – Testbench to simulate and verify `stack.v`.
- **output_log.txt** – Output of the simulation.
- **README.md** – This file.

---

## How to Run the Simulation
1. Open a terminal in this directory.
2. Compile and run using [Icarus Verilog](https://steveicarus.github.io/iverilog/):
   ```bash
   iverilog -o stack_test stack.v tb_stack.v
   vvp stack_test
