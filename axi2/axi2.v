module axi2 (
//  output [3:0]led,
//  input  [1:0]sw
);

  wire  [3:0] clk;
  reg   [31:0] data;

//  assign  sw[0] = data[0];
//  assign  sw[1] = data[1];
//  assign led[0] = data[0];
//  assign led[1] = data[1];
//  assign led[2] = data[2];
//  assign led[3] = 1'b1;

  wire ar_valid;
  reg ar_ready;
  wire [11:0] ar_id;
  reg  [11:0] axi_id;
  wire r_valid;

  initial begin
    data[31:0] = 29'b01010101010101010101010101010101;
    ar_ready = 1'b1;
    r_valid = 1'b0;
  end
  
  always @(posedge clk[0]) begin
	if (ar_valid == 1) begin
		axi_id <= ar_id;
		r_valid <= 1'b1;
	end

  end


    PS7 the_PS (		// Master <> Slave
        .FCLKCLK (clk),

    	.MAXIGP0ACLK (clk[0]),		// ! ° AClk
    	//.MAXIGP0ARESETN,	// ! ° AResetN
    	
	// Read address channel (Master > Slave)
    	.MAXIGP0ARID (ar_id),	//   > [11:0] ArId -> RId
    	//.MAXIGP0ARADDR,	// ! > [31:0] ArAddr
    	//.MAXIGP0ARLEN,	//   > [ 3:0] ArLen
    	//.MAXIGP0ARSIZE,	//   > [ 1:0] ArSzie
    	//.MAXIGP0ARBURST,	//   > [ 1:0] ArBurst
    	//.MAXIGP0ARLOCK,	//   > [ 1:0] ArLock
    	//.MAXIGP0ARCACHE,	//   > [ 3:0] ArCache
    	//.MAXIGP0ARPROT,	// ! > [ 2:0] ArProt
    	//.MAXIGP0ARQOS,	//   > [ 3:0] ArQos
    	.MAXIGP0ARVALID (ar_valid),// ! >        ArValid
    	.MAXIGP0ARREADY (ar_ready),	// ! <        ArReady

	// Read data channel (Slave > Master)
    	.MAXIGP0RID (axi_id),	//   < [11:0] RId
    	.MAXIGP0RDATA (data),	// ! < [31:0] RData
    	.MAXIGP0RRESP (2'b00),	// ! < [ 1:0] RResp
    	.MAXIGP0RLAST (1'b1),	//   <        RLast
    	.MAXIGP0RVALID (r_valid),// ! <        RValid
    	.MAXIGP0RREADY		// ! >        RReady

	/* Write address channel (Master > Slave)
	.[11:0] MAXIGP0AWID;	//   > [11:0] AwId
    	.[31:0] MAXIGP0AWADDR;	// ! > [31:0] AwAddr
    	.[3:0] MAXIGP0AWLEN;	//   > [ 3:0] AwLen
    	.[1:0] MAXIGP0AWSIZE;	//   > [ 1:0] AwSize
    	.[1:0] MAXIGP0AWBURST;	//   > [ 1:0] AwBurst
    	.[1:0] MAXIGP0AWLOCK;	//   > [ 1:0] AwLock
    	.[3:0] MAXIGP0AWCACHE;	//   > [ 3:0] AwCahe
    	.[2:0] MAXIGP0AWPROT;	// ! > [ 2:0] AwProt
    	.[3:0] MAXIGP0AWQOS;	//   > [ 3:0] AwQos
    	.MAXIGP0AWVALID,	// ! >        AwValid
    	.MAXIGP0AWREADY;	// ! <        AwReady

	// Write data channel (Master > Slave)
    	.[11:0] MAXIGP0WID;	//   > [11:0] WId
    	.[31:0] MAXIGP0WDATA;	// ! > [31:0] WData
    	.[3:0] MAXIGP0WSTRB;	// ! > [ 3:0] WStrb
    	.MAXIGP0WLAST;		//   >        WLast
    	.MAXIGP0WVALID;		// ! >        WValid
    	.MAXIGP0WREADY,		// ! <        WReady

	//Write response channel (Slave > Master)
    	.[11:0] MAXIGP0BID,	// < [11:0]   BId 
    	.[1:0] MAXIGP0BRESP,	// ! < [ 1:0] BResp (0b'00 Ok, 0b'01 error (Burst etc))
    	.MAXIGP0BVALID;		// ! <        BValid
    	.MAXIGP0BREADY;		// ! >        BReady
	*/
    );	
endmodule



