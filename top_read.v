
/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sun Apr 13 06:30:47 2025
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module top_read ( p_reset , m_clock , rxd , HEX0 , HEX1 , HEX2 );
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
  reg set_sw;
  reg set_sw_end;
  reg [7:0] encode [0:15];
  reg [31:0] count;
  reg [7:0] read_data;
  reg [31:0] count_timer;
  reg [3:0] times;
  wire _read_x_RxD_i;
  wire [7:0] _read_x_Rx_Data_o;
  wire _read_x_RxD_Ready_o;
  wire _read_x_RxD_ParityError_o;
  wire _read_x_RxD_FramingError_o;
  wire [1:0] _read_x_Rx_BitLength_i;
  wire _read_x_Rx_ParityEN_i;
  wire _read_x_Rx_OddParity_i;
  wire _read_x_Rx_Enable_i;
  wire _read_x_Rx_operation_o;
  wire _read_x_Rx_ShiftClock_o;
  wire _read_x_p_reset;
  wire _read_x_m_clock;
  wire [3:0] _net_0;
  wire [7:0] _net_1;
  wire [3:0] _net_2;
  wire [7:0] _net_3;
  wire [7:0] _net_4;
  wire _net_5;
  wire _net_6;
read read_x (.m_clock(m_clock), .p_reset( p_reset), .Rx_ShiftClock_o(_read_x_Rx_ShiftClock_o), .Rx_operation_o(_read_x_Rx_operation_o), .Rx_Enable_i(_read_x_Rx_Enable_i), .Rx_OddParity_i(_read_x_Rx_OddParity_i), .Rx_ParityEN_i(_read_x_Rx_ParityEN_i), .Rx_BitLength_i(_read_x_Rx_BitLength_i), .RxD_FramingError_o(_read_x_RxD_FramingError_o), .RxD_ParityError_o(_read_x_RxD_ParityError_o), .RxD_Ready_o(_read_x_RxD_Ready_o), .Rx_Data_o(_read_x_Rx_Data_o), .RxD_i(_read_x_RxD_i));

   assign  _read_x_RxD_i = rxd;
   assign  _read_x_Rx_BitLength_i = 2'b11;
   assign  _read_x_Rx_ParityEN_i = 1'b0;
   assign  _read_x_Rx_Enable_i = 1'b1;
   assign  _read_x_p_reset = p_reset;
   assign  _read_x_m_clock = m_clock;
   assign  _net_0 = (read_data[7:4]);
   assign  _net_1 = (encode[_net_0]);
   assign  _net_2 = (read_data[3:0]);
   assign  _net_3 = (encode[_net_2]);
   assign  _net_4 = (encode[times]);
   assign  _net_5 = (count_timer==32'b00000111001001110000111000000000);
   assign  _net_6 = 
// synthesis translate_off
// synopsys translate_off
(_read_x_RxD_Ready_o)? 
// synthesis translate_on
// synopsys translate_on
((_read_x_RxD_Ready_o)?(count==32'b00000000000000000000000000000000):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  HEX0 = (~_net_1);
   assign  HEX1 = (~_net_3);
   assign  HEX2 = (~_net_4);
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     set_sw <= 1'b0;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     set_sw_end <= 1'b0;
else if (_read_x_RxD_Ready_o)
      set_sw_end <= 1'b1;
end
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
else if (_read_x_RxD_Ready_o)
      count <= 32'b00000000000000000000000000000001;
end
always @(posedge m_clock)
  begin
if ((_read_x_RxD_Ready_o&_net_6))
      read_data <= _read_x_Rx_Data_o;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     count_timer <= 32'b00000000000000000000000000000000;
else 
// synthesis translate_off
// synopsys translate_off
if (((~_net_5)&_net_5))   count_timer <= 32'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~_net_5))
      count_timer <= (count_timer+32'b00000000000000000000000000000001);
else if (_net_5)
      count_timer <= 32'b00000000000000000000000000000000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((~_net_5)|_net_5)==1'b1) ||
 (((~_net_5)|_net_5)==1'b0) ) begin
 if (((~_net_5)&_net_5))
 begin $display("Warning: assign collision(top_read:count_timer) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(top_read:count_timer) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     times <= 4'b0000;
else if (_net_5)
      times <= (times+4'b0001);
end
endmodule

/*Produced by NSL Core(version=20240708), IP ARCH, Inc. Sun Apr 13 06:30:47 2025
 Licensed to :EVALUATION USER*/
