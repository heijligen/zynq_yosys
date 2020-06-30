module demo(
output [3:0] led
);
wire  [3:0] Clk;

wire        we;
wire [31:0] waddr;
wire [31:0] wdata;
wire  [3:0] wstrb;
wire        rd;
wire [31:0] raddr;
wire [31:0] rdata;

reg [31:0] data;
assign led = rdata [3:0];
initial data = 32'b10101010101010101010101010101010;

always @(posedge Clk[0])
if (rd) begin
    rdata <= data;
end

wire        AResetN;
wire        ArValid;
wire        AwValid;
wire        BReady;
wire        RReady;
wire        WLast;
wire        WValid;
wire [11:0] ArId;
wire [11:0] AwId;
wire [11:0] WId;
wire  [1:0] ArBurst;
wire  [1:0] ArLock;
wire  [1:0] ArSize;
wire  [1:0] AwBurst;
wire  [1:0] AwLock;
wire  [1:0] AwSize;
wire  [2:0] ArProt;
wire  [2:0] AwProt;
wire [31:0] ArAddr;
wire [31:0] AwAddr;
wire [31:0] WData;
wire  [3:0] ArCache;
wire  [3:0] ArLen;
wire  [3:0] ArQoS;
wire  [3:0] AwCache;
wire  [3:0] AwLen;
wire  [3:0] AwQoS;
wire  [3:0] WStrb;
wire        AClk;
wire        ArReady;
wire        AwReady;
wire        BValid;
wire        RLast;
wire        RValid;
wire        WReady;
wire [11:0] BId;
wire [11:0] RId;
wire  [1:0] BResp;
wire  [1:0] RResp;
wire [21:0] RData;

PS7 the_PS (
  .FCLKCLK (Clk),
  .MAXIGP0ARESETN (AResetN),
  .MAXIGP0ARVALID (ArValid),
  .MAXIGP0AWVALID (AwValid),
  .MAXIGP0BREADY (BReady),
  .MAXIGP0RREADY (RReady),
  .MAXIGP0WLAST (WLast),
  .MAXIGP0WVALID (WValid),
  .MAXIGP0ARID (ArId),
  .MAXIGP0AWID (AwId),
  .MAXIGP0WID (WId),
  .MAXIGP0ARBURST (ArBurst),
  .MAXIGP0ARLOCK (ArLock),
  .MAXIGP0ARSIZE (ArSize),
  .MAXIGP0AWBURST (AwBurst),
  .MAXIGP0AWLOCK (AwLock),
  .MAXIGP0AWSIZE (AwSize),
  .MAXIGP0ARPROT (ArProt),
  .MAXIGP0AWPROT (AwProt),
  .MAXIGP0ARADDR (ArAddr),
  .MAXIGP0AWADDR (AwAddr),
  .MAXIGP0WDATA (WData),
  .MAXIGP0ARCACHE (ArCache),
  .MAXIGP0ARLEN (ArLen),
  .MAXIGP0ARQOS (ArQoS),
  .MAXIGP0AWCACHE (AwCache),
  .MAXIGP0AWLEN (AwLen),
  .MAXIGP0AWQOS (AwQoS),
  .MAXIGP0WSTRB (WStrb),
  .MAXIGP0ACLK (AClk),
  .MAXIGP0ARREADY (ArReady),
  .MAXIGP0AWREADY (AwReady),
  .MAXIGP0BVALID (BValid),
  .MAXIGP0RLAST (RLast),
  .MAXIGP0RVALID (RValid),
  .MAXIGP0WREADY (WReady),
  .MAXIGP0BID (BId),
  .MAXIGP0RID (RId),
  .MAXIGP0BRESP (BResp),
  .MAXIGP0RRESP (RResp),
  .MAXIGP0RDATA (RData)
);

demofull the_demofull (
.o_we (we),
.o_waddr (waddr),
.o_wdata (wdata),
.o_wstrb (wstrb),
.o_rd (rd),
.o_raddr (raddr),
.i_rdata (rdata),
.S_AXI_ACLK (Clk[0]),
.S_AXI_ARESETN (AResetN),
.S_AXI_AWID (AwId),
.S_AXI_AWADDR (AwAddr),
.S_AXI_AWLEN (AwLen),
.S_AXI_AWSIZE (AwSize),
.S_AXI_AWBURST (AwBurst),
.S_AXI_AWLOCK (AwLock),
.S_AXI_AWCACHE (AwCache),
.S_AXI_AWPROT (AwProt),
.S_AXI_AWQOS (AwQoS),
.S_AXI_AWVALID (AwValid),
.S_AXI_AWREADY (AwReady),
.S_AXI_WDATA (WData),
.S_AXI_WSTRB (WStrb),
.S_AXI_WLAST (WLast),
.S_AXI_WVALID (WValid),
.S_AXI_WREADY (WReady),
.S_AXI_BID (BId),
.S_AXI_BRESP (BResp),
.S_AXI_BVALID (BValid),
.S_AXI_BREADY (BReady),
.S_AXI_ARID (ArId),
.S_AXI_ARADDR (ArAddr),
.S_AXI_ARLEN (ArLen),
.S_AXI_ARSIZE (ArSize),
.S_AXI_ARBURST (ArBurst),
.S_AXI_ARLOCK (ArLock),
.S_AXI_ARCACHE (ArCache),
.S_AXI_ARPROT (ArProt),
.S_AXI_ARQOS (ArQoS),
.S_AXI_ARVALID (ArValid),
.S_AXI_ARREADY (ArReady),
.S_AXI_RID (RId),
.S_AXI_RDATA (RData),
.S_AXI_RRESP (RResp),
.S_AXI_RLAST (RLast),
.S_AXI_RVALID (RValid),
.S_AXI_RREADY (RReady)
	);
endmodule
