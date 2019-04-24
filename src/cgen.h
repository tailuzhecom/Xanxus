//
// This is the MP2 skeleton cgen header.  As given, it contains only basic
// functionality.  You will need to add members to each of the classes
// to get them to perform their desired functions.  Document your important
// design decisions below.  We should be able to read your documentation and
// get a general overview of how your compiler generates code.  For instance,
// how does your compiler generate structures for classes, how is inheritance
// modeled, how do you handle dynamic binding, etc.
//

// ------------------ INSERT DESIGN DOCUMENTATION HERE --------------------- //


// ----------------------------- END DESIGN DOCS --------------------------- //

#include "cool-tree.h"
#include "symtab.h"
#include "value_printer.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Constants.h"
#include <memory>
#include <vector>
#include <map>
#include <deque>
#include "llvm/Support/raw_os_ostream.h"

//
// CgenClassTable represents the top level of a Cool program, which is
// basically a list of classes.  The class table is used to look up classes
// (CgenNodes) by name, and it also handles global code generation tasks.
// The CgenClassTable constructor is where you'll find the entry point for
// code generation for an entire Cool program.
// 

using namespace llvm;

llvm::LLVMContext xanxus_context;
llvm::IRBuilder<> xanxus_builder(xanxus_context);
std::unique_ptr<llvm::Module> xanxus_module = make_unique<Module>("Xanxus", xanxus_context);
std::map<std::string, Type*> types_map; // 将所有声明的StructType类型都存储在这里
std::string class_handling_str;

class CgenClassTable : public cool::SymbolTable<Symbol,CgenNode> 
{
private:
	// Class list
	List<CgenNode> *nds;
	List<CgenNode> *special_nds;
	int current_tag;
    
#ifndef MP3
	CgenNode* getMainmain(CgenNode* c);
#endif

public:
	// The ostream where we are emitting code
	ostream *ct_stream;
	// CgenClassTable constructor begins and ends the code generation process
	CgenClassTable(Classes, ostream& str);
	~CgenClassTable();

	// Get the root of the class Tree, i.e. Object
	CgenNode *root();
	int get_num_classes() const	{ return current_tag; }

private:
	// COMPLETE FUNCTIONS
    
	// Create declarations for C runtime functions we need to generate code
	void setup_external_functions();
	void setup_classes(CgenNode *c, int depth, std::vector<std::string> attr_array, std::vector<Type*> type_array);


	void code_classes(CgenNode *c);


	// The following creates an inheritance graph from a list of classes.  
	// The graph is implemented as a tree of `CgenNode', and class names 
	// are placed in the base class symbol table.
	void install_basic_classes();
	void install_class(CgenNode *nd);
	void install_special_class(CgenNode *nd);
	void install_classes(Classes cs);
	void build_inheritance_tree();
	void set_relations(CgenNode *nd);
    
	// INCOMPLETE FUNCTIONS
    
	// Setup each class in the table and prepare for code generation phase
	void setup();
    
	// Code generation functions. You need to write these functions.
	void code_module();
	void code_constants();
	void code_main();

	// ADD CODE HERE

};

    
//
// Each CgenNode corresponds to a Cool class.  As such, it is responsible for
// performing code generation on the class level.  This includes laying out
// the class attributes, creating the necessary Types for the class and 
// generating code for each of its methods.
//
class CgenNode : public class__class 
{
public:
	enum Basicness
	{ Basic, NotBasic };

#ifndef MP3
	void codeGenMainmain();
#endif

private: 
	CgenNode *parentnd;                        // Parent of class
	List<CgenNode> *children;                  // Children of class
	Basicness basic_status;                    // `Basic' or 'NotBasic'
	CgenClassTable *class_table;
    
	// Class tag.  Should be unique for each class in the tree
	int tag;
	int max_child;

public:
	// COMPLETE FUNCTIONS

	// Relationships with other nodes in the tree
 	CgenNode *get_parentnd() { return parentnd; }
	void add_child(CgenNode *child);
	void set_parentnd(CgenNode *p);
	int basic() { return (basic_status == Basic); }
	List<CgenNode> *get_children() { return children; }
    
	// Accessors for other provided fields
	int get_tag() const 	{ return tag; }
	CgenClassTable *get_classtable() { return class_table; }

	void set_max_child(int mc) 	{ max_child = mc; }
	int get_max_child() const 	{ return max_child; }

	// INCOMPLETE FUNCTIONS
    
	// Constructs a CgenNode from a Class
	CgenNode(Class_ c, Basicness bstatus, CgenClassTable *class_table);
	virtual ~CgenNode() { }

	// Class setup. You need to write the body of this function.
	void setup(int tag, int depth, std::vector<std::string> &attr_array, std::vector<Type*> &type_array);

	// Class codegen. You need to write the body of this function.
	void code_class();

