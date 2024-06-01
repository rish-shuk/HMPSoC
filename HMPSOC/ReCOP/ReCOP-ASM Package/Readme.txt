MrASM is an assembler originally developed for ReMiC by
Ravikesh Chandra. 

Read "MrASM.pdf" for how to use the assembler, although a simple version of how to use the Assembler is provided in separate PDF document.

We are using a version of this assembler for ReCOP programs where it targets original ReCOP architecture and ISA. 

Conventions on instructions definitions in new.ini file are provided in MrASM.pdf file, as well as some general aspects of sassily control and use of pseudo-instructions.

If you want to further customise the Assembler for specific customisation of ReCOP, you can get the full package on request under the condition that you provide source and EXE version of the customised assembler to Prof Salcic.


1 Important Changes (refer to ReMIC processor)
-------------------
* The command line options have changed from
  eg. $ ./mrasm test.asm -otest
  to
  $ ./mrasm test.asm -o test
  Note the space between "-o" and "test". This change was
  made for easy reading.
* When specifying a register, any number beyond R7 is now
  invalid as there are only 8 (R0~R7) general purpose
  registers.
* Signals previously limited up to S9 has been extended to S15.
  Signals now start from S0~S15.
* MrASM previously generates debugging files with .txt extension
  filename, it has been changed to .dbg. ReMicSimGUI's source
  viewer requires reading the parsed assembly source, and hence
  MrASM creates .txt files for ReMicSimGUI. Both .dbg and .txt
  are essentially the same, only differs in that .txt file does
  not contain assembly directives such as EQU.



2 Compiling MrASM
-----------------
Compiling MrASM requires "flex" and "bison" packages, it is
recommended to compile in cygwin. Note if compile fails in cygwin,
latest "flex" package needs to be compiled from source and installed
in order to successfully compile MrASM.

To compile from source:
1) make sure cygwin is installed.
2) make sure flex and bison are installed for cygwin.
3) copy "mrasm" to the desired place.
4) start up a cygwin shell.
5) change to "mrasm" directory.
   /cygdrive/c/Temp $ cd mrasm
6) create a build folder where build files will be stored and
   change directory into it.
   /cygdrive/c/Temp/mrasm $ mkdir mrasm-build
   /cygdrive/c/Temp/mrasm $ cd mrasm-build
7) use CMake to create Makefiles.
   /cygdrive/c/Temp/mrasm/mrasm-build $ cmake -G "Unix Makefiles" ..
   /cygdrive/c/Temp/mrasm/mrasm-build $ make
   /cygdrive/c/Temp/mrasm/mrasm-build $ src/mrasm.exe

To compile from source in GNU/Linux:
1) copy "mrasm" to the desired place.
2) change to "mrasm" directory.
   ~ $ cd mrasm
3) create a build folder where build files will be stored and
   change directory into it.
   ~/mrasm $ mkdir mrasm-build
   ~/mrasm $ cd mrasm-build
4) use CMake to create Makefiles.
   ~/mrasm/mrasm-build $ cmake ..
   ~/mrasm/mrasm-build $ make
   ~/mrasm/mrasm-build $ src/mrasm
