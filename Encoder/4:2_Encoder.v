module Encoder4_2(D0, D1, D2, D3, Y1, Y0);
    input D0, D1, D2, D3;
    output Y1, Y0;
    or g1(Y1, D2, D3);
    or g2(Y0, D1, D3);

endmodule

// ---------------- Testbench ----------------
module tb_Encoder4_2;
    reg D0, D1, D2, D3;
    wire Y1, Y0;

    Encoder4_2 uut(D0, D1, D2, D3, Y1, Y0);

    initial begin
        $display("Testing 4:2 Encoder");
        D0 = 1; D1 = 0; D2 = 0; D3 = 0; #10;
        D0 = 0; D1 = 1; D2 = 0; D3 = 0; #10;
        D0 = 0; D1 = 0; D2 = 1; D3 = 0; #10;
        D0 = 0; D1 = 0; D2 = 0; D3 = 1; #10;
        $display("4:2 Encoder test finished");
    end
endmodule
