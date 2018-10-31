# IPBus Builder Tutorial

An essential tutorial to `ipbb`: How to create and simulate and eventually build firmware projects with `ipbb`. The examples, increasing in complexity, show how to include source files in a ipbb project by means of dependency files and use them to create vivado or modelsim/questasim projects.

## 01 - Half adder
A basic 2-bit adder block with testbench
- Code example from [vhdlguide](vhdlguide-half-adder)
- `half-adder` entity: performs a 2 bit-sum with carry-over.
- Provided with top-level testbench, `half-adder_tb`
- Minimal package, no substructure, no component-project splitting

### ipbb commands
```sh
ipbb proj create sim 01_half_adder_tb  ipbb-examples:01/half-adder -t half_adder_simple_tb.dep
cd 01_half_adder_tb
ipbb sim make-project
./vsim -novopt work.half_adder_simple_tb
```

in modelsim/questasim tcl shell
```tcl
add wave -position insertpoint  \
sim:/half_adder_simple_tb/a \
sim:/half_adder_simple_tb/b \
sim:/half_adder_simple_tb/carry \
sim:/half_adder_simple_tb/sum
run 200ns
```


## 02 - Mod Counter
Mod-m counter counts the values from 0 to (m-1).
Identical to `01` from ipbb's perspective
- Code example from [vhdlguide](vhdlguide-half-modMcounter)
- `modMCounter` entity, N-bit counter up to M.
- provided with top-level testbench, `modMCounter_tb`
- Minimal package, no substructure, no component-project splitting
 
```sh
ipbb proj create sim 02_modMCounter_tb  ipbb-examples:02/modMCounter -t modMCounter_tb.dep
cd 02_modMCounter_tb
ipbb sim make-project
vsim work.modMCounter_tb
```


# 03 - Full adder

[vhdlguide-half-adder]: https://vhdlguide.readthedocs.io/en/latest/vhdl/firstproject.html#vhdl-half-adder-vhdl
[vhdlguide-half-modMcounter]: https://vhdlguide.readthedocs.io/en/latest/vhdl/vvd.html#vhdl-modmcounter