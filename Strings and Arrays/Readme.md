A little note about QtSpim and arrays.

The general method to declare arrays in MIPS is to use .byte or .word and then specify the elements separated by commas. 
For some reason the simulator classifies this as an error, and accepts only space separated elements. 
I believe the Mars simulator is free of this issue, so the same code might work with Mars while it may not work on QtSpim.
Just a heads-up in case you might be using some code borrowed from the internet and can't figure out why it isn't working on your system.
