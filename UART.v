// clock must be 50MHz
// baud rate 11520bps, stop bit 1bit, data 8bit, no parity, no flow control

module UART(
	input wire clk,
	input wire rx,
	output wire tx,
	output wire busy_flag
);

	wire flag;
	wire[7:0] data;

	tx tx1(clk, flag, data, tx, busy_flag);
	rx rx1(clk, rx, data, flag);
	
endmodule
