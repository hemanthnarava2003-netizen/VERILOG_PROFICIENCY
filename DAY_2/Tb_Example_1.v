module tb_param_palocalparam;
    reg  [3:0] a, b;
    wire [3:0] sum;
    param_localparam #(.WIDTH(4)) uut1 (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin     
        a = 8'b0011;   
        b = 8'b0101;   
        #10;

        $display("a = %b, b = %b, sum = %b", a, b, sum);

        #10 $finish;
    end

endmodule
