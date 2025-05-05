
/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sun Apr 13 06:04:52 2025
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module top_120m ( p_reset , m_clock , rxd , HEX0 , HEX1 , HEX2 , HEX3,txd );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input rxd;
  wire rxd;
  output [7:0] HEX0;
  wire [7:0] HEX0;
  output [7:0] HEX1;
  wire [7:0] HEX1;
  output [7:0] HEX2;
  wire [7:0] HEX2;
  output [7:0] HEX3;
  wire [7:0] HEX3;
  output txd;
  wire txd;
  reg [7:0] encode [0:15];
  reg [31:0] count;
  reg [3:0] times;
  wire _top_read_x_rxd;
  wire [7:0] _top_read_x_HEX0;
  wire [7:0] _top_read_x_HEX1;
  wire [7:0] _top_read_x_HEX2;
  wire _top_read_x_p_reset;
  wire _top_read_x_m_clock;
  wire [7:0] _net_0;
  wire _net_1;
top_read top_read_x (.m_clock(outclk_0), .p_reset( p_reset), .HEX0(_top_read_x_HEX0), .HEX1(_top_read_x_HEX1), .HEX2(_top_read_x_HEX2), .rxd(_top_read_x_rxd));
//uart_top uart_top_x (.m_clock(outclk_0), .p_reset( p_reset),.txd(txd));
apll apll_inst (
		.refclk   (m_clock),   //  refclk.clk
		.rst      (~p_reset),      //   reset.reset
		.outclk_0 (outclk_0), // outclk0.clk
	);
   assign  _top_read_x_rxd = rxd;
   assign  _top_read_x_p_reset = p_reset;
   assign  _top_read_x_m_clock = m_clock;
   assign  _net_0 = (encode[times]);
   assign  _net_1 = (count==32'b00000111001001110000111000000000);
   assign  HEX0 = _top_read_x_HEX0;
   assign  HEX1 = _top_read_x_HEX1;
   assign  HEX2 = _top_read_x_HEX2;
   assign  HEX3 = (~_net_0);
initial begin
    encode[0] = 8'b00111111;
    encode[1] = 8'b00000110;
    encode[2] = 8'b01011011;
    encode[3] = 8'b01001111;
    encode[4] = 8'b01100110;
    encode[5] = 8'b01101101;
    encode[6] = 8'b01111101;
    encode[7] = 8'b00100111;
    encode[8] = 8'b01111111;
    encode[9] = 8'b01101111;
    encode[10] = 8'b01110111;
    encode[11] = 8'b01111100;
    encode[12] = 8'b00111001;
    encode[13] = 8'b01011110;
    encode[14] = 8'b01111001;
    encode[15] = 8'b01110001;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     count <= 32'b00000000000000000000000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if (((~_net_1)&_net_1))   count <= 32'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~_net_1))
      count <= (count+32'b00000000000000000000000000000001);
else if (_net_1)
      count <= 32'b00000000000000000000000000000000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((~_net_1)|_net_1)==1'b1) ||
 (((~_net_1)|_net_1)==1'b0) ) begin
 if (((~_net_1)&_net_1))
 begin $display("Warning: assign collision(top_120m:count) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(top_120m:count) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     times <= 4'b0000;
else if (_net_1)
      times <= (times+4'b0001);
end
endmodule

/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sun Apr 13 06:04:52 2025
 Licensed to :EVALUATION USER*/
