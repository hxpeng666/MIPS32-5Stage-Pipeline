`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/29 05:16:35
// Design Name: 
// Module Name: DataMem_t
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DataMem_t();
    reg [31:0] datain;
    reg [4:0] addr;
    reg clk,we;
    wire [31:0] dataout;
    DataMem uut(
    .datain(datain),
    .addr(addr),
    .clk(clk),
    .we(we),
    .dataout(dataout)
    );
    initial begin
    datain=32'h0;
    addr=32'h1;
    clk=0;
    we=0;
    #10
    clk=1;
    we=1;
    #10
    clk=0;
    we=1;
    #10
    clk=1;
    we=0;
    #10
    $stop;
    end
endmodule
