`timescale 1ns/1ps
`include "alu.sv"

module alu_tb;

logic [7:0] a, b;
logic [1:0] ALUControl;
logic [7:0] ALUResult;

alu dut (a, b, ALUControl, ALUResult);

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);

    a = 8'd23;
    b = 8'd23;

    ALUControl = 2'b00; #20;
    ALUControl = 2'b01; #20;
    ALUControl = 2'b10; #20;
    ALUControl = 2'b11; #20;
end

initial begin 
    $monitor("t = %3d, a = %d, b = %d, ALUResult = %d,  ALUControl = %b\n", $time, a, b, ALUResult, ALUControl);
end

endmodule