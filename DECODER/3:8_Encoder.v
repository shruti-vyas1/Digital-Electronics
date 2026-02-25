module decoder_3_8_dataflow (
    input wire [2:0] A,
    output wire [7:0] Y
);

    assign Y[0] = (~A[2] & ~A[1] & ~A[0]);
    assign Y[1] = (~A[2] & ~A[1] &  A[0]);
    assign Y[2] = (~A[2] &  A[1] & ~A[0]);
    assign Y[3] = (~A[2] &  A[1] &  A[0]);
    assign Y[4] = ( A[2] & ~A[1] & ~A[0]);
    assign Y[5] = ( A[2] & ~A[1] &  A[0]);
    assign Y[6] = ( A[2] &  A[1] & ~A[0]);
    assign Y[7] = ( A[2] &  A[1] &  A[0]);
endmodule

// ---------------- Testbench ----------------
module tb_decoder3_8_dataflow;
    reg [2:0] A;
    wire [7:0] Y;

  decoder_3_8_dataflow uut(A,Y);
    integer i;

    initial begin
        $display("Testing 3:8 Decoder (Dataflow)");
        for (i = 0; i < 8; i = i + 1) begin
            A = i;
            #10;
            $display("A = %b -> Y = %b", A, Y);
        end
        $display("3:8 Decoder (Dataflow) test finished");
        $stop;
    end
endmodule
