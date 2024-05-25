# IP - Rishi Shukla

## Overview

This project consists of four main VHDL files that are noteworthy:
1. `aspadc.vhd`
2. `test_adc.vhd`
3. `aspadc_tdma.vhd`
4. `test_adc_tdma.vhd`

## Simulation Instructions

To run the simulations and observe the waveform of the 8-bit quantized signal, follow these steps:

1. **Open ModelSim**:
   - Ensure all VHDL files (`aspadc.vhd`, `test_adc.vhd`, `aspadc_tdma.vhd`, `test_adc_tdma.vhd`) are compiled alongside other dependencies such as the TDMA-MIN.
   
2. **Run the Simulation**:
   - Run the `test_adc` file for 50 ms to generate and observe the waveform of the 8-bit quantized signal.

## Configuration

- **Modifying the Input MIF File**:
  - The input `.mif` file used in the `aspadc` or `aspadc_tdma` components can be changed by updating the `init_file` parameter inside the `altsyncram` component within the respective VHDL files.

- **TDMA Configuration** (currently not working):
  - The `test_adc_tdma` and `aspadc_tdma` files currently have some bugs that will be improved upon in future updates.
  - To configure ports for the TDMA, you can use the `recv_port(0).data` variable. Assign the last three digits to one of the following values to configure the data width:
    - `001` for 8-bit configuration
    - `010` for 10-bit configuration
    - `011` for 12-bit configuration 

## Input MIF File Generation

- **Python Code**:
  - The Python code for generating the `.mif` files is located in the `input-generator` folder. This code generates the samples of the modeled power signal which can then be used as input for the VHDL simulations.
