LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY teste_lab01 IS 
END ENTITY;

ARCHITECTURE simulacao OF teste_lab01 IS
	COMPONENT systemInteg IS 
		PORT (dv,clock,rst: IN  STD_LOGIC;
		      inpA, inpB  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
	 	      aluOut      : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	  	     );
	END COMPONENT;
	
	SIGNAL dv,clock,rst:      STD_LOGIC;
	SIGNAL inpa,inpb,aluout:STD_LOGIC_VECTOR(4 DOWNTO 0);
	
BEGIN

	tb: systemInteg PORT MAP(dv, clock, rst,inpa,inpb,aluout);	
	
	PROCESS
	BEGIN	inpa<= "11000";inpb<="00011";		
  		dv    <= '0';
  		rst   <= '1'; WAIT FOR 25 NS;
  		rst   <= '0'; WAIT FOR 25 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		dv    <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		dv    <= '0'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		clock <= '0'; WAIT FOR 50 NS;
  		clock <= '1'; WAIT FOR 50 NS;
  		
  		  			
	END PROCESS;

END ARCHITECTURE;





