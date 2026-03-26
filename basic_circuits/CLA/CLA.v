module CLA(A,B,Cin,S,Cout);
input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;

wire [3:0] P, G;
wire C1, C2, C3;

assign P = A ^ B;
assign G = A & B;

assign C1 = G[0] | (P[0] & Cin);
assign C2 = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Cin);
assign C3 = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Cin);
assign Cout = G[3] | (P[3] & C3);


assign S[0] = P[0] ^ Cin;
assign S[1] = P[1] ^ C1;
assign S[2] = P[2] ^ C2;
assign S[3] = P[3] ^ C3;

endmodule


//////////////TESTBENCH////////////////
module CLA_TB();
reg [3:0] A, B;
reg Cin;
wire [3:0] S;
wire Cout;

integer i;
reg [4:0] expected;  


CLA k1(A, B, Cin, S, Cout);

initial begin
  $display(" A     B     Cin |  S     Cout | Expected  | Status");

    for(i = 0; i < 20; i = i + 1) begin

        A = $random % 16;
        B = $random % 16;
        Cin = $random % 2;
        #5;
      
        expected = A + B + Cin;
        #5;

        if ({Cout, S} === expected)
            $display("%b  %b   %b  |  %b   %b | %b | PASS",
                      A, B, Cin, S, Cout, expected);
        else
            $display("%b  %b   %b  |  %b   %b | %b | FAIL",
                      A, B, Cin, S, Cout, expected);

        #10;
    end

    $finish;
end


endmodule
