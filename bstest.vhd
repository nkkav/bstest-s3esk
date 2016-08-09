library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bstest is
  port ( 
    sldsw  : in  std_logic_vector(3 downto 0);
    button : in  std_logic_vector(3 downto 0); -- N-E-W-S
    led    : out std_logic_vector(7 downto 0)
  );
end bstest;

architecture dataflow of bstest is
begin
  --
  led(7 downto 4) <= sldsw;
  led(3 downto 0) <= button;
--  led <= sldsw & button;
  --
end dataflow;
