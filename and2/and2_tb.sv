`timescale 1ns/1ps
`include "and2.sv"

module and2_tb;

logic a, b, y;

and2 dut (a, b, y);

initial begin
    $dumpfile("and2_tb.vcd");
    $dumpvars(0, and2_tb);

    a = 0; b = 0;  #20;
    b = 1; #20;
    a = 1; #20;
    b = 0; #20;
end

initial begin 
    $monitor("t = %3d, a = %b, b = %b, y = %b \n", $time, a, b, y);
end

endmodule