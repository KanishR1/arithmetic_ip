module comp_2 (A,B,L,G,E);
    input [1:0]A,B;
    output L,E,G;
    assign E = (~(A[0]^B[0]))&(~(A[1]^B[1]));
    assign L = (~A[1]&B[1])|((~(A[1]^B[1]))&(~A[0])&B[0]);
    assign G = (A[1]&~B[1])|((~(A[1]^B[1]))&A[0]&(~B[0]));
endmodule