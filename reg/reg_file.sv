module reg_file(input logic [3:0] RA1, RA2, WA,
                input logic [7:0] data_in,
                input logic clk, reset, write_enable,
                output logic [7:0] data_out1, data_out2);

logic [7:0] rf [0:15];

assign data_out1 = rf[RA1];
assign data_out2 = rf[RA2];

always_ff @ (posedge clk)
    if (write_enable)
    rf[WA] <= data_in;
endmodule