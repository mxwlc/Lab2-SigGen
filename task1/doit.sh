#!/bin/sh

#Housekeeping
rm -rf obj_dir
rm -f vsinegen.vcd

#verilator
verilator -Wall --cc --trace sinegen.sv counter.sv rom.sv --exe sinegen_tb.cpp

#make
make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

#run
sudo obj_dir/Vsinegen
