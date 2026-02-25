// ---------------- Gate-Level Full Subtractor ----------------
module full_subtractor_gate(a, b, bin, diff, borrow);
input a, b, bin;
output diff, borrow;
wire w1, w2, w3;
xor g1(w1, a, b);
xor g2(diff, w1, bin);
and g3(w2, ~a, b);
and g4(w3, ~w1, bin);
or  g5(borrow, w2, w3);
endmodule


// ---------------- Dataflow Full Subtractor ----------------
module full_subtractor_dataflow(a, b, bin, diff, borrow);
input a, b, bin;
output diff, borrow;
assign diff   = a ^ b ^ bin;
assign borrow = (~a & b) | ((~(a ^ b)) & bin);
endmodule


// ---------------- Behavioral Full Subtractor ----------------
module full_subtractor_behavioral(a, b, bin, diff, borrow);
input a, b, bin;
output reg diff, borrow;
always @(a or b or bin)
begin
    diff   = a ^ b ^ bin;
    borrow = (~a & b) | ((~(a ^ b)) & bin);
end
endmodule


// ---------------- Testbench ----------------
module tb_full_subtractor;
reg a, b, bin;
wire diff, borrow;

// Choose which version to simulate
full_subtractor_gate uut(a, b, bin, diff, borrow);
// full_subtractor_dataflow   uut(a, b, bin, diff, borrow);
// full_subtractor_behavioral uut(a, b, bin, diff, borrow);

initial begin
    $display("A B BIN | DIFF BORROW");
    a=0; b=0; bin=0; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
    a=0; b=0; bin=1; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
    a=0; b=1; bin=0; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
    a=0; b=1; bin=1; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
    a=1; b=0; bin=0; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
    a=1; b=0; bin=1; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
    a=1; b=1; bin=0; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
    a=1; b=1; bin=1; #10 $display("%b %b %b | %b %b", a, b, bin, diff, borrow);
end
endmodule
