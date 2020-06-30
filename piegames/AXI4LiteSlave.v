// Generator : SpinalHDL v1.3.6    git head : 10854057c32ae371aabc9a340c367e9bbc159fcd
// Date      : 21/12/2019, 02:09:45
// Component : AXI4LiteSlave


module StreamFifoLowLatency (
      input   io_push_valid,
      output  io_push_ready,
      input  [11:0] io_push_payload_addr,
      input  [2:0] io_push_payload_prot,
      output reg  io_pop_valid,
      input   io_pop_ready,
      output reg [11:0] io_pop_payload_addr,
      output reg [2:0] io_pop_payload_prot,
      input   io_flush,
      output [0:0] io_occupancy,
      input   S_AXI_ACLK,
      input   S_AXI_ARESETN);
  wire  _zz_5_;
  reg  _zz_1_;
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  wire  pushPtr_willOverflowIfInc;
  wire  pushPtr_willOverflow;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  wire  popPtr_willOverflowIfInc;
  wire  popPtr_willOverflow;
  wire  ptrMatch;
  reg  risingOccupancy;
  wire  empty;
  wire  full;
  wire  pushing;
  wire  popping;
  wire [14:0] _zz_2_;
  wire [14:0] _zz_3_;
  reg [14:0] _zz_4_;
  assign _zz_5_ = (! empty);
  always @ (*) begin
    _zz_1_ = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2_ = _zz_3_;
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_addr = _zz_2_[11 : 0];
    end else begin
      io_pop_payload_addr = io_push_payload_addr;
    end
  end

  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_prot = _zz_2_[14 : 12];
    end else begin
      io_pop_payload_prot = io_push_payload_prot;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  assign _zz_3_ = _zz_4_;
  always @ (posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge S_AXI_ACLK) begin
    if(_zz_1_)begin
      _zz_4_ <= {io_push_payload_prot,io_push_payload_addr};
    end
  end

endmodule

module StreamFifoLowLatency_1_ (
      input   io_push_valid,
      output  io_push_ready,
      input  [31:0] io_push_payload_data,
      input  [3:0] io_push_payload_strobe,
      output reg  io_pop_valid,
      input   io_pop_ready,
      output reg [31:0] io_pop_payload_data,
      output reg [3:0] io_pop_payload_strobe,
      input   io_flush,
      output [0:0] io_occupancy,
      input   S_AXI_ACLK,
      input   S_AXI_ARESETN);
  wire  _zz_5_;
  reg  _zz_1_;
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  wire  pushPtr_willOverflowIfInc;
  wire  pushPtr_willOverflow;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  wire  popPtr_willOverflowIfInc;
  wire  popPtr_willOverflow;
  wire  ptrMatch;
  reg  risingOccupancy;
  wire  empty;
  wire  full;
  wire  pushing;
  wire  popping;
  wire [35:0] _zz_2_;
  wire [35:0] _zz_3_;
  reg [35:0] _zz_4_;
  assign _zz_5_ = (! empty);
  always @ (*) begin
    _zz_1_ = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2_ = _zz_3_;
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_data = _zz_2_[31 : 0];
    end else begin
      io_pop_payload_data = io_push_payload_data;
    end
  end

  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_strobe = _zz_2_[35 : 32];
    end else begin
      io_pop_payload_strobe = io_push_payload_strobe;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  assign _zz_3_ = _zz_4_;
  always @ (posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge S_AXI_ACLK) begin
    if(_zz_1_)begin
      _zz_4_ <= {io_push_payload_strobe,io_push_payload_data};
    end
  end

endmodule

