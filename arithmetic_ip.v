`include "rca_3.v"
module arithmetic_ip(A,B,M,S,Cout,Sr);
    input [1:0]A,B;
    output [2:0]S;
    input [1:0]M;
    output Cout;
    output [2:0]Sr;
    
    wire G,L,E,x;
    wire [35:0] w;

    comp_2 M1(.A(A), .B(B), .L(L), .G(G), .E(E));

    mux M1(.I({1'b0,1'b1}), .S(M[0]),.Y(x));
    
    assign w[0] = ~B[1] ;
    assign w[1] = ~B[0] ;

    assign w[3] = M[1]&B[0]&w[0];

    assign w[2] = x^B[0];
    assign w[4] = x^B[1];
    assign w[5] = x ^ (1'b0);
    assign w[8]  = ~M[0];
    assign w[9]  = ~M[1];

    assign w[10] = M1&w[8];

    mux M2(.I({1'b0,A[0]}), .S(w[3]),.Y(w[6]));
    mux M3(.I({1'b0,A[1]}), .S(w[3]),.Y(w[7]));
    mux M4(.I({w[6],w[2]}), .S(w[10]),.Y(w[11]));
    mux M5(.I({w[7],w[4]}), .S(w[10]),.Y(w[12]));
    mux M6(.I({1'b0,w[5]}), .S(w[10]),.Y(w[13]));

    rca_3 R1(.A({1'b0,A}),.B({w[13:11]}),.Cin(x), .Coutt(w[17]),.S(w[16:14]));

    assign w[18] = E&M[0];
    assign w[19] = M[1]&B[0]&B[1];

    mux M7(.I({1'b0,A[1]}), .S(w[18]),.Y(w[20]));
    mux M8(.I({1'b1,A[0]}), .S(w[18]),.Y(w[21]));
    mux M9(.I({w[20],1'b0}), .S(w[19]),.Y(w[23]));
    mux M10(.I({w[21],1'b0}), .S(w[19]),.Y(w[22]));

    assign w[24] = ~w[17];
    assign w[25] = w[24]&x;

    assign w[26] = w[25]^w[14];
    assign w[27] = w[25]^w[15];
    assign w[28] = w[25]^w[16];

    rca_3 R2(.A({1'b0,w[23:22]}),.B({w[28:26]}),.Cin(w[25]), .Coutt(w[32]),.S(w[31:29]));

    assign w[33] = M[1]&w[0]&w[1];
    assign w[34] = M[1]&M[0]&L;

    assign w[35]   = w[33] | w[34];

    mux M7(.I({1'b0,w[29]}), .S(w[35]),.Y(S[0]));
    mux M8(.I({1'b1,w[30}), .S(w[35]),.Y(S[1]));
    mux M9(.I({1'b0,w[31]}), .S(w[35]),.Y(S[2]));
    mux M10(.I({1'b0,w[32]}), .S(w[35]),.Y(Cout));

    assign Sr[0] = ~(|S);
    assign Sr[1] = w[9]&M[0]&L;
    assign Sr[2] = w[0]&w[1]&M[0]&M[1];




endmodule