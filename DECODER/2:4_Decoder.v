
module decoder24_gate(en, a, b, y);
    input en, a, b;
    output [3:0] y;
    wire enb, na, nb;
    not n0(enb, en);
    not n1(na, a);
    not n2(nb, b);
    nand n3(y[0], enb, na, nb);
    nand n4(y[1], enb, na, b);
    nand n5(y[2], enb, a, nb);
    nand n6(y[3], enb, a, b);
endmodule

// ---------------- Testbench for 2:4 Decoder ----------------
module tb_decoder24;
    reg en, a, b;
    wire [3:0] y;

    decoder24_gate uut(en, a, b, y);

    initial begin
        $display("Testing 2:4 Decoder");
        en = 1;

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        en = 0; a = 0; b = 0; #10;

        $display("2:4 Decoder test finished");
        $stop;
    end
endmodule
