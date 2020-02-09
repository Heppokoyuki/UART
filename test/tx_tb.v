`timescale 1ns/1ps

module tx_tb();

parameter TIMESCALE_HZ = 1000_000_000;
parameter CLOCK_HZ = 50_000_000;
parameter BAUD_RATE = 115200;
parameter TIME_CLOCK = $floor(TIMESCALE_HZ / CLOCK_HZ);
parameter TIME_BIT = $floor(TIMESCALE_HZ / BAUD_RATE);

reg clk;
reg begin_flag = 1'b0;
reg [7:0] data;
wire tx;
wire busy_flag;

tx tx1(clk, begin_flag, data, tx, busy_flag);

always #(TIME_CLOCK/2) clk = ~clk;

initial begin
    $dumpfile("tx_test.vcd");
    $dumpvars(0, tx_tb);
    clk = 1'b0;
    #(2*TIME_CLOCK);
    data = 8'b10101010;
    #(2*TIME_BIT);
    begin_flag = 1'b1;
    #(TIME_BIT);
    begin_flag = 1'b0;
    #(TIME_BIT * 10);
    $finish;
end
endmodule

