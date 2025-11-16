module tb_DownCounter4;
    reg clk, reset;
    wire [3:0] Q;

    // Instantiate the counter
    DownCounter4 uut (
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 100 MHz clock (10 ns period)

    // Stimulus
    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%b", $time, reset, Q);
        reset = 1; #10;
        reset = 0;
        #200;
        $stop;
    end
endmodule
