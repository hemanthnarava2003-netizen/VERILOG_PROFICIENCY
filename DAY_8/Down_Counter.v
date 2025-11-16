module DFF (
    input wire D,
    input wire clk,
    input wire reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

// ===============================
// 4-bit Down Counter using DFFs
// ===============================
module DownCounter4 (
    input wire clk,
    input wire reset,
    output wire [3:0] Q
);
    wire [3:0] D;

    assign D[0] = ~Q[0];
    assign D[1] = Q[1] ^ ~Q[0];
    assign D[2] = Q[2] ^ (~Q[1] & ~Q[0]);
    assign D[3] = Q[3] ^ (~Q[2] & ~Q[1] & ~Q[0]);

    DFF ff0 (.D(D[0]), .clk(clk), .reset(reset), .Q(Q[0]));
    DFF ff1 (.D(D[1]), .clk(clk), .reset(reset), .Q(Q[1]));
    DFF ff2 (.D(D[2]), .clk(clk), .reset(reset), .Q(Q[2]));
    DFF ff3 (.D(D[3]), .clk(clk), .reset(reset), .Q(Q[3]));
endmodule
