library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Numeric_Std.all;



entity Blink is
	port (
		Clk : in  Std_Logic;
		Led : out Std_Logic
	);
end Blink;

architecture RTL of Blink is
	signal Status : Std_Logic:= '0';
begin

	Led <= Status;

	process (Clk) is
		variable Counter : Natural := 0;
	begin
		if Rising_Edge (Clk) then
			if Counter = 16#003f_ffff# then
				Counter := 0;
				Status <= not Status;
			end if;
			Counter := Counter + 1;
		end if;
	end process;

end architecture;