	// ADD CODE HERE
	string get_type_name() { return string(name->get_string()); }

	void setup_attr_types(Symbol type_decl, CgenNode *cls);
	Type* convert_symbol_to_type(const Symbol& sym);
	void vtable_vec_push_back(Type *vtable_item) { vtable_vec.push_back(vtable_item); }
	void vtable_constant_push_back(Constant *item) { vtable_constants.push_back(item); }
	// 生成llvm中的方法名
    std::string create_method_name(const std::string &method) { return std::string(name->get_string()) + "_" + method; }
    StructType* get_class_type() { return class_type; }
    StructType* get_vtable_type() { return vtable_type; }
    void name_array_push_back(const std::string &attr_name) { attr_name_array.push_back(attr_name); }

private:
	// Layout the methods and attributes for code generation
	// You need to write the body of this function.
	void layout_features();

	// ADD CODE HERE
	void create_vtable();
	void create_struct_type();
	void create_ctor();
    std::string vtable_name;    // llvm vtable type name : class_vtable
    std::string ctor_name;      // llvm ctor name : class_ctor
    StructType *class_type;
    StructType *vtable_type;

	vector<Type*> attr_types;  // used to construct class_type
	vector<Type*> vtable_vec;  // used to construct vtable type
	vector<Constant*> vtable_constants; // 方法指针
	std::vector<std::string> attr_name_array;  // 记录成员变量名在struct type中的index，从０开始

};

//
// CgenEnvironment provides the environment for code generation of a method.
// Its main task is to provide a mapping from Cool names to LLVM Values.
// This mapping needs to be maintained as scopes are entered and exited, new
// variables are declared, and so on. CgenEnvironment is also a good place
// to put non-local information you will need during code generation.  Two
// examples are the current CgenNode and the current Function.
//
class MethodSymboTable {
public:
	void enterscope() { table.push_back(std::map<std::string, Value*>()); }
	void exitscope() { table.erase(table.end() - 1); }
	void addid(const std::string &name, Value* val) {
		table[table.size() - 1][name] = val;
	}
	Value* lookup(const std::string &name) {
		for (int i = table.size() - 1; i >= 0 ; i--) {
			auto res = table[i][name];
			if (res)
				return res;
		}
		return nullptr;
	}

	Value* probe(const std::string &name) {
		auto res = table[table.size() - 1][name];
		if (res)
			return res;
		return nullptr;
	}

	void clear() { table.clear(); }

private:
	std::vector<std::map<std::string, Value*> > table;
};

class CgenEnvironment
{

private:
	// mapping from variable names to memory locations
	//cool::SymbolTable<std::string,Value> var_table;
	MethodSymboTable var_table;
	// Keep counters for unique name generation in the current method
	int block_count;
	int tmp_count;
	int ok_count;

	// ADD CODE HERE
	CgenNode *cur_class;
    std::vector<std::string> attr_array;


public:
	std::ostream *cur_stream;
    Function *func_ptr; // 当前处理的函数
    Value *this_ptr;    // 函数中的this指针

	// Used in provided code for the (case..of) construct
	string next_label;
	operand branch_operand;    
	void add_local(std::string name, Value *vb);
	void kill_local();
	void enterscope() { var_table.enterscope(); }
	void exitscope() { var_table.exitscope(); }
	void symboltable_clear(); // 清空var_table
	// end of helpers for provided code

	CgenEnvironment(ostream &stream, CgenNode *cur_class);


	Value* lookup(const std::string &name)	{ return var_table.lookup(name); }
    
	CgenNode *get_class() { return cur_class; }
	void set_class(CgenNode *c) { cur_class = c; }
    
	// INCOMPLETE FUNCTIONS

	// Must return the CgenNode for a class given the symbol of its name
	CgenNode *type_to_class(Symbol t);
	// ADD CODE HERE
	void get_attr_array(const std::vector<std::string> &attrs) { attr_array = attrs; }
	void update_attr();
	void set_this_ptr(Value *p) { this_ptr = p; }
	Value* get_this_ptr() { return this_ptr; }
	
};

// Utitlity function
// Generate any code necessary to convert from given operand to
// dest_type, assuing it has already been checked to be compatible
Value* conform(operand src, op_type dest_type, CgenEnvironment *env);
// Retrieve the class tag from operand src. Argument is the cgen node for
// the static class of src.
Value* get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env);
std::string util_create_method_name(const std::string &method) { return class_handling_str + "_" + method; }
Constant* util_get_int32(const uint64_t &i) { return ConstantInt::get(Type::getInt32Ty(xanxus_context), APInt(32, i)); }
Constant* util_get_int1(const uint64_t &i) { return ConstantInt::get(Type::getInt32Ty(xanxus_context), APInt(1, i)); }
Function *util_get_builtin_func(const std::string &name);