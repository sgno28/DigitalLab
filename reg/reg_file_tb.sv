`timescale 1ps/1ps
`include "reg_file.sv"

module reg_file_tb;
logic [3:0] RA1, RA2, WA;
logic clk, reset, write_enable;
logic [7:0] data_in, data_out1, data_out2;

reg_file dut (RA1, RA2, WA, data_in, clk, reset, write_enable, data_out1, data_out2);

initial begin 
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("reg_file_tb.vcd");
    $dumpvars(0, reg_file_tb);
    RA1 = 1; RA2 = 2; WA = 0; data_in = 5; write_enable = 0;
    reset = 1;
    #10 reset = 0;
    #15 write_enable = 1; //open to write
    #20 WA = 1; data_in = 2;
    #20 WA = 3; data_in = 4;
    #20 WA = 5; data_in = 6;
    #20 WA = 7; data_in = 8;
    #20 WA = 9; data_in = 10;
    #20 WA = 11; data_in = 12;
    #20 WA = 13; data_in = 14;
    #20 WA = 15; data_in = 16;
    #20 write_enable = 0;
    #20 RA1 = 1; RA2 = 3;
    #20 RA1 = 5; RA2 = 7;
    #20 RA1 = 9; RA2 = 11;
    #20 RA1 = 13; RA2 = 15;
    #30;
    $finish;
end

initial begin // Response monitor
    $monitor ("t = %3d|clk = %b|reset = %b|RA1 = %b|RA2 = %b |WA = %b|write_enable = %b|data_in = %b|data_out1 = %b|data_out2 = %b", $time, clk, reset, RA1, RA2, WA, write_enable, data_in, data_out1, data_out2);
end

endmodule
 