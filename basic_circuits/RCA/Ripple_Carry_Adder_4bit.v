// ---------------- 1-bit Full Adder Module ----------------
module FA(a, b, cin, cout, s);
input a, b, cin;
output cout, s;
wire w1, w2, w3, w4, w5;
xor g1(w1, a, b);
xor g2(s, w1, cin);
and g3(w2, a, b);
and g4(w3, b, cin);
and g5(w4, a, cin);
or  g6(cout, w2, w3, w4);
endmodule


// ---------------- 4-bit Ripple Carry Adder ----------------
module RCA4(a, b, cin, cout, s);
input [3:0] a, b;
input cin;
output [3:0] s;
output cout;
wire c1, c2, c3;

FA f1(a[0], b[0], cin, c1, s[0]);
FA f2(a[1], b[1], c1, c2, s[1]);
FA f3(a[2], b[2], c2, c3, s[2]);
FA f4(a[3], b[3], c3, cout, s[3]);
endmodule


// ---------------- Testbench ----------------
module RCA4_TB;
reg [3:0] a, b;
reg cin;
wire [3:0] s;
wire cout;
integer i;
reg [4:0]; 

RCA4 uut(a, b, cin, cout, s);

initial begin
    $display("Random Test for 4-bit RCA");
    
    for (i = 0; i < 20; i = i + 1) begin
        a = $random % 16; 
        b = $random % 16;
        cin = $random % 2;
        #10; 
        expected = a + b + cin; 
        if ({cout, s} !== expected) begin
            $display("Mismatch! A=%b B=%b Cin=%b | SUM=%b Cout=%b | Expected=%b", 
                      a, b, cin, s, cout, expected);
        end
    end
    $display("Testbench finished.");
end
endmodule
