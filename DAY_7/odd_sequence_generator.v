module odd_sequence_generator (
    input   clk,   // Clock input
    input   rst,   // Asynchronous reset (active high)
    output  [3:0] out // 4-bit sequence output
);

    // Asynchronous reset and sequence logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset to 0 immediately when rst = 1
            out <= 4'b0000;
        end else begin
            // Generate next value in the sequence
            case (out)
                4'b0000: out <= 4'b0001;  // 0 → 1
                4'b0001: out <= 4'b0011;  // 1 → 3
                4'b0011: out <= 4'b0101;  // 3 → 5
                4'b0101: out <= 4'b0111;  // 5 → 7
                4'b0111: out <= 4'b1001;  // 7 → 9
                4'b1001: out <= 4'b1011;  // 9 → 11
                4'b1011: out <= 4'b1101;  // 11 → 13
                4'b1101: out <= 4'b1111;  // 13 → 15
                4'b1111: out <= 4'b0000;  // 15 → 0 (cycle)
                default: out <= 4'b0000;  // Safety default
            endcase
        end
    end
endmodule
