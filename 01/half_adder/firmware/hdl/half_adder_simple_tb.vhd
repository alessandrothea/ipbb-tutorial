-- half_adder_simple_tb.vhd

library ieee;
use ieee.std_logic_1164.all;


entity half_adder_simple_tb is
end half_adder_simple_tb;

architecture tb of half_adder_simple_tb is
    signal a, b : std_logic;  -- inputs 
    --signal sum, carry : std_logic;  -- outputs
    signal input  : std_logic_vector(1 downto 0);
    signal output : std_logic_vector(1 downto 0);
begin
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.half_adder port map (
        a => input(0),
        b => input(1),
        sum => output(0),
        carry => output(1)
    );
     

    stim_proc: process
    begin
        input <= "00"; wait for 10 ns; assert output = "00" report "0+0 failed";
        input <= "01"; wait for 10 ns; assert output = "01" report "0+1 failed";
        input <= "10"; wait for 10 ns; assert output = "01" report "1+0 failed";
        input <= "11"; wait for 10 ns; assert output = "10" report "1+1 failed";
        report "Half adder testbench finished";
        wait;
    end process;
end tb ;