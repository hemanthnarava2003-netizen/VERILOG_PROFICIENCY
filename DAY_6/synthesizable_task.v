module mem_transactor #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 16
)(
    input                     clk,
    input                     rst_n,
    output                     we,
    output  [ADDR_WIDTH-1:0]   addr,
    output  [DATA_WIDTH-1:0]   wdata,
    input   [DATA_WIDTH-1:0]  rdata
);

    // Task: perform a write operation
    task automatic mem_write;
        input [ADDR_WIDTH-1:0] write_addr;
        input [DATA_WIDTH-1:0] write_data;
    begin
        we    = 1'b1;
        addr  = write_addr;
        wdata = write_data;
    end
    endtask

    // Task: perform a read operation
    task automatic mem_read;
        input  [ADDR_WIDTH-1:0] read_addr;
        output [DATA_WIDTH-1:0] read_data;
    begin
        we    = 1'b0;
        addr  = read_addr;
        read_data = rdata;  // combinational read
    end
    endtask
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            we    <= 1'b0;
            addr  <= {ADDR_WIDTH{1'b0}};
            wdata <= {DATA_WIDTH{1'b0}};
        end else begin
            // Example: write and read back
            mem_write(8'h10, 16'hABCD);
            mem_read(8'h10, /*output*/);
        end
    end

endmodule