module StreamFifo (
      input   io_push_valid,
      output  io_push_ready,
      input  [1:0] io_push_payload,
      output  io_pop_valid,
      input   io_pop_ready,
      output [1:0] io_pop_payload,
      input   io_flush,
      output [0:0] io_occupancy,
      output [0:0] io_availability,
      input   S_AXI_ACLK,
      input   S_AXI_ARESETN);
  wire  io_push_m2sPipe_valid;
  wire  io_push_m2sPipe_ready;
  wire [1:0] io_push_m2sPipe_payload;
  reg  _zz_1_;
  reg [1:0] _zz_2_;
  assign io_push_ready = ((1'b1 && (! io_push_m2sPipe_valid)) || io_push_m2sPipe_ready);
  assign io_push_m2sPipe_valid = _zz_1_;
  assign io_push_m2sPipe_payload = _zz_2_;
  assign io_pop_valid = io_push_m2sPipe_valid;
  assign io_push_m2sPipe_ready = io_pop_ready;
  assign io_pop_payload = io_push_m2sPipe_payload;
  assign io_occupancy = io_pop_valid;
  assign io_availability = (! io_pop_valid);
  always @ (posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      _zz_1_ <= 1'b0;
    end else begin
      if(io_push_ready)begin
        _zz_1_ <= io_push_valid;
      end
      if(io_flush)begin
        _zz_1_ <= 1'b0;
      end
    end
  end

  always @ (posedge S_AXI_ACLK) begin
    if(io_push_ready)begin
      _zz_2_ <= io_push_payload;
    end
  end

endmodule


//StreamFifoLowLatency_2_ remplaced by StreamFifoLowLatency

module StreamFifo_1_ (
      input   io_push_valid,
      output  io_push_ready,
      input  [31:0] io_push_payload_data,
      input  [1:0] io_push_payload_resp,
      output  io_pop_valid,
      input   io_pop_ready,
      output [31:0] io_pop_payload_data,
      output [1:0] io_pop_payload_resp,
      input   io_flush,
      output [0:0] io_occupancy,
      output [0:0] io_availability,
      input   S_AXI_ACLK,
      input   S_AXI_ARESETN);
  wire  io_push_m2sPipe_valid;
  wire  io_push_m2sPipe_ready;
  wire [31:0] io_push_m2sPipe_payload_data;
  wire [1:0] io_push_m2sPipe_payload_resp;
  reg  _zz_1_;
  reg [31:0] _zz_2_;
  reg [1:0] _zz_3_;
  assign io_push_ready = ((1'b1 && (! io_push_m2sPipe_valid)) || io_push_m2sPipe_ready);
  assign io_push_m2sPipe_valid = _zz_1_;
  assign io_push_m2sPipe_payload_data = _zz_2_;
  assign io_push_m2sPipe_payload_resp = _zz_3_;
  assign io_pop_valid = io_push_m2sPipe_valid;
  assign io_push_m2sPipe_ready = io_pop_ready;
  assign io_pop_payload_data = io_push_m2sPipe_payload_data;
  assign io_pop_payload_resp = io_push_m2sPipe_payload_resp;
  assign io_occupancy = io_pop_valid;
  assign io_availability = (! io_pop_valid);
  always @ (posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      _zz_1_ <= 1'b0;
    end else begin
      if(io_push_ready)begin
        _zz_1_ <= io_push_valid;
      end
      if(io_flush)begin
        _zz_1_ <= 1'b0;
      end
    end
  end

  always @ (posedge S_AXI_ACLK) begin
    if(io_push_ready)begin
      _zz_2_ <= io_push_payload_data;
      _zz_3_ <= io_push_payload_resp;
    end
  end

endmodule

module AXI4LiteSlave (
      input   S_AXI_ARVALID,
      output reg  S_AXI_ARREADY,
      input  [11:0] S_AXI_ARADDR,
      input  [2:0] S_AXI_ARPROT,
      output reg  S_AXI_RVALID,
      input   S_AXI_RREADY,
      output [31:0] S_AXI_RDATA,
      output [1:0] S_AXI_RRESP,
      input   S_AXI_AWVALID,
      output reg  S_AXI_AWREADY,
      input  [11:0] S_AXI_AWADDR,
      input  [2:0] S_AXI_AWPROT,
      input   S_AXI_WVALID,
      output reg  S_AXI_WREADY,
      input  [31:0] S_AXI_WDATA,
      input  [3:0] S_AXI_WSTRB,
      output reg  S_AXI_BVALID,
      input   S_AXI_BREADY,
      output [1:0] S_AXI_BRESP,
      input   S_AXI_ARESETN,
      input   S_AXI_ACLK);
  wire  _zz_2_;
  wire  _zz_3_;
  wire [1:0] _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  reg [31:0] _zz_7_;
  wire [1:0] _zz_8_;
  wire  _zz_9_;
  wire  io_writeAddress_fifo_io_push_ready;
  wire  io_writeAddress_fifo_io_pop_valid;
  wire [11:0] io_writeAddress_fifo_io_pop_payload_addr;
  wire [2:0] io_writeAddress_fifo_io_pop_payload_prot;
  wire [0:0] io_writeAddress_fifo_io_occupancy;
  wire  io_writeData_fifo_io_push_ready;
  wire  io_writeData_fifo_io_pop_valid;
  wire [31:0] io_writeData_fifo_io_pop_payload_data;
  wire [3:0] io_writeData_fifo_io_pop_payload_strobe;
  wire [0:0] io_writeData_fifo_io_occupancy;
  wire  input_writeResponse_io_push_ready;
  wire  input_writeResponse_io_pop_valid;
  wire [1:0] input_writeResponse_io_pop_payload;
  wire [0:0] input_writeResponse_io_occupancy;
  wire [0:0] input_writeResponse_io_availability;
  wire  io_readAddress_fifo_io_push_ready;
  wire  io_readAddress_fifo_io_pop_valid;
  wire [11:0] io_readAddress_fifo_io_pop_payload_addr;
  wire [2:0] io_readAddress_fifo_io_pop_payload_prot;
  wire [0:0] io_readAddress_fifo_io_occupancy;
  wire  output_readData_io_push_ready;
  wire  output_readData_io_pop_valid;
  wire [31:0] output_readData_io_pop_payload_data;
  wire [1:0] output_readData_io_pop_payload_resp;
  wire [0:0] output_readData_io_occupancy;
  wire [0:0] output_readData_io_availability;
  wire  _zz_10_;
  wire [15:0] _zz_11_;
  wire [15:0] _zz_12_;
  wire [0:0] _zz_13_;
  wire [31:0] _zz_14_;
  wire  input_transaction_valid;
  wire  input_transaction_ready;
  wire  _zz_1_;
  reg [31:0] input_inputSquared;
  reg  output_counter_willIncrement;
  wire  output_counter_willClear;
  reg [31:0] output_counter_valueNext;
  reg [31:0] output_counter_value;
  wire  output_counter_willOverflowIfInc;
  wire  output_counter_willOverflow;
  function  zz_output_counter_willIncrement(input dummy);
    begin
      zz_output_counter_willIncrement = 1'b0;
      zz_output_counter_willIncrement = 1'b1;
    end
  endfunction
  wire  _zz_15_;
  assign _zz_10_ = (! S_AXI_ARESETN);
  assign _zz_11_ = io_writeData_fifo_io_pop_payload_data[15:0];
  assign _zz_12_ = io_writeData_fifo_io_pop_payload_data[15:0];
  assign _zz_13_ = output_counter_willIncrement;
  assign _zz_14_ = {31'd0, _zz_13_};
  StreamFifoLowLatency io_writeAddress_fifo ( 
    .io_push_valid(S_AXI_AWVALID),
    .io_push_ready(io_writeAddress_fifo_io_push_ready),
    .io_push_payload_addr(S_AXI_AWADDR),
    .io_push_payload_prot(S_AXI_AWPROT),
    .io_pop_valid(io_writeAddress_fifo_io_pop_valid),
    .io_pop_ready(_zz_1_),
    .io_pop_payload_addr(io_writeAddress_fifo_io_pop_payload_addr),
    .io_pop_payload_prot(io_writeAddress_fifo_io_pop_payload_prot),
    .io_flush(_zz_2_),
    .io_occupancy(io_writeAddress_fifo_io_occupancy),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN) 
  );
  StreamFifoLowLatency_1_ io_writeData_fifo ( 
    .io_push_valid(S_AXI_WVALID),
    .io_push_ready(io_writeData_fifo_io_push_ready),
    .io_push_payload_data(S_AXI_WDATA),
    .io_push_payload_strobe(S_AXI_WSTRB),
    .io_pop_valid(io_writeData_fifo_io_pop_valid),
    .io_pop_ready(_zz_1_),
    .io_pop_payload_data(io_writeData_fifo_io_pop_payload_data),
    .io_pop_payload_strobe(io_writeData_fifo_io_pop_payload_strobe),
    .io_flush(_zz_3_),
    .io_occupancy(io_writeData_fifo_io_occupancy),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN) 
  );
  StreamFifo input_writeResponse ( 
    .io_push_valid(input_transaction_valid),
    .io_push_ready(input_writeResponse_io_push_ready),
    .io_push_payload(_zz_4_),
    .io_pop_valid(input_writeResponse_io_pop_valid),
    .io_pop_ready(S_AXI_BREADY),
    .io_pop_payload(input_writeResponse_io_pop_payload),
    .io_flush(_zz_5_),
    .io_occupancy(input_writeResponse_io_occupancy),
    .io_availability(input_writeResponse_io_availability),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN) 
  );
  StreamFifoLowLatency io_readAddress_fifo ( 
    .io_push_valid(S_AXI_ARVALID),
    .io_push_ready(io_readAddress_fifo_io_push_ready),
    .io_push_payload_addr(S_AXI_ARADDR),
    .io_push_payload_prot(S_AXI_ARPROT),
    .io_pop_valid(io_readAddress_fifo_io_pop_valid),
    .io_pop_ready(output_readData_io_push_ready),
    .io_pop_payload_addr(io_readAddress_fifo_io_pop_payload_addr),
    .io_pop_payload_prot(io_readAddress_fifo_io_pop_payload_prot),
    .io_flush(_zz_6_),
    .io_occupancy(io_readAddress_fifo_io_occupancy),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN) 
  );
  StreamFifo_1_ output_readData ( 
    .io_push_valid(io_readAddress_fifo_io_pop_valid),
    .io_push_ready(output_readData_io_push_ready),
    .io_push_payload_data(_zz_7_),
    .io_push_payload_resp(_zz_8_),
    .io_pop_valid(output_readData_io_pop_valid),
    .io_pop_ready(S_AXI_RREADY),
    .io_pop_payload_data(output_readData_io_pop_payload_data),
    .io_pop_payload_resp(output_readData_io_pop_payload_resp),
    .io_flush(_zz_9_),
    .io_occupancy(output_readData_io_occupancy),
    .io_availability(output_readData_io_availability),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN) 
  );
  always @ (*) begin
    S_AXI_AWREADY = io_writeAddress_fifo_io_push_ready;
    if(_zz_10_)begin
      S_AXI_AWREADY = 1'b0;
    end
  end

  always @ (*) begin
    S_AXI_WREADY = io_writeData_fifo_io_push_ready;
    if(_zz_10_)begin
      S_AXI_WREADY = 1'b0;
    end
  end

  assign _zz_1_ = (input_transaction_valid && input_transaction_ready);
  assign input_transaction_valid = (io_writeAddress_fifo_io_pop_valid && io_writeData_fifo_io_pop_valid);
  assign input_transaction_ready = input_writeResponse_io_push_ready;
  assign _zz_4_ = (2'b00);
  always @ (*) begin
    S_AXI_BVALID = input_writeResponse_io_pop_valid;
    if(_zz_10_)begin
      S_AXI_BVALID = 1'b0;
    end
  end

  assign S_AXI_BRESP = input_writeResponse_io_pop_payload;
  assign _zz_15_ = zz_output_counter_willIncrement(1'b0);
  always @ (*) output_counter_willIncrement = _zz_15_;
  assign output_counter_willClear = 1'b0;
  assign output_counter_willOverflowIfInc = (output_counter_value == (32'b11111111111111111111111111111111));
  assign output_counter_willOverflow = (output_counter_willOverflowIfInc && output_counter_willIncrement);
  always @ (*) begin
    output_counter_valueNext = (output_counter_value + _zz_14_);
    if(output_counter_willClear)begin
      output_counter_valueNext = (32'b00000000000000000000000000000000);
    end
  end

  always @ (*) begin
    S_AXI_ARREADY = io_readAddress_fifo_io_push_ready;
    if(_zz_10_)begin
      S_AXI_ARREADY = 1'b0;
    end
  end

  always @ (*) begin
    S_AXI_RVALID = output_readData_io_pop_valid;
    if(_zz_10_)begin
      S_AXI_RVALID = 1'b0;
    end
  end

  assign S_AXI_RDATA = output_readData_io_pop_payload_data;
  assign S_AXI_RRESP = output_readData_io_pop_payload_resp;
  assign _zz_8_ = (2'b00);
  always @ (*) begin
    case(io_readAddress_fifo_io_pop_payload_addr)
      12'b000000000000 : begin
        _zz_7_ = (32'b00000000000000000000000000000100);
      end
      12'b000000000100 : begin
        _zz_7_ = input_inputSquared;
      end
      12'b000000001000 : begin
        _zz_7_ = output_counter_value;
      end
      default : begin
        _zz_7_ = (32'b00000000000000000000000000000000);
      end
    endcase
  end

  assign _zz_2_ = 1'b0;
  assign _zz_3_ = 1'b0;
  assign _zz_5_ = 1'b0;
  assign _zz_6_ = 1'b0;
  assign _zz_9_ = 1'b0;
  always @ (posedge S_AXI_ACLK) begin
    if(((input_transaction_valid && input_transaction_ready) && (io_writeAddress_fifo_io_pop_payload_addr == (12'b000000000100))))begin
      input_inputSquared <= (_zz_11_ * _zz_12_);
    end
  end

  always @ (posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      output_counter_value <= (32'b00000000000000000000000000000000);
    end else begin
      output_counter_value <= output_counter_valueNext;
    end
  end

endmodule

