LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY selectA IS
	PORT( 
		inB, inA   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		selA       : IN  STD_LOGIC;
		s_out      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE comportamento OF selectA IS
BEGIN
	PROCESS(selA)
	VARIABLE aux: STD_LOGIC_VECTOR(4 DOWNTO 0):="00000";
	BEGIN
		CASE selA IS
			WHEN '0'    => aux := inB;
			WHEN '1'    => aux := inA;
			WHEN OTHERS => aux := aux;
		END CASE;
		s_out <= aux;
	END PROCESS;

	
END ARCHITECTURE;



