`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 23:27:46
// Design Name: 
// Module Name: FPU
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


module FPU(
    input clk,
    input [31:0] A,
    input [31:0] B,
    input [2:0] OPC,
    output [31:0] OUT,
    output AEB,
    output ALB,
    output AGB
    );
wire clk1,clk2,clk3,clk4,clk5;
wire [31:0]o1,o2,o3,o4;
wire aeb,alb,agb;
control X1(clk,OPC,clk1,clk2,clk3,clk4,clk5);
ieeesub X2(1'b0,o1,clk1,A,B);
ieeesub X3(1'b1,o2,clk2,A,B);
ieeemul x4(o3,clk3,A,B);
ieeedivision x5(o4,A,B,clk4);
ieecomp x6(aeb,agb,alb,clk5,A,B);
finalmux x7(o1,o2,o3,o4,aeb,agb,alb,OPC,OUT,AEB,AGB,ALB);


 
endmodule
