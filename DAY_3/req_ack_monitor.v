module req_ack_monitor (
    input  req,    // Request signal
    input  ack,    // Acknowledgment signal
    output out     
);
    assign out = req & ack;
endmodule
