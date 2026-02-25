module mux2_1(a,b,sel,y);
input a,b,sel;
output y;
assign y= (~sel & a) |(sel & b);
endmodule

// ---------------- Testbench ----------------

module tb_mux2_1();
    reg a, b, sel;
    wire y;

    mux2_1 k1(a, b, sel, y);

    initial begin
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;
        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;
    end
endmodule
