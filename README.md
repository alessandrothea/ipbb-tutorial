# IPBus Builder Tutorial

An essential tutorial to `ipbb`: How to create and simulate and eventually build firmware projects with `ipbb`. The examples, increasing in complexity, show how to include source files in a ipbb project by means of dependency files and use them to create vivado or modelsim/questasim projects.

## 01 - Half adder
A basic 2-bit adder block with testbench
- Code example from [vhdlguide](vhdlguide-half-adder)
- `half-adder` entity: performs a 2 bit-sum with carry-over.
- Provided with top-level testbench, `half-adder_tb`
- Minimal package, no substructure, no component-project splitting

Commands
```sh
ipbb proj create sim 01_half_adder_tb  ipbb-examples:01/half-adder -t half_adder_simple_tb.dep
cd 01_half_adder_tb
ipbb sim make-project
vsim work.half_adder_simple_tb
```

[vhdlguide-half-adder]: https://vhdlguide.readthedocs.io/en/latest/vhdl/firstproject.html#vhdl-half-adder-vhdl
