module simple_register (
    input   clk,     
    input   data_in,   
    output   data_out   
);
    always @(posedge clk) begin
        data_out <= data_in;  
    end
endmodule
