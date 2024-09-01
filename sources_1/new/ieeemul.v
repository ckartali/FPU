`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 23:10:23
// Design Name: 
// Module Name: ieeemul
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


module ieeemul(output reg [31:0] ans,
    input clk,
    input [31:0] A,
    input [31:0] B
    );
reg [47:0]inter;
always @ (posedge clk)
begin
if(A ==0 | B==0)
ans=0;
else
begin
    ans[31]=A[31]^B[31];
    inter[47:0]={1'b1,A[22:0]}*{1'b1,B[22:0]};
    if (inter[47]==1)
        begin
        ans[30:23]=(A[30:23]+B[30:23]-8'd126);
        ans[22:0]=inter[46:24];
        end
    else
    begin
        ans[30:23]=(A[30:23]+B[30:23]-8'd127);
        ans[22:0]=inter[45:23];
        end
    end
end
endmodule
