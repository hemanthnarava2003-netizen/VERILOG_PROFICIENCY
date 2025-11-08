module tb_odd_sequence_generator;

    reg clk;
    reg rst;
    wire [3:0] out;
    odd_sequence_generator uut (.clk(clk),.rst(rst),.out(out));
    always #5 clk = ~clk;
    initial begin
        $monitor($time, " ns | Output = %b (%0d)", out, out);
    end
    // Stimulus
    initial begin
        // Initialize clock and reset
        clk = 0;
        rst = 1;             // Apply reset
        #10;                 // Hold reset for a while
        rst = 0;             // Release reset
        #200;
        rst = 1;
        #10;
        rst = 0;
        #100;
        $stop;
    end
endmodule
