`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:13:08 12/22/2024
// Design Name:   ID_EXE_R
// Module Name:   F:/experiment/ex2/ID_EXE_R_t.v
// Project Name:  ex2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_EXE_R
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ID_EXE_R_t;

	// Inputs
	reg CLK;
	reg Reset;
	reg ID_MemtoReg;
	reg ID_MemWr;
	reg [2:0] ID_ALUctr;
	reg [31:0] ID_Rw;
	reg [31:0] ID_A2;
	reg [31:0] ID_B2;
	reg [31:0] ID_B;
	reg ID_RegWr;

	// Outputs
	wire EXE_MemtoReg;
	wire EXE_MemWr;
	wire [2:0] EXE_ALUctr;
	wire [31:0] EXE_Rw;
	wire [31:0] EXE_A2;
	wire [31:0] EXE_B2;
	wire [31:0] EXE_B;
	wire EXE_RegWr;

	// Instantiate the Unit Under Test (UUT)
	ID_EXE_R uut (
		.CLK(CLK), 
		.Reset(Reset), 
		.ID_MemtoReg(ID_MemtoReg), 
		.ID_MemWr(ID_MemWr), 
		.ID_ALUctr(ID_ALUctr), 
		.ID_Rw(ID_Rw), 
		.ID_A2(ID_A2), 
		.ID_B2(ID_B2), 
		.ID_B(ID_B), 
		.EXE_MemtoReg(EXE_MemtoReg), 
		.EXE_MemWr(EXE_MemWr), 
		.EXE_ALUctr(EXE_ALUctr), 
		.EXE_Rw(EXE_Rw), 
		.EXE_A2(EXE_A2), 
		.EXE_B2(EXE_B2), 
		.EXE_B(EXE_B), 
		.ID_RegWr(ID_RegWr), 
		.EXE_RegWr(EXE_RegWr)
	);

// 时钟信号生成
    always #5 CLK = ~CLK; // 时钟周期为10ns

    // 测试程序
    initial begin
        // 初始化信号
        CLK = 0;
        Reset = 0;
        ID_MemtoReg = 0;
        ID_MemWr = 0;
        ID_ALUctr = 3'b000;
        ID_Rw = 32'b0;
        ID_A2 = 32'b0;
        ID_B = 32'b0;
        ID_B2 = 32'b0;
        ID_RegWr = 0;

        // 模拟复位信号，观察模块是否正确清零
        #10 Reset = 0;
        #10;

        // 释放复位信号，输入数据并观察输出
        Reset = 1;
        #10 ID_MemtoReg = 1; ID_MemWr = 1; ID_RegWr = 1; ID_ALUctr = 3'b101;
            ID_Rw = 32'h12345678; ID_A2 = 32'h87654321; ID_B = 32'hDEADBEEF; ID_B2 = 32'hABCDEF12;
        #10 ID_MemtoReg = 0; ID_MemWr = 0; ID_RegWr = 0; ID_ALUctr = 3'b011;
            ID_Rw = 32'hFEDCBA98; ID_A2 = 32'h89ABCDEF; ID_B = 32'h12345678; ID_B2 = 32'h13579BDF;
        
        // 再次复位，检查输出是否清零
        #10 Reset = 0;
        #10;

        // 停止仿真
        $stop;
    end

    // 仿真结果输出
    initial begin
        $monitor("Time: %0dns, CLK: %b, Reset: %b, ID_Rw: %h, ID_A2: %h, ID_B: %h, ID_B2: %h, EXE_Rw: %h, EXE_A2: %h, EXE_B: %h, EXE_B2: %h",
                 $time, CLK, Reset, ID_Rw, ID_A2, ID_B, ID_B2, EXE_Rw, EXE_A2, EXE_B, EXE_B2);
    end

endmodule
