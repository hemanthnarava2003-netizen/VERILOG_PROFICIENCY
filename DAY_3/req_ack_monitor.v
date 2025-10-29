module req_ack_monitor (
    input  wire req,    // Request signal
    input  wire ack,    // Acknowledgment signal
    output wire out     
);
    assign out = req & ack;
endmodule
