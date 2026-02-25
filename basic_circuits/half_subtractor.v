// ---------------- Gate-Level Half Subtractor ----------------
module half_subtractor_gate(a, b, diff, borrow);
input a, b;
output diff, borrow;
xor g1(diff, a, b);
and g2(borrow, ~a, b);
endmodule


// ---------------- Dataflow Half Subtractor ----------------
module half_subtractor_dataflow(a, b, diff, borrow);
input a, b;
output diff, borrow;
assign diff   = a ^ b;
assign borrow = (~a) & b;
endmodule


// ---------------- Behavioral Half Subtractor ----------------
module half_subtractor_behavioral(a, b, diff, borrow);
input a, b;
output reg diff, borrow;
always @(a or b)
begin
    diff   = a ^ b;
    borrow = (~a) & b;
end
endmodule


// ---------------- Testbench ----------------
module tb_half_subtractor;
reg a, b;
wire diff, borrow;

// Choose which version to simulate
half_subtractor_gate       uut(a, b, diff, borrow);
// half_subtractor_dataflow   uut(a, b, diff, borrow);
// half_subtractor_behavioral uut(a, b, diff, borrow);

initial begin
    $display("A B | DIFF BORROW");
    a=0; b=0; #10 $display("%b %b | %b %b", a, b, diff, borrow);
    a=0; b=1; #10 $display("%b %b | %b %b", a, b, diff, borrow);
    a=1; b=0; #10 $display("%b %b | %b %b", a, b, diff, borrow);
    a=1; b=1; #10 $display("%b %b | %b %b", a, b, diff, borrow);
end
endmodule
