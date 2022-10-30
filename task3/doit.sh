#!/bin/sh

rm -rf obj_dir
rm -f vsinegen.vcd

verilator -Wall --cc -trace sigdelay.sv twoportram.sv counter.sv --exe sigdelay_tb.cpp

make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

sudo obj_dir/Vsigdelay
