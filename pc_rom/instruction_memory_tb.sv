`timescale 1ps/1ps
`include "instruction_memory.sv"

module instruction_memory_tb;
logic clk, reset;
logic [23:0] Instr;

instruction_memory_tb dut (clk, reset, Instr);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("instruction_memory_tb.vcd"); 
    $dumpvars(0, instruction_memory_tb);

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
    $monitor("t = %3d, clk = %b, reset = %b, Instr = %b \n", $time, clk, reset, Instr);
end

endmodule
