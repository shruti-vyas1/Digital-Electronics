# Basic Circuits Repository

This repository contains fundamental digital circuits implemented in **Verilog HDL** as part of my journey in learning **Digital Electronics** and **Hardware Design**.  
These circuits helped me build a strong foundation in combinational logic and modular design, and I’ve included testbenches to verify each module.

---

## Folders and Contents

### 1. Basic Gates
- **Half Adder**
- **Full Adder**
- **Half Subtractor**
- **Full Subtractor**  
Includes testbenches and multiple modeling styles (gate-level, dataflow, behavioral).  
*These were my first steps into digital design, and understanding them made everything else easier.*

### 2. Ripple Carry Adders (RCA)
- **4-bit Ripple Carry Adder (RCA4)**
- **16-bit Ripple Carry Adder (RCA16)**  
Implemented using gate-level 1-bit Full Adders.  
Testbenches are included.  
*Learning RCAs taught me how carries propagate and why we need hierarchical design in hardware.*

### 3. Carry Select Adder (CSA)
- **16-bit Carry Select Adder (CSA16)**  
Implemented using 4-bit RCA blocks with MUX-based carry selection.  
Includes a testbench with random inputs.  
*Building the CSA showed me how parallel computation can speed up addition — a neat trick used in real CPUs!*

### 4. Operator-based Adders
- **8-bit Adder using Verilog `+` operator**  
Includes testbench.  
*This helped me appreciate how hardware designers translate simple operators into actual gates behind the scenes.*

---

## Skills Demonstrated

- Combinational logic design (adders, subtractors, multiplexers)  
- Boolean algebra and hardware thinking  
- Verilog HDL coding and modular design  
- Testbench creation and waveform verification  
- Working with hierarchical modules and reusable components  

---

## Tools
- **Xilinx Vivado** 

---

### Personal Note

Every module in this repository represents a small milestone in my journey as a digital electronics learner.  
From the first Half Adder to the 16-bit Carry Select Adder, I’ve learned to think like a hardware designer — building from gates up to complete circuits.  
This collection is not just code; it’s a record of my understanding growing step by step.
