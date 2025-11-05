module tb_priority;
    reg clk, rst_n;
    reg [3:0] req;
    wire [3:0] grant_prio, grant_rr;

    priority_arbiter #(4) u1 (.req(req), .grant(grant_prio));
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst_n = 0;
        req = 4'b0000;
        #12 rst_n = 1;
        #10 req = 4'b1011;
        #50 req = 4'b0101;
        #50 req = 4'b1111;
        #100 req = 4'b0001;
        #50 $finish;
    end

    initial begin
        $monitor("t=%0t req=%b prio=%b rr=%b", $time, req, grant_prio, grant_rr);
    end
endmodule
