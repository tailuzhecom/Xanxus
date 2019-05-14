all: cgen-1 cgen-2

LEVEL = ..
include $(LEVEL)/Makefile.common

MPSRC = stringtab.cc str_aux.cc operand.cc value_printer.cc handle_flags.cc \
	utilities.cc dumptype.cc cgen_supp.cc xanxus-tree.cc tree.cc cgen-phase.cc \
	ast-lex.cc ast-parse.cc 

MPINCL = $(wildcard *.h) $(wildcard $(MPDIR)/include/*.h)

SUPPORT_OBJS = $(MPSRC:.cc=.o)

cgen-1: cgen-1.o  $(SUPPORT_OBJS)
	$(CXX) -o $@ $(LDFLAGS) $(LLVMLIBS) $+ $(LDLIBS)

cgen-1.o: cgen.cc cgen.h xanxus-tree.handcode.h $(MPINCL)
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) $< -o $@

cgen-2: cgen-2.o $(SUPPORT_OBJS)
	$(CXX) -o $@ $(LDFLAGS) $(LLVMLIBS) $+ $(LDLIBS)

cgen-2.o : cgen.cc cgen.h xanxus-tree.handcode.h $(MPINCL)
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -DMP3 $<  -o $@

VPATH = ../xanxus-support/src

xanxusrt.c : xanxusrt.h

xanxusrt.o : xanxusrt.c
	$(CC) -g $(EXTRAFLAGS) -c $< -o $@

xanxusrt.bc : xanxusrt.c xanxusrt.h
	$(LLVMGCC) $(EXTRAFLAGS) -emit-llvm -c xanxusrt.c -o $@

CLEAN_LOCAL= -rm -f core $(OBJS) cgen-1 cgen-2

