module tb_comp;
    reg [1:0]A,B;
    wire L,E,G;

    comp_2 DUT(.A(A), .B(B), .L(L), .E(E), .G(G));
    
    integer i,j;
    initial begin
        $dumpfile("tb_comp.vcd");
        $dumpvars(0,tb_comp);
        for (i=0 ; i<4; i= i+1)
        begin
          for(j=0; j<4; j = j+1 )
          begin
            A = i;
            B = j;
            #10;
          end
        end
        $finish();
    end

endmodule