`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 12:31:53
// Design Name: 
// Module Name: ieecomp
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


module ieecomp(output reg AEB=0,output reg AGB=0,output reg ALB=0,
    input clk,
    input [31:0] A,
    input [31:0] B
    );
reg [31:0]D=0;
always @ (posedge clk)
begin
AEB=0;ALB=0;AGB=0;
    if(A[31]^B[31]==0)
        begin
                D=A[30:0]-B[30:0];
                if(D==0)
                    AEB=1'b1;
                else if(D[31]==1)
                    if(A[31]==1)
                    ALB=1'b1;
                    else
                    AGB=1'b1;
                else
                    if(A[31]==1)
                    AGB=1'b1;
                    else
                    ALB=1'b1;       
        end
    else
        if(A[31]==1)
                ALB=1'b1;
        else
                AGB=1'b1;
end
endmodule
