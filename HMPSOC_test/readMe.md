# Operating the Testbench

1. Open Modelsim for Intel FPGA Starter Edition and change directory to /HMPSOC_test/.
   a. Compile `testtoplevel`, `testadcasp`, `avgasp` and all `tdma_min` components found in the `tdma_min` folder.
   b. In the `avgasp` entity, the `WINDOWSIZE` parameter can be manually changed.
2. Simulate `testtoplevel`.
3. Add aspadc's `data`, and `avgasp`’s `avg` signal.
4. Simulate for 20ms to see results over two cycles of power signal. Higher window sizes will result in a less varied signal, can be compared within the report.
