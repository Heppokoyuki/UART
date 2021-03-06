`timescale 1ns/1ps

module rx_tb();

parameter TIMESCALE_HZ = 1000_000_000;
parameter CLOCK_HZ = 50_000_000;
parameter BAUD_RATE = 115200;
parameter TIME_CLOCK = $floor(TIMESCALE_HZ / CLOCK_HZ);
parameter TIME_BIT = $floor(TIMESCALE_HZ / BAUD_RATE);

reg clk;
reg rx;
wire[7:0] data;
wire end_flag;

rx rx1(clk, rx, data, end_flag);

always #(TIME_CLOCK/2) clk = ~clk;

initial begin
    $dumpfile("rx_test.vcd");
    $dumpvars(0, rx_tb);
    clk = 1'b0;
    rx = 1'b1;
    #(2*TIME_BIT);
    rx = 1'b0;
    #(TIME_BIT);
    rx = 1'b0;
    #(TIME_BIT);
    rx = 1'b1;
    #(TIME_BIT);
    rx = 1'b0;
    #(TIME_BIT);
    rx = 1'b1;
    #(TIME_BIT);
    rx = 1'b0;
    #(TIME_BIT);
    rx = 1'b1;
    #(TIME_BIT);
    rx = 1'b0;
    #(TIME_BIT);
    rx = 1'b1;
    #(TIME_BIT);
    rx= 1'b1;
    #(2*TIME_BIT);
    
    $finish;
end
endmodule

