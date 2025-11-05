module priority_arbiter #(parameter N = 4) (
    input  wire [N-1:0] req,
    output reg  [N-1:0] grant
);
    integer i;
    always @(*) begin
        grant = 0; 
        begin : prio_loop
            for (i = 0; i < N; i = i + 1) begin
                if (req[i]) begin
                    grant = 1 << i;
                    disable prio_loop;
                end
            end
        end
    end
endmodule
