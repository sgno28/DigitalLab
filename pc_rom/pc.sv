module pc(input logic  clk, reset,
        output logic [7:0] count);

always_ff @(posedge clk) begin 
    if (reset) count <=8'b0; //if high reset, count = 0
    else count <= count + 1; //else count increases
end
endmodule

