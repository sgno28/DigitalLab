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
    #15 RegWrite = 1;

    #20 WA = 1; external_data_in = 0; ALUSrc = 1'b1; ALUControl = 2'b00; //0 written into reg 1
    #20 WA = 2; external_data_in = 1; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //1 written into reg 2

    #20 WA = 5; external_data_in = 5; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //5 written into reg 5
    #20 WA = 4; external_data_in = 4; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //4 written into reg 4

    #20 WA = 3; external_data_in = 3; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //3 written into reg 3
    #20 WA = 6; external_data_in = 2; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //2 written into reg 6

    #20 WA = 7; external_data_in = 10; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //10 written into reg 7 
    #20 WA = 9; external_data_in = 20; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //20 written into reg 9

    #20 WA = 10; external_data_in = 15; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //15 written into reg 10
    #20 WA = 11; external_data_in = 8; RA1 = 1; ALUSrc = 1'b1; ALUControl = 2'b01; //8 written into reg 11

    #20 RegWrite = 0;

    #20 RA1 = 5; RA2 = 4; ALUSrc = 1'b0; ALUControl = 2'b10; //add 5 and 4
    #20 RA1 = 5; RA2 = 4; ALUSrc = 1'b0; ALUControl = 2'b11; //subtract 4 from 5

    #20 RA1 = 1; RA2 = 2; ALUSrc = 1'b0; ALUControl = 2'b00; //and 1 and 0
    #20 RA1 = 1; RA2 = 2; ALUSrc = 1'b0; ALUControl = 2'b01; //or 1 and 0

    #20 RA1 = 3; RA2 = 6; ALUSrc = 1'b0; ALUControl = 2'b10; //add 3 and 2
    #20 RA1 = 3; RA2 = 6; ALUSrc = 1'b0; ALUControl = 2'b11; //subtract 2 from 3

    #20 RA1 = 9; RA2 = 7; ALUSrc = 1'b0; ALUControl = 2'b10; //add 10 and 20
    #20 RA1 = 9; RA2 = 7; ALUSrc = 1'b0; ALUControl = 2'b11; //subtract 10 from 20

    #20 RA1 = 10; RA2 = 11; ALUSrc = 1'b0; ALUControl = 2'b10; //add 15 and 8
    #20 RA1 = 10; RA2 = 11; ALUSrc = 1'b0; ALUControl = 2'b11; //subtract 8 from 15
    #30;
    $finish;
end

initial begin // Response monitor
    $monitor ("t = %3d | clk = %b | reset = %b | RA1 = %b | RA2 = %b | \
            WA = %b | RegWrite = %b | external_data_in = %b | ALUResult = %b | \
            ALUSrc = %b | ALUControl = %b | ", $time, clk, reset, RA1, RA2, WA, 
            RegWrite, external_data_in, ALUResult, ALUSrc, ALUControl);
end

endmodule
