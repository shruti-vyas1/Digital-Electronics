// ---------------- Gate-Level Full Adder ----------------
module full_adder_gate(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;
wire w1, w2, w3, w4, w5;
nor k1(w1, a, b);
nor k2(sum, w1, cin);
and k3(w2, a, b);
and k4(w3, b, cin);
or  k5(w4, w2, w3);
and k6(w5, cin, a);
or  k7(cout, w4, w5);
endmodule


// ---------------- Dataflow Full Adder ----------------
module full_adder_dataflow(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;
assign sum  = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


// ---------------- Behavioral Full Adder ----------------
module full_adder_behavioral(a, b, cin, sum, cout);
input a, b, cin;
output reg sum, cout;
always @(a or b or cin)
begin
    sum  = a ^ b ^ cin;
    cout = (a & b) | (b & cin) | (a & cin);
end
endmodule


// ---------------- Testbench ----------------
module tb_full_adder;
reg a, b, cin;
wire sum, cout;

// Choose one version to simulate
full_adder_gate       uut(a, b, cin, sum, cout);
// full_adder_dataflow   uut(a, b, cin, sum, cout);
// full_adder_behavioral uut(a, b, cin, sum, cout);

initial begin
    $display("A B Cin | SUM COUT");
    a=0; b=0; cin=0; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
    a=0; b=0; cin=1; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
    a=0; b=1; cin=0; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
    a=0; b=1; cin=1; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
    a=1; b=0; cin=0; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
    a=1; b=0; cin=1; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
    a=1; b=1; cin=0; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
    a=1; b=1; cin=1; #10 $display("%b %b %b | %b %b", a, b, cin, sum, cout);
end
endmodule
