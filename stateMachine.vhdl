LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;

ENTITY stateMachine IS
	PORT( dv   : IN  STD_LOGIC;
	      clock: IN  STD_LOGIC;
	      reset: IN  STD_LOGIC;
	      
	      selA : OUT STD_LOGIC;
	      wrA  : OUT STD_LOGIC;
	      wrB  : OUT STD_LOGIC;
	      ULAop: OUT INTEGER RANGE 0 TO 4:= 1 
	     );
END ENTITY;

ARCHITECTURE comportamento OF stateMachine IS
	TYPE   State_type IS (idle,load,store);
	SIGNAL y :State_type;
BEGIN
	PROCESS(reset,clock)
	BEGIN
		IF reset = '1' THEN
			y <= idle;
		ELSIF clock'EVENT AND clock = '1' THEN
			CASE y IS
				WHEN idle => 
					IF dv = '1' THEN 
					    y <= load;
					END IF;
				
				WHEN load => 
					y <= store;
				
				WHEN store =>
					y <= idle;
					
			END CASE;
		END IF;
	END PROCESS;
		selA <= '1' WHEN     y = load            ELSE '0';
		wrA  <= '1' WHEN (y = load OR y = store) ELSE '0';
		wrB  <= '1' WHEN     y = load            ELSE '0';
		ULAop<=  1  WHEN     y = idle            ELSE 3 WHEN y = store; 
	
END ARCHITECTURE;

		
		

	       	

