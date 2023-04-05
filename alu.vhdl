LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY alu IS
	PORT( 
		inA, inB   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		aluOp       : IN  INTEGER RANGE 0 TO 4;
		s_out      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE comportamento OF alu IS
BEGIN
	PROCESS(inB,inA,aluOp)
	VARIABLE aux: STD_LOGIC_VECTOR(4 DOWNTO 0):="00000";
	BEGIN
		CASE aluOp IS
			WHEN 0    => aux := "00000";
			WHEN 1    => aux := inA;
			WHEN 2    => aux := inB;
			WHEN 3    => aux := inA + inB;
			WHEN OTHERS => aux := aux;
		END CASE;
		s_out <= aux;
	END PROCESS;

	
END ARCHITECTURE;
