`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:18:11 12/22/2024
// Design Name:   EXE_MEM
// Module Name:   F:/experiment/ex2/EXE_MEM_t.v
// Project Name:  ex2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EXE_MEM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EXE_MEM_t;

	// Inputs
	reg CLK;
	reg Reset;
	reg EXE_MemtoReg;
	reg EXE_MemWr;
	reg [31:0] EXE_Result;
	reg [31:0] EXE_B;
	reg [4:0] EXE_Rw;
	reg EXE_RegWr2;

	// Outputs
	wire MEM_MemtoReg;
	wire MEM_MemWr;
	wire [4:0] MEM_Rw;
	wire [31:0] MEM_Result;
	wire [31:0] MEM_B;
	wire MEM_RegWr;

	// Instantiate the Unit Under Test (UUT)
	EXE_MEM uut (
		.CLK(CLK), 
		.Reset(Reset), 
		.EXE_MemtoReg(EXE_MemtoReg), 
		.EXE_MemWr(EXE_MemWr), 
		.EXE_Result(EXE_Result), 
		.EXE_B(EXE_B), 
		.EXE_Rw(EXE_Rw), 
		.MEM_MemtoReg(MEM_MemtoReg), 
		.MEM_MemWr(MEM_MemWr), 
		.MEM_Rw(MEM_Rw), 
		.MEM_Result(MEM_Result), 
		.MEM_B(MEM_B), 
		.EXE_RegWr2(EXE_RegWr2), 
		.MEM_RegWr(MEM_RegWr)
	);

// 时钟信号生成
    always #5 CLK = ~CLK; // 时钟周期为10ns

    // 测试程序
    initial begin
        // 初始化信号
        CLK = 0;
        Reset = 0;
        EXE_MemtoReg = 0;
        EXE_MemWr = 0;
        EXE_RegWr2 = 0;
        EXE_Result = 32'b0;
        EXE_B = 32'b0;
        EXE_Rw = 5'b0;

        // 复位状态，检查是否正确清零
        #10 Reset = 0;
        #10;

        // 释放复位，输入数据并观察输出
        Reset = 1;
        #10 EXE_MemtoReg = 1; EXE_MemWr = 1; EXE_RegWr2 = 1;
            EXE_Result = 32'hA5A5A5A5; EXE_B = 32'h5A5A5A5A; EXE_Rw = 5'b10101;
        #10 EXE_MemtoReg = 0; EXE_MemWr = 0; EXE_RegWr2 = 0;
            EXE_Result = 32'h12345678; EXE_B = 32'h87654321; EXE_Rw = 5'b01010;

        // 再次复位，检查是否清零
        #10 Reset = 0;
        #10;

        // 停止仿真
        $stop;
    end

    // 仿真结果输出
    initial begin
        $monitor("Time: %0dns, CLK: %b, Reset: %b, EXE_Result: %h, EXE_B: %h, EXE_Rw: %h, MEM_Result: %h, MEM_B: %h, MEM_Rw: %h",
                 $time, CLK, Reset, EXE_Result, EXE_B, EXE_Rw, MEM_Result, MEM_B, MEM_Rw);
    end

endmodule
