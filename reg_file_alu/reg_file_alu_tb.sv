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

initial begin
    $dumpfile("reg_file_alu_tb.vcd");
    $dumpvars(0, reg_file_alu_tb);
    reset = 1;
    #10 reset = 0;
    #10 write_enable = 1;
    #10 external_data_in = 0; ALUSrc = 1; ALUControl =  2'b00; WA = 1; //use reg 1 to add external
    #10 external_data_in = 1; ALUSrc = 1; ALUControl =  2'b01; WA = 2; //data of 1 should be stored in reg 2
    #write_enable = 0;
    #10 RA1 = 1; RA2 = 2; //gets data stored in 1 and 2 (0,1)
    ALUSrc = 0; ALUControl = 2'b10 // adds
    #10;
end

initial begin // Response monitor
    $monitor ("t = %3d | clk = %b | reset = %b | RA1 = %b | RA2 = %b | \
            WA = %b | RegWrite = %b | external_data_in = %b | ALUResult = %b | \
            ALUSrc = %b | ALUControl = %b | ", $time, clk, reset, RA1, RA2, WA,
            RegWrite, external_data_in, ALUResult, ALUSrc, ALUControl);
end

endmodule
