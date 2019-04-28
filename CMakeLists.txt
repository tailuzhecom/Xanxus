cmake_minimum_required(VERSION 3.13)
project(XanxusProject)

set(CMAKE_CXX_STANDARD 14)

include_directories(src)
include_directories(xanxus-support/include)

add_executable(XanxusProject
        src/cgen.cc
        src/cgen.h
        src/cool-tree.handcode.h
        src/coolrt.c
        src/coolrt.h
        src/operand.cc
        src/operand.h
        src/stringtab.handcode.h
        src/value_printer.cc
        src/value_printer.h
        xanxus-support/include/ast-parse.h
        xanxus-support/include/cgen_gc.h
        xanxus-support/include/cool-io.h
        xanxus-support/include/cool-parse.h
        xanxus-support/include/cool-tree.h
        xanxus-support/include/cool.h
        xanxus-support/include/list.h
        xanxus-support/include/str_aux.h
        xanxus-support/include/stringtab.h
        xanxus-support/include/stringtab_functions.h
        xanxus-support/include/symtab.h
        xanxus-support/include/tree.h
        xanxus-support/include/utilities.h
        xanxus-support/src/ast-lex.cc
        xanxus-support/src/ast-parse.cc
        xanxus-support/src/cgen-phase.cc
        xanxus-support/src/cgen_supp.cc
        xanxus-support/src/cool-tree.cc
        xanxus-support/src/dumptype.cc
        xanxus-support/src/handle_flags.cc
        xanxus-support/src/str_aux.cc
        xanxus-support/src/stringtab.cc
        xanxus-support/src/symtab_example.cc
        xanxus-support/src/tree.cc
        xanxus-support/src/utilities.cc)
