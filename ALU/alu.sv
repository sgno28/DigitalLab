module alu(input logic [7:0] a,b,
            input logic [1:0] ALUControl,
            output logic [7:0] ALUResult);

always_comb
    case(ALUControl)
    2'b00 : ALUResult = a & b; //and
    2'b01 : ALUResult = a | b; //or
    2'b10 : ALUResult = a + b;  //add
    2'b11 : ALUResult = a - b;  //subtract
    default : ALUResult = 8'bx;
end

endmodule