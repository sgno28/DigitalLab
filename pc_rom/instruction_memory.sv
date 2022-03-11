`include "pc.sv"
`include "rom.sv"

module instruction_memory (
    input logic clk, reset,
    output logic [23:0] Instr
);

logic [7:0] PC, A;
pc pc (.clk(clk), .reset(reset), .count(PC));
rom rom(.address(A), .data_out(Instr));
assign A = PC;

endmodule

