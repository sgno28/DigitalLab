`timescale 1ps/1ps
`include "reg_file_alu.sv"

module reg_file_alu_tb;
logic [3:0] RA1, RA2, WA;
logic [7:0] external_data_in;
logic clk, reset, RegWrite, ALUSrc;
logic [1:0] ALUControl;
logic [7:0] ALUResult;

reg_file_alu dut (RA1, RA2, WA, external_data_in, clk, reset, RegWrite, ALUSrc, ALUControl, ALUResult);

initial begin 
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("reg_file_alu_tb.vcd");
    $dumpvars(0, reg_file_alu_tb);
    RA1 = 0; RA2 = 0; WA = 0; RegWrite = 0; external_data_in = 0; 
    reset = 1; 
    #10 reset = 0;
    #10 RegWrite = 1;
    #10 WA = 1; external_data_in = 0; ALUSrc = 1'b1; ALUControl = 2'b00; //0 written into reg 1
    #10 WA = 2; external_data_in = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //1 written into reg 2
    #10 WA = 5; external_data_in = 5; ALUSrc = 1'b1; ALUControl = 2'b01; //5 written into reg 5
    #10 WA = 4; external_data_in = 4; ALUSrc = 1'b1; ALUControl = 2'b01; //4 written into reg 4
    #10 RegWrite = 0;
    #10 RA1 = 5; RA2 = 4; ALUSrc = 1'b0; ALUControl = 2'b10; //add 5 and 4
    #10 RA1 = 5; RA2 = 4; ALUSrc = 1'b0; ALUControl = 2'b11; //subtract 4 from 5
    #20;
    $finish;
end

initial begin // Response monitor
    $monitor ("t = %3d | clk = %b | reset = %b | RA1 = %b | RA2 = %b | \
            WA = %b | RegWrite = %b | external_data_in = %b | ALUResult = %b | \
            ALUSrc = %b | ALUControl = %b | ", $time, clk, reset, RA1, RA2, WA, 
            RegWrite, external_data_in, ALUResult, ALUSrc, ALUControl);
end

endmodule
