module pram_localparam #(
    parameter WIDTH = 8      
)(
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    output wire [WIDTH-1:0] sum
);
   
    localparam LENGTH = 4;

    assign sum = a + b;

    initial begin
        $display("=====================================");
        $display("PARAMETERIZED ADDER SIMULATION");
        $display("WIDTH  = %0d", WIDTH);
        $display("LENGTH = %0d", LENGTH);
        $display("=====================================");
    end

endmodule
