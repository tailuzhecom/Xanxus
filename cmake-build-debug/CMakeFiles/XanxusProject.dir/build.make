# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/young/下载/clion-2018.3.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/young/下载/clion-2018.3.3/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/young/桌面/XanxusProject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/young/桌面/XanxusProject/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/XanxusProject.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/XanxusProject.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/XanxusProject.dir/flags.make

CMakeFiles/XanxusProject.dir/src/cgen.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/src/cgen.cc.o: ../src/cgen.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/XanxusProject.dir/src/cgen.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/src/cgen.cc.o -c /home/young/桌面/XanxusProject/src/cgen.cc

CMakeFiles/XanxusProject.dir/src/cgen.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/src/cgen.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/src/cgen.cc > CMakeFiles/XanxusProject.dir/src/cgen.cc.i

CMakeFiles/XanxusProject.dir/src/cgen.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/src/cgen.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/src/cgen.cc -o CMakeFiles/XanxusProject.dir/src/cgen.cc.s

CMakeFiles/XanxusProject.dir/src/coolrt.c.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/src/coolrt.c.o: ../src/coolrt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/XanxusProject.dir/src/coolrt.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/XanxusProject.dir/src/coolrt.c.o   -c /home/young/桌面/XanxusProject/src/coolrt.c

CMakeFiles/XanxusProject.dir/src/coolrt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/XanxusProject.dir/src/coolrt.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/young/桌面/XanxusProject/src/coolrt.c > CMakeFiles/XanxusProject.dir/src/coolrt.c.i

CMakeFiles/XanxusProject.dir/src/coolrt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/XanxusProject.dir/src/coolrt.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/young/桌面/XanxusProject/src/coolrt.c -o CMakeFiles/XanxusProject.dir/src/coolrt.c.s

CMakeFiles/XanxusProject.dir/src/operand.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/src/operand.cc.o: ../src/operand.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/XanxusProject.dir/src/operand.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/src/operand.cc.o -c /home/young/桌面/XanxusProject/src/operand.cc

CMakeFiles/XanxusProject.dir/src/operand.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/src/operand.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/src/operand.cc > CMakeFiles/XanxusProject.dir/src/operand.cc.i

CMakeFiles/XanxusProject.dir/src/operand.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/src/operand.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/src/operand.cc -o CMakeFiles/XanxusProject.dir/src/operand.cc.s

CMakeFiles/XanxusProject.dir/src/value_printer.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/src/value_printer.cc.o: ../src/value_printer.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/XanxusProject.dir/src/value_printer.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/src/value_printer.cc.o -c /home/young/桌面/XanxusProject/src/value_printer.cc

CMakeFiles/XanxusProject.dir/src/value_printer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/src/value_printer.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/src/value_printer.cc > CMakeFiles/XanxusProject.dir/src/value_printer.cc.i

CMakeFiles/XanxusProject.dir/src/value_printer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/src/value_printer.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/src/value_printer.cc -o CMakeFiles/XanxusProject.dir/src/value_printer.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.o: ../xanxus-support/src/ast-lex.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/ast-lex.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/ast-lex.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/ast-lex.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.o: ../xanxus-support/src/ast-parse.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/ast-parse.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/ast-parse.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/ast-parse.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.o: ../xanxus-support/src/cgen-phase.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/cgen-phase.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/cgen-phase.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/cgen-phase.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.o: ../xanxus-support/src/cgen_supp.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/cgen_supp.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/cgen_supp.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/cgen_supp.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.o: ../xanxus-support/src/cool-tree.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/cool-tree.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/cool-tree.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/cool-tree.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.o: ../xanxus-support/src/dumptype.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/dumptype.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/dumptype.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/dumptype.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.o: ../xanxus-support/src/handle_flags.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/handle_flags.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/handle_flags.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/handle_flags.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.o: ../xanxus-support/src/str_aux.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/str_aux.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/str_aux.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/str_aux.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.o: ../xanxus-support/src/stringtab.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/stringtab.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/stringtab.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/stringtab.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.o: ../xanxus-support/src/symtab_example.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/symtab_example.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/symtab_example.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/symtab_example.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.o: ../xanxus-support/src/tree.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/tree.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/tree.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/tree.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.s

CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.o: CMakeFiles/XanxusProject.dir/flags.make
CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.o: ../xanxus-support/src/utilities.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.o -c /home/young/桌面/XanxusProject/xanxus-support/src/utilities.cc

CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/young/桌面/XanxusProject/xanxus-support/src/utilities.cc > CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.i

CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/young/桌面/XanxusProject/xanxus-support/src/utilities.cc -o CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.s

# Object files for target XanxusProject
XanxusProject_OBJECTS = \
"CMakeFiles/XanxusProject.dir/src/cgen.cc.o" \
"CMakeFiles/XanxusProject.dir/src/coolrt.c.o" \
"CMakeFiles/XanxusProject.dir/src/operand.cc.o" \
"CMakeFiles/XanxusProject.dir/src/value_printer.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.o" \
"CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.o"

# External object files for target XanxusProject
XanxusProject_EXTERNAL_OBJECTS =

XanxusProject: CMakeFiles/XanxusProject.dir/src/cgen.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/src/coolrt.c.o
XanxusProject: CMakeFiles/XanxusProject.dir/src/operand.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/src/value_printer.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-lex.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/ast-parse.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen-phase.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/cgen_supp.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/cool-tree.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/dumptype.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/handle_flags.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/str_aux.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/stringtab.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/symtab_example.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/tree.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/xanxus-support/src/utilities.cc.o
XanxusProject: CMakeFiles/XanxusProject.dir/build.make
XanxusProject: CMakeFiles/XanxusProject.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Linking CXX executable XanxusProject"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/XanxusProject.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/XanxusProject.dir/build: XanxusProject

.PHONY : CMakeFiles/XanxusProject.dir/build

CMakeFiles/XanxusProject.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/XanxusProject.dir/cmake_clean.cmake
.PHONY : CMakeFiles/XanxusProject.dir/clean

CMakeFiles/XanxusProject.dir/depend:
	cd /home/young/桌面/XanxusProject/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/young/桌面/XanxusProject /home/young/桌面/XanxusProject /home/young/桌面/XanxusProject/cmake-build-debug /home/young/桌面/XanxusProject/cmake-build-debug /home/young/桌面/XanxusProject/cmake-build-debug/CMakeFiles/XanxusProject.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/XanxusProject.dir/depend

