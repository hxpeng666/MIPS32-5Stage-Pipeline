`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:41:27 12/22/2024
// Design Name:   FPCPU
// Module Name:   F:/experiment/ex2/FPCPU_t.v
// Project Name:  ex2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module FPCPU_t();
     reg clk,reset;
     wire [31:0] IF_PC,IF_Inst,EXE_Result;
     FPCPU uut(
        .clk(clk),
        .reset(reset),
        .IF_PC(IF_PC),
        .IF_Inst(IF_Inst),
        .EXE_Result(EXE_Result)
     );
     initial begin
        clk=0;
        reset=0;
        #20
        reset=1;
        end
        always #10   clk=~clk;
endmodule
