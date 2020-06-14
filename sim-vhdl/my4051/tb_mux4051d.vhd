-- let's test the fake 4051

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_mux4051d is
end entity;


architecture tb_arch of tb_mux4051d is

  constant PACE : time := 25 ns;
  
  component mux4051d
    port (INH      : in  std_logic;
          Sel_ABC  : in  std_logic_vector (2 downto 0);
          X_in     : in  std_logic_vector (7 downto 0);
          X_out    : out std_logic);
  end component;

  signal Sel_ABC : std_logic_vector (2 downto 0);
  signal INH     : std_logic;
  signal X_in    : std_logic_vector (7 downto 0);
  signal X_out   : std_logic;
  
begin
  MUT : mux4051d
    port map (INH     => INH,
              Sel_ABC => Sel_ABC,
              X_in    => X_in,
              X_out   => X_out);

  INH <= '1';  
  X_in <= X"28";

  process
  begin

    a: for i in 0 to 7 loop
      Sel_ABC <= std_logic_vector (to_unsigned (i, Sel_ABC'length));
      wait for PACE;
    end loop;
    
    INH <= '0';
    
    b: for i in 0 to 7 loop
      Sel_ABC <= std_logic_vector (to_unsigned (i, Sel_ABC'length));
      wait for PACE;
    end loop;
    
  end process;
  
end architecture tb_arch;

