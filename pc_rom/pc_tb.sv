`timescale 1ps/1ps
`include "pc.sv"

module pc_tb;
logic clk, reset;
logic [7:0] count;

pc dut (clk, reset, count);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("pc_tb.vcd"); 
    $dumpvars(0, pc_tb);

    reset = 1; clk = 0;
    #15 reset = 0;
    for (int i = 0; i < 20; i++) begin
        #10;
        if (i == 10)
            reset = 1;
        else 
            reset = 0;
    end
    $finish;
end

initial begin
    $monitor("t = %3d, clk = %b, reset = %b, count = %b \n", $time, clk, reset, count);
end
endmodule