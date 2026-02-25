// ---------------- 1-bit MUX ----------------
module MUX1(a, b, sel, y);
input a, b, sel;
output y;
assign y = sel ? b : a;
endmodule

// ---------------- 4-bit MUX ----------------
module MUX4(a, b, sel, y);
input [3:0] a, b;
input sel;
output [3:0] y;
assign y = sel ? b : a;
endmodule

// ---------------- 16-bit Carry Select Adder ----------------
module CSA16(a, b, cin, s);
input [15:0] a, b;
input cin;
output [16:0] s;
wire [3:0] sum01, sum02, sum03, sum11, sum12, sum13;
wire c1, c2, c3, c4, c5, c6, c7, c8, c9;
RCA4 k1(a[3:0], b[3:0], cin, c1, s[3:0]);
RCA4 k2(a[7:4], b[7:4], 1'b0, c2, sum01);
RCA4 k3(a[7:4], b[7:4], 1'b1, c3, sum11);
MUX4 k4(sum01, sum11, c1, s[7:4]);
MUX1 k5(c2, c3, c1, c4);

RCA4 k6(a[11:8], b[11:8], 1'b0, c5, sum02);
RCA4 k7(a[11:8], b[11:8], 1'b1, c6, sum12);
MUX4 k8(sum02, sum12, c4, s[11:8]);
MUX1 k9(c5, c6, c4, c7);

RCA4 k10(a[15:12], b[15:12], 1'b0, c8, sum03);
RCA4 k11(a[15:12], b[15:12], 1'b1, c9, sum13);
MUX4 k12(sum03, sum13, c7, s[15:12]);
MUX1 k13(c8, c9, c7, s[16]);
endmodule

// ---------------- Testbench ----------------
module tb_CSA16;
reg [15:0] a, b;
reg cin;
wire [16:0] s;
reg [16:0] expected;
integer i;

CSA16 uut(a, b, cin, s);
initial begin
    $display("Random Test for 16-bit CSA");
    for (i = 0; i < 50; i = i + 1) begin
        a   = $random % 65536;
        b   = $random % 65536;
        cin = $random % 2;
        #10; // wait for outputs
        expected = a + b + cin;
        if (s !== expected) begin
            $display("Mismatch! A=%b B=%b Cin=%b | SUM=%b | Expected=%b", 
                      a, b, cin, s, expected);
        end
    end
    $display("CSA16 Testbench finished.");
end
endmodule
