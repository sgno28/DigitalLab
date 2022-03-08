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

    ALUControl = 2'b00; //and
    a = 8'b00000001;
    b = 8'b00000000; #20;

    ALUControl = 2'b01; //or
    a = 8'b00000001;
    b = 8'b00000001;  #20;

    ALUControl = 2'b10; //add
    a = 8'b00000001;
    b = 8'b00000001; #20;

    ALUControl = 2'b11; //sub
    a = 8'b00000010;
    b = 8'b00000001; #20;

end

initial begin 
    $monitor("t = %3d, a = %b, b = %b, ALUResult = %b,  ALUControl = %b\n", $time, a, b, ALUResult, ALUControl);
end

endmodule