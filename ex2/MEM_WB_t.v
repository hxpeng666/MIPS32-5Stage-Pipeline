`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:25:45 12/22/2024
// Design Name:   MEM_WB
// Module Name:   F:/experiment/ex2/MEM_WB_t.v
// Project Name:  ex2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEM_WB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEM_WB_t;

	// Inputs
	reg CLK;
	reg Reset;
	reg MEM_MemtoReg;
	reg [4:0] MEM_Rw;
	reg [31:0] MEM_Result;
	reg [31:0] MEM_MemOut;
	reg MEM_RegWr;

	// Outputs
	wire WB_MemtoReg;
	wire [4:0] WB_Rw;
	wire [31:0] WB_Result;
	wire [31:0] WB_MemOut;
	wire WB_RegWr;

	// Instantiate the Unit Under Test (UUT)
	MEM_WB uut (
		.CLK(CLK), 
		.Reset(Reset), 
		.MEM_MemtoReg(MEM_MemtoReg), 
		.MEM_Rw(MEM_Rw), 
		.MEM_Result(MEM_Result), 
		.MEM_MemOut(MEM_MemOut), 
		.WB_MemtoReg(WB_MemtoReg), 
		.WB_Rw(WB_Rw), 
		.WB_Result(WB_Result), 
		.WB_MemOut(WB_MemOut), 
		.MEM_RegWr(MEM_RegWr), 
		.WB_RegWr(WB_RegWr)
	);

// 时钟信号生成
    always #5 CLK = ~CLK; // 时钟周期为10ns

    // 测试程序
    initial begin
        // 初始化信号
        CLK = 0;
        Reset = 0;
        MEM_MemtoReg = 0;
        MEM_RegWr = 0;
        MEM_Rw = 5'b0;
        MEM_Result = 32'b0;
        MEM_MemOut = 32'b0;

        // 测试场景 1: 复位信号，所有输出应清零
        #10 Reset = 0; 
        #10;

        // 测试场景 2: 复位解除，输入数据并观察输出
        Reset = 1;
        #10 MEM_MemtoReg = 1; MEM_RegWr = 1; MEM_Rw = 5'b11011;
            MEM_Result = 32'hA5A5A5A5; MEM_MemOut = 32'h5A5A5A5A;
        #10 MEM_MemtoReg = 0; MEM_RegWr = 0; MEM_Rw = 5'b10101;
            MEM_Result = 32'h12345678; MEM_MemOut = 32'h87654321;

        // 测试场景 3: 再次复位信号，所有输出应清零
        #10 Reset = 0;
        #10;

        // 停止仿真
        $stop;
    end

    // 仿真结果输出
    initial begin
        $monitor("Time: %0dns, CLK: %b, Reset: %b, MEM_Result: %h, MEM_MemOut: %h, MEM_Rw: %b, WB_Result: %h, WB_MemOut: %h, WB_Rw: %b",
                 $time, CLK, Reset, MEM_Result, MEM_MemOut, MEM_Rw, WB_Result, WB_MemOut, WB_Rw);
    end

endmodule

