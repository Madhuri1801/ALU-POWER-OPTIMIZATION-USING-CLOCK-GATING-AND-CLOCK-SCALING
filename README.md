**ALU-POWER-OPTIMIZATION-USING-CLOCK-GATING-AND-CLOCK-SCALING**
This project focuses on developing and integrating low-power design techniques for Arithmetic Logic Units a core component of modern processors. By applying methods such as clock gating, operand isolation, dynamic voltage scaling, and low-power arithmetic designs, the project aims to minimize both dynamic and static power dissipation.

The functional verification of the power-optimized 32-bit ALU was conducted using **Xilinx Vivado**.The simulation validated correct arithmetic and logic operations across different power modes, ensuring functional integrity with clock gating and clock scaling mechanisms integrated.

A comprehensive testbench stimulated the ALU under various scenarios, including addition, subtraction, AND, OR, XOR, and NOT operations, while dynamically adjusting clock frequencies based on power mode settings.
The synthesized 32-bit ALU, optimized with clock gating and clock scaling techniques, was implemented using **Cadence Genus Synthesis Solution**, an industry-standard RTL-to-GDSII toolchain. The project leveraged fine-grained clock control to achieve dynamic power reduction while maintaining performance targets. During synthesis, the Genus tool produced detailed QoR (Quality of Results) reports, including timing analysis, area utilization, and power estimation.  
Key outcomes from the synthesis phase included:
- **Achieving timing closure** for all critical paths.
- **Area minimization** through modular design using separate clock-gated blocks and carry-lookahead adder structure.
- **Significant dynamic power savings**, validated through Genus' power analysis reports.
This synthesis process demonstrates a practical and scalable methodology for integrating low-power techniques into ALU design, aligning with modern semiconductor industry demands for energy-efficient and high-performance SoC development.


< **Table of Contents** >

- [Introduction](#introduction)
- [Objective](#objective)
- [Code](#code)
  - [Module 1: ALU](#module-1-alu)
  - [Module 2: Carry Lookahead Adder for Highly Computable Arithmetic Operations](#module-2-carry-lookahead-adder-for-highly-computable-arithmetic-operations)
  - [Module 3: Clock Scaling Using Frequency Division Based on the Power Mode](#module-3-clock-scaling-using-frequency-division-based-on-the-power-mode)
  - [Module 4: Latch-based Clock Gating Implementation](#module-4-latch-based-clock-gating-implementation)
- [Testbench](#testbench)
- [Simulation Results](#simulation-results)
- [Synthesis Results](#synthesis-results)
  - [Module 1: ALU 32-bit](#module-1-alu-32-bit)
    - [Schematic After Synthesis](#schematic-after-synthesis)
    - [QOR Report](#qor-report)
  - [Module 2: Carry Lookahead Adder](#module-2-carry-lookahead-adder)
    - [Schematic After Synthesis](#schematic-after-synthesis-1)
    - [QOR Report](#qor-report-1)
  - [Module 3: Clock Scaling](#module-3-clock-scaling)
    - [Schematic After Synthesis](#schematic-after-synthesis-2)
    - [QOR Report](#qor-report-2)
  - [Module 4: Clock Gating](#module-4-clock-gating)
    - [Schematic After Synthesis](#schematic-after-synthesis-3)
    - [QOR Report](#qor-report-3)
- [Conclusion](#conclusion)
