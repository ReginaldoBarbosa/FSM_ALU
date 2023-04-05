LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY systemUla IS 
	PORT(inpA, inpB : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
	     selA       : IN  STD_LOGIC;
	     wrA, wrB   : IN  STD_LOGIC;
	     ALUop      : IN  INTEGER RANGE 0 TO 4;
	     ALUout     : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	     );
END ENTITY;

ARCHITECTURE componente OF systemUla IS
	COMPONENT selectA PORT( 
		inB, inA   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		selA       : IN  STD_LOGIC;
		s_out      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT blockWrite PORT( 
		inData     : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		writ       : IN  STD_LOGIC;
		s_out      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT alu PORT( 
		inA, inB   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		aluOp       : IN  INTEGER RANGE 0 TO 4;
		s_out      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
	END COMPONENT;
	
	SIGNAL SigOutSelA, SigOutWrA,SigOutWrB,SigOutAlu:STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN

	init:       selectA    PORT MAP(SigOutAlu, inpA,selA,SigOutSelA);
	loadBrickA: blockWrite PORT MAP(SigOutSelA, wrA, SigOutWrA);
	loadBrickB: blockWrite PORT MAP(inpB, wrB, SigOutWrB);
	AluStage  : alu        PORT MAP(SigOutWrA,SigOutWrB,ALUop,SigOutAlu);
	
	PROCESS(inpA, inpB,selA,wrA, wrB,ALUop)
	BEGIN
		AluOut<=SigOutAlu;
	END PROCESS;
	

END ARCHITECTURE;


