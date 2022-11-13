`include "rca_3.v"
module arithmetic_ip(A,B,M,S,Cout,Sr);
    input [1:0]A,B;
    output [2:0]S;
    input [1:0]M;
    output Cout;
    output [2:0]Sr;
    
    wire G,L,E;

    comp_2 M1(.A(A), .B(B), .L(L), .G(G), .E(E));

endmodule