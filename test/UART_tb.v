`timescale 1ns/1ps

module UART_tb();

parameter TIMESCALE_HZ = 1000_000_000;
parameter CLOCK_HZ = 50_000_000;
parameter BAUD_RATE = 115200;
parameter TIME_CLOCK = $floor(TIMESCALE_HZ / CLOCK_HZ);
parameter TIME_BIT = $floor(TIMESCALE_HZ / BAUD_RATE);

reg clk;
reg rx;
wire tx;
wire busy_flag;

UART UART1(clk, rx, tx, busy_flag);

always #(TIME_CLOCK/2) clk = ~clk;

initial begin
    $dumpfile("uart_test.vcd");
    $dumpvars(0, UART_tb);
    clk = 1'b0;
    rx = 1'b1;
    #(2*TIME_BIT);
    rx = 1'b0;
    #TIME_BIT;rx = 1'b0;
    #TIME_BIT;

    rx = 1'b0;
    #TIME_BIT;
    rx = 1'b1;
    #TIME_BIT;
    rx = 1'b1;
    #TIME_BIT;
    rx = 1'b1;
    #TIME_BIT;
    rx = 1'b1;
    #TIME_BIT;
    rx = 1'b0;
    #TIME_BIT;
    rx = 1'b0;
    #TIME_BIT;
    rx = 1'b1;
    #TIME_BIT;

    #(20 * TIME_BIT);
    $finish;
end
endmodule

