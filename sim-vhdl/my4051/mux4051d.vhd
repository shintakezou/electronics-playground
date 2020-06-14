--
-- Example of a 4051-like component. The D suffix is there
-- to remember that this does not work with analog signals
-- as the real 4051 does.
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4051D is
  port (INH      : in  std_logic;
        Sel_ABC  : in  std_logic_vector (2 downto 0);
        X_in     : in  std_logic_vector (7 downto 0);
        X_out    : out std_logic);
end entity mux4051D;

architecture mux_behave of mux4051D is
begin
  process (Sel_ABC, X_in, INH)
  begin
    if (INH = '1') then
      X_out <= 'Z';
    else
      X_out <= X_in (to_integer (unsigned (Sel_ABC)));
    end if;
  end process;
end architecture mux_behave;
