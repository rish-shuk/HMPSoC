# Operating the Testbench

1. Open `/IP_integrated/CS701.qpf`.
2. Open Modelsim for Intel FPGA Starter Edition.
   a. Compile `testtoplevel`, `testadcasp`, and `avgasp`.
   b. In the `avgasp` entity, the `WINDOWSIZE` parameter can be manually changed.
3. Simulate `testtoplevel`.
4. Add ADC channels 0, and `avgasp`’s `avg` signal.
5. Simulate for 1ms to see results. Higher window sizes will result in a less varied signal, can be compared within the report.
