-- full_adder.vhd

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a          : in  std_logic;
        b          : in  std_logic;
        carry_in   : in  std_logic;
        sum        : out std_logic;
        carry_out  : out std_logic
    );
end;

architecture behavioral of full_adder is
    signal carry_1, carry_2, part_sum: std_logic; --
begin
    -- connecting testbench signals with half_adder.vhd
    ha1 : entity work.half_adder
    port map (
        a => a,
        b => b,
        sum => part_sum,
        carry => carry_1
    );

    ha2 : entity work.half_adder 
    port map (
        a => carry_in,
        b => part_sum,
        sum => sum,
        carry => carry_2
    );

    carry_out <= carry_1 or carry_2;
end;
