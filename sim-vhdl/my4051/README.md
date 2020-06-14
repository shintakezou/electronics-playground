    ghdl -s *.vhd*
    ghdl -a *.vhd*
    ghdl -e tb_mux4051d
    ghdl -r tb_mux4051d --vcd=mux4051d.vcd --stop-time=250ns
