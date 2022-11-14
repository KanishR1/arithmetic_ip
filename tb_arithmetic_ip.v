module tb_arithmetic;
    reg [1:0]A,B;
    wire [2:0]S;
    reg [1:0]M;
    wire Cout;
    wire [2:0]Sr;

    arithmetic_ip DUT(.A(A),.B(B),.M(M),.S(S),.Cout(Cout),.Sr(Sr));

    integer i,j,k;
    initial begin
        $dumpfile("output.vcd");
        $dumpvars(0,tb_arithmetic);

        for (i=0; i<4; i=i+1) begin
            for(j=0; j<4; j=j+4) begin
              for(k=0; k<4 ; k=k+4) begin
                M = i;
                A = j;
                B = k;
            end
        end
        $monitor("M = %b, A = %b, B = %b, Cout = %b, R = %b",M,A,B,Cout,S);
    end

endmodule