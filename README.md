# IPBus Builder Tutorial

An essential tutorial to `ipbb`: How to create and simulate and eventually build firmware projects with `ipbb`. The examples, increasing in complexity, show how to include source files in a ipbb project by means of dependency files and use them to create vivado or modelsim/questasim projects.

## Getting started

Install `ipbb` locally:
```sh
curl -L https://github.com/ipbus/ipbb/archive/v0.3.7.tar.gz | tar xvz
source ipbb-0.3.7/env.sh
```

Prepare a work are and add the tutorial code to it:
```sh
ipbb init tutorial
cd tutorial
ipbb add git git@github.com:alessandrothea/ipbb-tutorial.git
```

## 01 - Half adder
A simple 2-bit adder block with testbench.
- Minimal package example, no substructure, no component-project splitting
- Code example from [vhdlguide](vhdlguide-half-adder)
- `half_adder` entity: calculates a 2 bit-sum with carry-over.
- `half_adder_tb` testbench: tests all output values.

### ipbb commands
```sh
ipbb proj create sim 01_half_adder_tb  ipbb-tutorial:01/half_adder -t half_adder_simple_tb.dep
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
- Minimal package, no substructure, no component-project splitting
- Code example from [vhdlguide](vhdlguide-half-modMcounter)
- `modMCounter` entity, N-bit counter up to M.
- provided with top-level testbench, `modMCounter_tb`
 
### ipbb commands
```sh
ipbb proj create sim 02_modMCounter_tb  ipbb-tutorial:02/modMCounter -t modMCounter_tb.dep
cd 02_modMCounter_tb
ipbb sim make-project
vsim -novopt work.modMCounter_tb
```

in modelsim/questasim tcl shell

## 03 - Full adder
A full adder implementation using 2 half adders. 
- 2-components examples. `half_adder` and `full_adder` belong to different "components". The testbench is located in a separate folder `tests`.
- `full_adder` entity: implements a full 2-bit adder as with 2 half_adders.
- `full_adder_tb` testbench: tests all output values.

### ipbb commands
```sh
ipbb proj create sim 03_full_adder ipbb-tutorial:03/tests -t full_adder_tb.dep
cd 03_full_adder
ipbb sim make-project
./vsim -novopt work.half_adder_simple_tb
```


[vhdlguide-half-adder]: https://vhdlguide.readthedocs.io/en/latest/vhdl/firstproject.html#vhdl-half-adder-vhdl
[vhdlguide-half-modMcounter]: https://vhdlguide.readthedocs.io/en/latest/vhdl/vvd.html#vhdl-modmcounter
