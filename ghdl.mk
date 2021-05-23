# Filename: ghdl.mk
# Author: Nikolaos Kavvadias (C) 2016-2021

GHDL=ghdl
GHDLFLAGS=--ieee=standard --workdir=work
GHDLRUNFLAGS=--stop-time=1000000ns

all : run

elab : force
	$(GHDL) -c $(GHDLFLAGS) -e bstest_tb

run : force
	$(GHDL) --elab-run $(GHDLFLAGS) bstest_tb $(GHDLRUNFLAGS)

init : force
	mkdir work
	$(GHDL) -a $(GHDLFLAGS) std_logic_textio.vhd
	$(GHDL) -a $(GHDLFLAGS) bstest.vhd
	$(GHDL) -a $(GHDLFLAGS) bstest_tb.vhd
force : 

clean :
	rm -rf *.o *.ghdl work *_results.txt
