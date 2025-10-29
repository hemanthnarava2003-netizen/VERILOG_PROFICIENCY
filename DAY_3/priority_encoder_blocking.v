module priority_encoder_blocking (
  input  wire [3:0] a,  
  output reg  [1:0] y, 
    output reg valid 
);
    always @(*) begin
        valid = 0;
        y = 2'b00;
       if (a[3]) begin
            y = 2'b11;
            valid = 1;
        end
        else if (a[2]) begin
            y = 2'b10;
            valid = 1;
        end
        else if (a[1]) begin
            y = 2'b01;
            valid = 1;
        end
        else if (a[0]) begin
            y = 2'b00;
            valid = 1;
        end
    end
endmodule 
