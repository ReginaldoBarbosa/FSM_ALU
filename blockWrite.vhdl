LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY blockWrite IS
	PORT( 
		inData     : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		writ       : IN  STD_LOGIC;
		s_out      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE comportamento OF blockWrite IS
BEGIN
	PROCESS(inData,writ)
	VARIABLE aux: STD_LOGIC_VECTOR(4 DOWNTO 0):="00000";
	BEGIN
		CASE writ IS
			WHEN '1'    => aux := inData;
			WHEN OTHERS => aux := aux;
		END CASE;
		s_out <= aux;
	END PROCESS;
	
END ARCHITECTURE;


