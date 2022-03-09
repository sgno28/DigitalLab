`timescale 1ps/1ps
`include "reg_file_alu.sv"

module reg_file_alu_tb;
logic [3:0] RA1, RA2, WA;
logic [7:0] external_data_in;
logic clk, reset, RegWrite, ALUSrc;
logic [1:0] ALUControl;
logic [7:0] ALUResult);

reg_file_alu dut (RA1, RA2, WA, external_data_in, clk, reset, RegWrite, ALUSrc, ALUControl, ALUResult);

initial begin 
    clk = 0;
    forever #10 clk = ~clk;
end

endmodule
