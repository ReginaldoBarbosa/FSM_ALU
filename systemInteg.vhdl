LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY systemInteg IS 
	PORT (dv,clock,rst: IN  STD_LOGIC;
	      inpA, inpB  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
	      aluOut      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	      );
END ENTITY;

ARCHITECTURE comportamento OF systemInteg IS
	COMPONENT systemUla IS 
		PORT(inpA, inpB : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		     selA       : IN  STD_LOGIC;
		     wrA, wrB   : IN  STD_LOGIC;
		     ALUop      : IN  INTEGER RANGE 0 TO 4;
	 	     ALUout     : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	     );
	END COMPONENT;
	
	COMPONENT stateMachine IS
		PORT( dv   : IN  STD_LOGIC;
		      clock: IN  STD_LOGIC;
	 	      reset: IN  STD_LOGIC;
	      
	 	      selA : OUT STD_LOGIC;
	 	      wrA  : OUT STD_LOGIC;
	 	      wrB  : OUT STD_LOGIC;
	 	      ULAop: OUT INTEGER RANGE 0 TO 4:= 1 
	 	    );
	 END COMPONENT;
	 
	 SIGNAL SigSelA,SigWrA,SigWrb: STD_LOGIC;
	 SIGNAL SigUlaOp             : INTEGER RANGE 0 TO 4;
	
BEGIN
	stateMa: stateMachine PORT MAP(dv,clock,rst,SigSelA,SigWrA,SigWrb,SigUlaOp);
	Ulala  : systemUla    PORT MAP(inpA,inpB,SigSelA,SigWrA,SigWrb,SigUlaOp, aluOut);
	
END ARCHITECTURE;

