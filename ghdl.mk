# Filename: ghdl.mk
# Author: Nikolaos Kavvadias (C) 2016

GHDL=ghdl
GHDLFLAGS=-fexplicit --ieee=standard --workdir=work
GHDLRUNFLAGS=--stop-time=1000000ns

all : run

elab : force
	$(GHDL) -c $(GHDLFLAGS) -e bstest_tb

run : force
	./bstest.ghdl $(GHDLRUNFLAGS)

init : force
	mkdir work
	$(GHDL) -i $(GHDLFLAGS) std_logic_textio.vhd
	$(GHDL) -i $(GHDLFLAGS) bstest.vhd
	$(GHDL) -i $(GHDLFLAGS) bstest_tb.vhd
	$(GHDL) -m $(GHDLFLAGS) -o bstest.ghdl bstest_tb
force : 

clean :
	rm -rf *.o *.ghdl work
