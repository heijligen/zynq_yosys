library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Numeric_Std.all;

entity Top is
	port (
		Led : out Std_Logic_Vector (3 downto 0)
	);
end Top;

architecture RTL of Top is
	signal FClk : Std_Logic_Vector (3 downto 0);
	signal Status : Std_Logic:= '0';

	component PS7 is
		port (
			FCLKCLK : out Std_Logic_Vector (3 downto 0)
		);
	end component;
begin

	process (FClk (0)) is
	begin
		if Rising_Edge (FClk (0)) then
				Status <= not Status;
		end if;
	end process;

	the_PS : PS7 port map (FCLKCLK => FClk);

	Led (0) <= Status;
	Led (1) <= Status;
	Led (2) <= Status;
	Led (3) <= Status;

end architecture;
