library IEEE, STD;
use STD.textio.all;
use WORK.std_logic_textio.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity bstest_tb is
end bstest_tb;


architecture tb_arch of bstest_tb is

  -- UUT component
  component bstest
    port ( 
      sldsw  : in  std_logic_vector(3 downto 0);
      button : in  std_logic_vector(3 downto 0); -- N-E-W-S
      led    : out std_logic_vector(7 downto 0)
    );
  end component;
  -- I/O signals
  signal clk    : std_logic := '0';
  signal sldsw  : std_logic_vector(3 downto 0);
  signal button : std_logic_vector(3 downto 0);
  signal led    : std_logic_vector(7 downto 0);
  -- Constant declarations
  constant CLK_PERIOD : time := 20 ns;
  -- Declare results file
  file ResultsFile: text open write_mode is "bstest_results.txt";

begin

  uut : bstest
    port map (
      sldsw  => sldsw,
      button => button,
      led => led
    );

  DATA_STIM: process
    variable count_hi : integer range 0 to 15 := 0;
    variable count_lo : integer range 0 to 15 := 0;
    variable line_el: line;
  begin
    for i in 0 to 255 loop
      count_hi := i / 16;
      count_lo := i mod 16;
      sldsw <= std_logic_vector(to_unsigned(count_hi, 4));
      button <= std_logic_vector(to_unsigned(count_lo, 4));

      -- Write the time
      write(line_el, now);   -- write the line
      write(line_el, ':');   -- write the line

      -- Write the sldsw signal
      write(line_el, ' ');
      write(line_el, sldsw);  -- write the line

      -- Write the button signal
      write(line_el, ' ');
      write(line_el, button);  -- write the line

      wait for CLK_PERIOD;

      -- Write the led signal
      write(line_el, ' ');
      write(line_el, led);  -- write the line

      writeline(ResultsFile, line_el); -- write the contents into the file

      wait for 9*CLK_PERIOD;
    end loop;
    wait for CLK_PERIOD;
  end process DATA_STIM;

end tb_arch;

