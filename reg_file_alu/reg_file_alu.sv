`include "reg_file.sv"//including the files used for reg and alu
`include "alu.sv"

module reg_file_alu(input logic [3:0] RA1, RA2, WA,
        input logic [7:0] external_data_in,
        input logic clk, reset, RegWrite, ALUSrc,
        input logic [1:0] ALUControl,
        output logic [7:0] ALUResult);

logic [7:0] RD1, RD2, SrcA, SrcB;

reg_file reg_file(.RA1(RA1), .RA2(RA2), .WA(WA), .data_in(ALUResult),
                .clk(clk), .reset(reset), .write_enable(RegWrite),
                .data_out1(RD1), .data_out2(RD2));
                
alu alu(.a(SrcA), .b(SrcB), .ALUControl(ALUControl), 
        .ALUResult(ALUResult));

assign SrcA = RD1;

always_comb
    case(ALUSrc)
    1'b0:
        SrcB = RD2;
    1'b1:
        SrcB = external_data_in;
    default:
        SrcB = 8'bx;
    endcase

endmodule
