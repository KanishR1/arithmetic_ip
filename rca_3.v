`include "full_adder.v"
module rca_3(A,B,Cin,Coutt,S);
    input [2:0]A,B;
    input Cin;
    output [2:0]S;
    output Coutt;

    wire [1:0]C;

    full_adder M1 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(C[0]));
    full_adder M2 (.A(A[1]), .B(B[1]), .Cin(C[0]), .S(S[1]), .Cout(C[1]));
    full_adder M2 (.A(A[2]), .B(B[3]), .Cin(C[1]), .S(S[2]), .Cout(Coutt));

endmodule