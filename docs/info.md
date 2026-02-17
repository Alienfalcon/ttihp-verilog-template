<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is an up counter with an active-low reset, rst_n, and an enable pin: ena.
The maximum is controlled by the ui[7:0] and the output of the counter is uo[7:0].
The done signal is uio[0]. The rest of the uio pins do nothing in the design. 

## How to test

1. set rst_n to 0.
2. set ena to 1.
3. set a maximum counting limit with ui[7:0]
4. set rst_n to 1 and watch the counter count.
5. The counter should reach the maximum but never go over it; instead, it should reset to 0 and output a done signal. 

## External hardware

No external hardware at the moment. 
