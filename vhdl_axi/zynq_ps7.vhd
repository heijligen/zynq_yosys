library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Numeric_Std.all;

entity Top is
	signal Master_To_Slave : Axi_Out;
	signal Slave_To_Master : Axi_In;
begin
	My_Module port map (Slave_To_Master, Master_To_Slave);
	Zynq_PS7 port map (Master_To_Slave, Slave_To_Master);
end Top;


entity My_Module is
	port (
		Axi_Slave_Out : Axi_In;
		Axi_Slave_In  : Axi_Out
	);
end My_Module;


entity Zynq_PS7 is
	port (
		  AXI_GPO_Master_Out: Axi_Out;
		  AXI_GP0_Master_In : Axi_In;
	  );
end Zynq_PS7;


architecture rtl of Zynq_PS7 is
type AXI_Out is record ();
type AXI_In is record ();


begin
	component PS7 port (
		FCLKCLK			: Std_Logic_Vector ( 3 downto 0);
		FCLKRESETN		: Std_Logic_Vector ( 3 downto 0);
		MAXIGP0ARADDR	: Std_Logic_Vector (39 downto 0);
		MAXIGP0ARID		: Std_Logic_Vector (15 downto 0);
		MAXIGP0ARPROT	: Std_Logic_Vector ( 2 downto 0);
		MAXIGP0ARVALID	: Std_Logic;
		MAXIGP0AWADDR	: Std_Logic_Vector (39 downto 0);
		MAXIGP0AWID		: Std_Logic_Vector (15 downto 0);
		MAXIGP0AWPROT	: Std_Logic_Vector ( 2 downto 0);
		MAXIGP0AWVALID	: Std_Logic;
		MAXIGP0BREADY	: Std_Logic;
		MAXIGP0RREADY	: Std_Logic;
		MAXIGP0WDATA	: Std_Logic_Vector (31 downto 0);
		MAXIGP0WID		: Std_Logic_Vector (11 downto 0);
		MAXIGP0WSTRB	: Std_Logic_Vector ( 3 downto 0);
		MAXIGP0WVALID	: Std_Logic;
		MAXIGP0ACLK		: Std_Logic;
		MAXIGP0ARREADY	: Std_Logic;
		MAXIGP0AWREADY	: Std_Logic;
		MAXIGP0BID		: Std_Logic_Vector (11 downto 0);
		MAXIGP0BRESP	: Std_Logic_Vector ( 1 downto 0);
		MAXIGP0BVALID	: Std_Logic;
		MAXIGP0RDATA	: Std_Logic_Vector (31 downto 0);
		MAXIGP0RID		: Std_Logic_Vector (11 downto 0);
		MAXIGP0RLAST	: Std_Logic;
		MAXIGP0RRESP	: Std_Logic_Vector ( 1 downto 0);
		MAXIGP0RVALID	: Std_Logic;
		MAXIGP0WREADY	: Std_Logic;
	);

end architecture;
