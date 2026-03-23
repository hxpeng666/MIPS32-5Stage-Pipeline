`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:40:33 12/22/2024
// Design Name:   CPU
// Module Name:   F:/experiment/ex2/CPU_t.v
// Project Name:  ex2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_t;

   reg clk,reset;
   wire [31:0] PC,Inst,Result;
   CPU uut(
   .clk(clk),
   .reset(reset),
   .PC(PC),
   .Inst(Inst),
   .Result(Result)
   );
   initial begin
   clk=0;
   reset=0;
   #20
   reset=1;
   end
   always#10
   clk=~clk;
endmodule
