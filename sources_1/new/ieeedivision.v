`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 07:27:59
// Design Name: 
// Module Name: ieeedivision
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


module ieeedivision(
    output reg [31:0] out,
    input [31:0] A,
    input [31:0] B,
    input clk
    );
reg [26:0]X,Y,Z,W,V;
reg [3:0]Q;
reg [26:0]M;
//reg [23:0]S;
//reg [25:0]X,Y;
//reg [4:0]j,j_baf;
reg k;
always @ (posedge clk)
begin
    out[31]=A[31]^B[31];
//    i=24;X=0;Q=0;j=24;j_baf=0;Y=32'd1;
//    Z={1'b1,A[23:1]};
//    P={1'b1,B[23:1]};
//    for(i=24;i>0;i=i-1)
//        begin
//        if(X+(P<<i)<=Z)
//            X=X+X+(P<<i);
//            Q=Q|(Y<<i);
//        end
//        out[32]=A[32]^B[32];
   // X=0;Q=0;j=24;j_baf=0;Y=32'd1;
  //  j=0;j_baf=0;
    X={1'b1,25'd0}-{3'b001,B[22:0]};
    Y={1'b1,25'd0}-(2*{3'b001,B[22:0]});
    Z={1'b1,25'd0}-(3*{3'b001,B[22:0]});
    W={1'b1,25'd0}-(4*{3'b001,B[22:0]});
    V={1'b1,25'd0}-(5*{3'b001,B[22:0]});
    if(X[26]==1)
        Q=3'd0;
    else if(Y[26]==1)
        Q=3'd1;
    else if(Z[26]==1)
        Q=3'd2;
    else if(W[26]==1)
        Q=3'd3;
    else if(V[26]==1)
        Q=3'd4;
   // else if(
   
    M={1'b1,A[22:0]}*Q;
   // P=M>>5'd25;
    //S=M[26:0];
//    k=0;
//                   for (j=0;j<24;j=j+1)
//                        begin
//                            if((S[23-j]==1) && (k==0)) 
//                                begin
//                                 j_baf=j;
//                                 k=1;
//                                 end
//                          end
//                      P[22:0]=Q[23:0]<<(j_baf);
//                      out[22:0]=P[22:0];
                     // out[30:23]=A[30:23]+B[30:23]+8'd127-j_baf;
          out[30:23]=(M[26]==1) ? (A[30:23]-B[30:23]+8'd126) :(A[30:23]-B[30:23]+8'd127);
          out[22:0]=(M[26]==1)  ? M[25:3] : M[24:2];
                     //out[30:23]=A[30:23]+B[30:23]+8'd127-(j_baf);  
                      
end    
endmodule
