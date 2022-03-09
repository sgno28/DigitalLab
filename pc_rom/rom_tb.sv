`timescale 1ps/1ps
`include "rom.sv"

module rom_tb;
logic [7:0] address;
logic [23:0] data_out;
rom dut (address, data_out);

initial begin
    $dumpfile("rom_tb.vcd"); 
    $dumpvars(0, rom_tb); 
    address = 0;
    for (int i = 1; i <= 3; i++) // only an output of non x will show for first 4 addresses. Can extend to 255 for full size of the rom
        #10 address = address + 1;
end

initial begin
$monitor("address = %b, data_out = %h \n", address, data_out);
end

endmodule