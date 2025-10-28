module demux_3_to_8_tb;
    reg data_in;
    reg [2:0] sel;
    wire [7:0] data_out;
    
    demux_3_to_8 dut (.data_in(data_in),.sel(sel),.data_out(data_out));
    initial begin
        $monitor("Time=%0t | sel=%b | data_in=%b | data_out=%b",$time, sel, data_in, data_out);
        data_in = 1;
        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;
        $finish;
    end
endmodule
