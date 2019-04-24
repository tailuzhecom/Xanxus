//**************************************************************
//
// Code generator SKELETON
//
// Read the comments carefully and add code to build an LLVM program 
//**************************************************************

#define EXTERN
#include "cgen.h"
#include <string>
#include <sstream>

// 
extern int cgen_debug;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.  Feel free to add your
// own definitions as you see fit.
//
//////////////////////////////////////////////////////////////////////
EXTERN Symbol 
	// required classes
	Object,
	IO,
	String,
	Int,
	Bool,
	Main,

	// class methods
	cool_abort,
	type_name,
	cool_copy,
	out_string,
	out_int,
	in_string,
	in_int,
	length,
	concat,
	substr,

	// class members
	val,

	// special symbols
	No_class,    // symbol that can't be the name of any user-defined class
	No_type,     // If e : No_type, then no code is generated for e.
	SELF_TYPE,   // Special code is generated for new SELF_TYPE.
	self,        // self generates code differently than other references

	// extras
	arg,
	arg2,
	prim_string,
	prim_int,
	prim_bool;


//********************************************************
//
// PREDEFINED FUNCTIONS:
//
// The following functions are already coded, you should
// not need to modify them, although you may if necessary.
//
//********************************************************

//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
	Object      = idtable.add_string("Object");
	IO          = idtable.add_string("IO");
	String      = idtable.add_string("String");
	Int         = idtable.add_string("Int");
	Bool        = idtable.add_string("Bool");
	Main        = idtable.add_string("Main");

	cool_abort  = idtable.add_string("abort");
	type_name   = idtable.add_string("type_name");
	cool_copy   = idtable.add_string("copy");
	out_string  = idtable.add_string("out_string");
	out_int     = idtable.add_string("out_int");
	in_string   = idtable.add_string("in_string");
	in_int      = idtable.add_string("in_int");
	length      = idtable.add_string("length");
	concat      = idtable.add_string("concat");
	substr      = idtable.add_string("substr");

	val         = idtable.add_string("val");

	No_class    = idtable.add_string("_no_class");
	No_type     = idtable.add_string("_no_type");
	SELF_TYPE   = idtable.add_string("SELF_TYPE");
	self        = idtable.add_string("self");

	arg         = idtable.add_string("arg");
	arg2        = idtable.add_string("arg2");
	prim_string = idtable.add_string("sbyte*");
	prim_int    = idtable.add_string("int");
	prim_bool   = idtable.add_string("bool");
}

//*********************************************************
//
// Define method for code generation
//
// This is the method called by the compiler driver
// `cgtest.cc'. cgen takes an `ostream' to which the assembly will be
// emitted, and it passes this and the class list of the
// code generator tree to the constructor for `CgenClassTable'.
// That constructor performs all of the work of the code
// generator.
//
//*********************************************************
void program_class::cgen(ostream &os) 
{
	initialize_constants();
	class_table = new CgenClassTable(classes,os);
}


// Create definitions for all String constants
void StrTable::code_string_table(ostream& s, CgenClassTable* ct)
{
	for (List<StringEntry> *l = tbl; l; l = l->tl()) {
		l->hd()->code_def(s, ct);
	}
}

// Create definitions for all Int constants
void IntTable::code_string_table(ostream& s, CgenClassTable* ct)
{
	for (List<IntEntry> *l = tbl; l; l = l->tl()) {
		l->hd()->code_def(s, ct);
	}
}

//
// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP2.1
//
void CgenClassTable::setup_external_functions()
{
    if (cgen_debug) std::cerr << "CgenClassTable::setup_external_functions" << endl;
	ValuePrinter vp;
	// setup function: external int strcmp(sbyte*, sbyte*)
	op_type i32_type(INT32), i8ptr_type(INT8_PTR), vararg_type(VAR_ARG);
	vector<op_type> strcmp_args;
	strcmp_args.push_back(i8ptr_type);
	strcmp_args.push_back(i8ptr_type);	
	vp.declare(*ct_stream, i32_type, "strcmp", strcmp_args); 

	// setup function: external int printf(sbyte*, ...)
	llvm::FunctionType *print_type = llvm::FunctionType::get(
			llvm::Type::getInt32Ty(xanxus_context),
			{llvm::Type::getInt8PtrTy(xanxus_context)},
			true);
	llvm::Function::Create(print_type, llvm::GlobalValue::ExternalLinkage, "printf", xanxus_module.get());
	// setup function: external void abort(void)
	op_type void_type(VOID);
	vector<op_type> abort_args;
	vp.declare(*ct_stream, void_type, "abort", abort_args);

	// setup function: external i8* malloc(i32)
	vector<op_type> malloc_args;
	malloc_args.push_back(i32_type);
	vp.declare(*ct_stream, i8ptr_type, "malloc", malloc_args);

#ifdef MP3
	//ADD CODE HERE
	//Setup external functions for built in object class functions
#endif
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes()
{
    if (cgen_debug) std::cerr << "CgenClassTable::install_basic_classes" << endl;
	// The tree package uses these globals to annotate the classes built below.
	curr_lineno = 0;
	Symbol filename = stringtable.add_string("<basic class>");

	//
	// A few special class names are installed in the lookup table but not
	// the class list. Thus, these classes exist, but are not part of the
	// inheritance hierarchy.
	 
	// No_class serves as the parent of Object and the other special classes.
	Class_ noclasscls = class_(No_class,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(noclasscls, CgenNode::Basic, this));
	delete noclasscls;

#ifdef MP3
	// SELF_TYPE is the self class; it cannot be redefined or inherited.
	Class_ selftypecls = class_(SELF_TYPE,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(selftypecls, CgenNode::Basic, this));
	delete selftypecls;
	// 
	// Primitive types masquerading as classes. This is done so we can
	// get the necessary Symbols for the innards of String, Int, and Bool
	//
	Class_ primstringcls = class_(prim_string,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primstringcls, CgenNode::Basic, this));
	delete primstringcls;
#endif
	// Int class
	Class_ primintcls = class_(prim_int,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primintcls, CgenNode::Basic, this));
	delete primintcls;
	// Bool class
	Class_ primboolcls = class_(prim_bool,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primboolcls, CgenNode::Basic, this));
	delete primboolcls;
	// 
	// The Object class has no parent class. Its methods are
	//        cool_abort() : Object   aborts the program
	//        type_name() : Str       returns a string representation of class name
	//        copy() : SELF_TYPE      returns a copy of the object
	//
	// There is no need for method bodies in the basic classes---these
	// are already built in to the runtime system.
	//
	// TODO 为了生成程序的可运行性，目前禁用了一些basic　class的install
	// Object class
	Class_ objcls =
		class_(Object, 
		       No_class,
//		       append_Features(
//		       append_Features(
//		       single_Features(method(cool_abort, nil_Formals(),
//		                              Object, no_expr())),
//		       single_Features(method(type_name, nil_Formals(),
//		                              String, no_expr()))),
//		       single_Features(method(cool_copy, nil_Formals(),
//		                              SELF_TYPE, no_expr()))),
				nil_Features(),
		       filename);
	install_class(new CgenNode(objcls, CgenNode::Basic, this));
	delete objcls;

//
// The Int class has no methods and only a single attribute, the
// "val" for the integer. 
//
	Class_ intcls=
		class_(Int, 
		       Object,
		       single_Features(attr(val, prim_int, no_expr())),
		       filename);
	//install_class(new CgenNode(intcls, CgenNode::Basic, this));
	delete intcls;

//
// Bool also has only the "val" slot.
//
	Class_ boolcls=
		class_(Bool,  
		       Object, 
		       single_Features(attr(val, prim_bool, no_expr())),
		       filename);
	//install_class(new CgenNode(boolcls, CgenNode::Basic, this));
	delete boolcls;

//
// The class String has a number of slots and operations:
//       val                                  the string itself
//       length() : Int                       length of the string
//       concat(arg: Str) : Str               string concatenation
//       substr(arg: Int, arg2: Int): Str     substring
//       
	Class_ stringcls =
		class_(String, 
		       Object,
		       append_Features(
		       append_Features(
		       append_Features(
		       single_Features(attr(val, prim_string, no_expr())),
		       single_Features(method(length, nil_Formals(),
		                              Int, no_expr()))),
		       single_Features(method(concat,
		                              single_Formals(formal(arg, String)),
		                              String,
		                              no_expr()))),
		       single_Features(method(substr, 
		                              append_Formals(
		                                 single_Formals(formal(arg, Int)), 
		                                 single_Formals(formal(arg2, Int))),
		                              String, 
		                              no_expr()))),
		       filename);
	//install_class(new CgenNode(stringcls, CgenNode::Basic, this));
	delete stringcls;


#ifdef MP3
// 
// The IO class inherits from Object. Its methods are
//        out_string(Str) : SELF_TYPE          writes a string to the output
//        out_int(Int) : SELF_TYPE               "    an int    "  "     "
//        in_string() : Str                    reads a string from the input
//        in_int() : Int                         "   an int     "  "     "
//
	Class_ iocls =
		class_(IO,
		       Object,
		       append_Features(
		       append_Features(
		       append_Features(
		       single_Features(method(out_string,
		                              single_Formals(formal(arg, String)),
		                              SELF_TYPE, no_expr())),
		       single_Features(method(out_int, single_Formals(formal(arg, Int)),
		                              SELF_TYPE, no_expr()))),
		       single_Features(method(in_string, nil_Formals(), String,
		                              no_expr()))),
		       single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
		       filename);
	//install_class(new CgenNode(iocls, CgenNode::Basic, this));
	delete iocls;
#endif
}

//
// install_classes enters a list of classes in the symbol table.
//
void CgenClassTable::install_classes(Classes cs)
{
    if (cgen_debug) std::cerr << "CgenClassTable::install_classes" << endl;
	for (int i = cs->first(); cs->more(i); i = cs->next(i)) {
		install_class(new CgenNode(cs->nth(i),CgenNode::NotBasic,this));
	}
}

// 
// Add this CgenNode to the class list and the lookup table
// 
void CgenClassTable::install_class(CgenNode *nd)
{
    if (cgen_debug) std::cerr << "CgenClassTable::install_class" << endl;
	Symbol name = nd->get_name();

	if (probe(name)) // 如果该class已经存在
		return;

	// The class name is legal, so add it to the list of classes
	// and the symbol table.
	nds = new List<CgenNode>(nd,nds);
	addid(name,nd);
}

// 
// Add this CgenNode to the special class list and the lookup table
// 
void CgenClassTable::install_special_class(CgenNode *nd)
{
    if (cgen_debug) std::cerr << "CgenClassTable::install_special_class" << endl;
	Symbol name = nd->get_name();

	if (probe(name))
		return;

	// The class name is legal, so add it to the list of special classes
	// and the symbol table.
	special_nds = new List<CgenNode>(nd, special_nds);
	addid(name,nd);
}

//
// CgenClassTable::build_inheritance_tree
//
void CgenClassTable::build_inheritance_tree()
{
    if (cgen_debug) std::cerr << "CgenClassTable::build_inheritance_tree" << endl;
	for(List<CgenNode> *l = nds; l; l = l->tl())
		set_relations(l->hd());
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd)
{
    if (cgen_debug) std::cerr << "CgenClassTable::set_relations" << endl;
	CgenNode *parent_node = probe(nd->get_parent());
	nd->set_parentnd(parent_node);
	parent_node->add_child(nd); // 一个parent可能有多个children
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root()
{
    if (cgen_debug) std::cerr << "CgenClassTable::root" << std::endl;
	return probe(Object);
}

//////////////////////////////////////////////////////////////////////
//
// Special-case functions used for the method Int Main::main() for
// MP2-1 only.
//
//////////////////////////////////////////////////////////////////////

#ifndef MP3

CgenNode* CgenClassTable::getMainmain(CgenNode* c)
{
	if (c && ! c->basic())
		return c;                   // Found it!

	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl()) {
		if (CgenNode* foundMain = this->getMainmain(child->hd()))
			return foundMain;   // Propagate it up the recursive calls
	}

	return 0;                           // Make the recursion continue
}

#endif

//-------------------------------------------------------------------
//
// END OF PREDEFINED FUNCTIONS
//
//-------------------------------------------------------------------


///////////////////////////////////////////////////////////////////////////////
//
// coding string, int, and boolean constants
//
// Cool has three kinds of constants: strings, ints, and booleans.
// This section defines code generation for each type.
//
// All string constants are listed in the global "stringtable" and have
// type stringEntry.  stringEntry methods are defined both for string
// constant definitions and references.
//
// All integer constants are listed in the global "inttable" and have
// type IntEntry.  IntEntry methods are defined for Int
// constant definitions and references.
//
// Since there are only two Bool values, there is no need for a table.
// The two booleans are represented by instances of the class BoolConst,
// which defines the definition and reference methods for Bools.
//
///////////////////////////////////////////////////////////////////////////////

//
// Create global definitions for constant Cool objects
//
void CgenClassTable::code_constants()
{
    if (cgen_debug) std::cerr << "CgenClassTable::code_constants" << endl;
    // 处理stringtable中的item，将item声明为global constant
}

// generate code to define a global string constant
void StringEntry::code_def(ostream& s, CgenClassTable* ct)
{
#ifdef MP3
	// ADD CODE HERE
#endif
}

// generate code to define a global int constant
void IntEntry::code_def(ostream& s, CgenClassTable* ct)
{
	// Leave this method blank, since we are not going to use global
	// declarations for int constants.
}

//////////////////////////////////////////////////////////////////////////////
//
//  CgenClassTable methods
//
//////////////////////////////////////////////////////////////////////////////

//
// CgenClassTable constructor orchestrates all code generation
//
CgenClassTable::CgenClassTable(Classes classes, ostream& s) 
: nds(0)
{
	if (cgen_debug) std::cerr << "Building CgenClassTable" << endl;
	ct_stream = &s;

	// Make sure we have a scope, both for classes and for constants
	enterscope();

	// Create an inheritance tree with one CgenNode per class.
	install_basic_classes();
	install_classes(classes);
	build_inheritance_tree();

	// First pass
	setup();

	// Second pass
	code_module();
	// Done with code generation: exit scopes
	exitscope();
	llvm::raw_os_ostream os(*ct_stream);
	xanxus_module->print(os, nullptr);

}

CgenClassTable::~CgenClassTable()
{

}

// The code generation first pass.  Define these two functions to traverse
// the tree and setup each CgenNode
// 遍历继承树，注意CgenClassTable和CgenNode都有setup函数
void CgenClassTable::setup()
{
    if (cgen_debug) std::cerr << "CgenClassTable::setup" << endl;
	setup_external_functions();
	setup_classes(root(), 0, std::vector<std::string>(), std::vector<Type*>());
}

// 设置current_tag和max_child，attr_array和type_array用于收集继承的属性
void CgenClassTable::setup_classes(CgenNode *c, int depth, std::vector<std::string> attr_array, std::vector<Type*> type_array)
{
    if (cgen_debug) std::cerr << "CgenClassTable::setup_classes" << endl;
	// MAY ADD CODE HERE
	// if you want to give classes more setup information

	c->setup(current_tag++, depth, attr_array, type_array); // layout_feature在此调用,收集attr信息

	std::vector<std::string> attr_array_collection(attr_array);
	std::vector<Type*> type_array_collection(type_array);
	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl())
		setup_classes(child->hd(), depth + 1, attr_array_collection, type_array_collection);  // 遍历继承树
	
	c->set_max_child(current_tag-1);

	/*
	if (cgen_debug)
		std::cerr << "Class " << c->get_name() << " assigned tag " 
			<< c->get_tag() << ", max child " << c->get_max_child() 
			<< ", depth " << c->get_depth() << endl;
	*/
}


// The code generation second pass. Add code here to traverse the tree and
// emit code for each CgenNode
void CgenClassTable::code_module()
{
    if (cgen_debug) std::cerr << "CgenClassTable::code_module" << endl;
	code_constants();

#ifndef MP3
	// This must be after code_module() since that emits constants
	// needed by the code() method for expressions
	CgenNode* mainNode = getMainmain(root());
	mainNode->codeGenMainmain();
#endif
	code_main();

	code_classes(root());

}


// 遍历继承树，调用class的codegen()
void CgenClassTable::code_classes(CgenNode *c)
{
    if (cgen_debug) std::cerr << "CgenClassTable::code_classes" << endl;
	c->code_class();    // class codegen()
	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl())
	    code_classes(child->hd());
}



//
// Create LLVM entry point. This function will initiate our Cool program 
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main()
{
	// Define a function main that has no parameters and returns an i32

	// Define an entry basic block

	// Call Main_main(). This returns int for phase 1, Object for phase 2
    if (cgen_debug) std::cerr << "CgenClassTable::code_main" << std::endl;

	// No parameter
	FunctionType *main_func_type = FunctionType::get(Type::getVoidTy(xanxus_context), std::vector<Type*>(), false);
	Function *main_func = Function::Create(main_func_type, Function::ExternalLinkage, "main", xanxus_module.get());
	BasicBlock *entry_block = BasicBlock::Create(xanxus_context, "entry", main_func);
	xanxus_builder.SetInsertPoint(entry_block);

	Value *hello_str = xanxus_builder.CreateGlobalStringPtr("hello world!\n");  // create string constant

	// declare puts function
	std::vector<Type*> puts_args_type;
	puts_args_type.push_back(xanxus_builder.getInt8Ty()->getPointerTo());
	FunctionType *puts_func_type = FunctionType::get(xanxus_builder.getInt32Ty(), puts_args_type, false);
	Function* puts_func = Function::Create(puts_func_type, Function::ExternalLinkage, "puts", xanxus_module.get());

	// call puts function in main()
	xanxus_builder.CreateCall(puts_func, hello_str);
	Function *Main_main_func = xanxus_module->getFunction("Main_main");
	Type* main_type = xanxus_module->getTypeByName("Main");
	AllocaInst *main_ptr = xanxus_builder.CreateAlloca(main_type);
	if (main_ptr) {    // 如果已经定义Main class，则call Main_main()
        if (Main_main_func)
            xanxus_builder.CreateCall(Main_main_func, main_ptr);
        xanxus_builder.CreateRetVoid();
    }
    if (cgen_debug) std::cerr << "CgenClassTable::code_main return" << std::endl;


#ifndef MP3
	// Get the address of the string "Main_main() returned %d\n" using
	// getelementptr 
	// vector<op_type> printf_args_types;
	// vector<operand> printf_args;

	// op_arr_type printf_type_array(INT8_PTR, main_string_print_out.length()  + 1);
	// global_value ptr_string(printf_type_array, ".str", str_const);
	// op_type i8_ptr(INT8_PTR);
	// operand pointer = vp.getelementptr(ptr_string, int_value(0), int_value(0), i8_ptr);

	// Call printf with the string address of "Main_main() returned %d\n"
	// and the return value of Main_main() as its arguments

	// Insert return 0
#else
	// Phase 2
#endif

	
}


///////////////////////////////////////////////////////////////////////
//
// CgenNode methods
//
///////////////////////////////////////////////////////////////////////

CgenNode::CgenNode(Class_ nd, Basicness bstatus, CgenClassTable *ct)
: class__class((const class__class &) *nd), 
  parentnd(0), children(0), basic_status(bstatus), class_table(ct), tag(-1)
{ 
	// ADD CODE HERE
	vtable_name = std::string(name->get_string()) + "_" + "vtable";
	ctor_name = std::string(name->get_string()) + "_ctor";
}

void CgenNode::add_child(CgenNode *n)
{
	children = new List<CgenNode>(n,children);
}

void CgenNode::set_parentnd(CgenNode *p)
{
	assert(parentnd == NULL);
	assert(p != NULL);
	parentnd = p;
}

//
// Class setup.  You may need to add parameters to this function so that
// the classtable can provide setup information (such as the class tag
// that should be used by this class).  
// 
// Things that setup should do:
//  - layout the features of the class
//  - create the types for the class and its vtable
//  - create global definitions used by the class such as the class vtable
//
void CgenNode::setup(int tag, int depth, std::vector<std::string> &attr_array, std::vector<Type*> &type_array)
{
    if (cgen_debug) std::cerr << "CgenNode::setup" << endl;
	this->tag = tag;
	attr_name_array = attr_array;  // attr继承，将父类的attr赋给子类
	attr_types = type_array;
	this->layout_features();
	attr_array = attr_name_array;  // 通过layout_feature()收集到子类的attr
	type_array = attr_types; // 返回的type_array中没有%vtable*

	attr_types.insert(attr_types.begin(), vtable_type->getPointerTo());  // StructType的第一个元素为vtable的指针
	//std::cerr << std::string(name->get_string()) << "type nums: : " << attr_types.size() << std::endl;
	create_vtable();    // 生成vtable type
	create_struct_type();   // 生成class type
	create_ctor();  // 生成默认构造函数
}

// V3
// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features()
{
    if (cgen_debug) std::cerr << "CgenNode::layout_features" << endl;
    class_type = StructType::create(xanxus_context, name->get_string());  // 先声明类型，收集完信息再填充
    vtable_type = StructType::create(xanxus_context, vtable_name);

	// 调用attr和method的layout_feature(CgenNode*)
	for (int i = features->first(); features->more(i); i = features->next(i))
		features->nth(i)->layout_feature(this);
}


//
// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
//
void CgenNode::code_class()
{
    if (cgen_debug) std::cerr << "CgenNode::code_class" << endl;
    class_handling_str = name->get_string();
	// No code generation for basic classes. The runtime will handle that.
	if (basic())
		return;
	
	CgenEnvironment *env = new CgenEnvironment(*(this->get_classtable()->ct_stream), this);


	// 生成attr和method的部分代码，　layout_feature()是获取feature信息
	for (int i = features->first(); features->more(i); i = features->next(i)) {
        env->symboltable_clear();
		env->get_attr_array(attr_name_array);
        features->nth(i)->code(env);
    }

	// 生成class的new函数　class* class_new()
}

// 根据vtable_vec创建StructType
void CgenNode::create_vtable() {
    if(cgen_debug)
        std::cerr << "CgenNode::create_vtable" << endl;
    StructType *vtable = xanxus_module->getTypeByName(vtable_name);
    if (vtable)
        vtable->setBody(vtable_vec);
    else if(cgen_debug)
        std::cerr << "vtable type doesn't exist" << endl;
}

// 根据attr_types创建StructType
void CgenNode::create_struct_type() {
    if(cgen_debug)
        std::cerr << "CgenNode::create_struct_type" << endl;
    StructType *type = xanxus_module->getTypeByName(name->get_string());
    if (type)
        type->setBody(attr_types);
    else if(cgen_debug)
        std::cerr << "struct type doesn't exist" << endl;
}

// 创建class的默认构造函数
void CgenNode::create_ctor() {
    if(cgen_debug)
        std::cerr << "CgenNode::create_ctor" << endl;
    FunctionType *ctor_type = FunctionType::get(Type::getVoidTy(xanxus_context), {class_type->getPointerTo()}, false);
    Function *ctor_func = Function::Create(ctor_type, Function::ExternalLinkage, ctor_name, xanxus_module.get());
    BasicBlock *entry_block = BasicBlock::Create(xanxus_context, "entry", ctor_func);
    xanxus_builder.SetInsertPoint(entry_block);
    Value *this_ptr = nullptr;
    for (auto &arg : ctor_func->args()) {
        arg.setName("this");
        this_ptr = &arg;
    }

    // 初始化vtable
    Constant *vtable_const = ConstantStruct::get(vtable_type, vtable_constants);
    std::vector<Value*> gep_list({util_get_int32(0), util_get_int32(0)});
    Value *vtable_ptr_2 = xanxus_builder.CreateGEP(this_ptr, gep_list);  // %vtable** = getelementptr %this, 0, 0
    Value *vtable_ptr= xanxus_builder.CreateLoad(vtable_ptr_2); // %vtable* = load %vtable**
    xanxus_builder.CreateStore(vtable_const, vtable_ptr);   // store vtable_const, %vtable*

    //TODO 初始化成员变量值


    // 返回
    xanxus_builder.CreateRetVoid();
}

#ifndef MP3

// 
// code-gen function main() in class Main
//
void CgenNode::codeGenMainmain()
{
	ValuePrinter vp;
	// In Phase 1, this can only be class Main. Get method_class for main().
	assert(std::string(this->name->get_string()) == std::string("Main"));
	method_class* mainMethod = (method_class*) features->nth(features->first());

	// ADD CODE HERE TO GENERATE THE FUNCTION int Mainmain().
	// Generally what you need to do are:
	// -- setup or create the environment, env, for translating this method
	// -- invoke mainMethod->code(env) to translate the method

	//build function Mainmain(),and call Mainmain() in main()
	CgenEnvironment *xanxus_env = new CgenEnvironment(cout, this);
	FunctionType *maincls_main_func_type = FunctionType::get(Type::getVoidTy(xanxus_context), std::vector<Type*>(), false);
    Function *maincls_main_func = Function::Create(maincls_main_func_type, Function::ExternalLinkage, "Main_main", xanxus_module.get());
    BasicBlock *entry_block = BasicBlock::Create(xanxus_context, "entry", maincls_main_func);
    xanxus_builder.SetInsertPoint(entry_block);
    mainMethod->code(xanxus_env);
    xanxus_builder.CreateRetVoid();
}

#endif

//
// CgenEnvironment functions
//

//
// Class CgenEnvironment should be constructed by a class prior to code
// generation for each method.  You may need to add parameters to this
// constructor.
//
CgenEnvironment::CgenEnvironment(std::ostream &o, CgenNode *c)
{
	cur_class = c;
	cur_stream = &o;
	var_table.enterscope();
	tmp_count = block_count = ok_count = 0;
	// ADD CODE HERE
}

// Look up a CgenNode given a symbol
CgenNode *CgenEnvironment::type_to_class(Symbol t) {
	return t == SELF_TYPE ? get_class() 
		: get_class()->get_classtable()->lookup(t);
}


void CgenEnvironment::add_local(std::string name, Value *vb) {
	var_table.addid(name, vb);
}

void CgenEnvironment::kill_local() {
	var_table.exitscope();
}

// 重置符号表
void CgenEnvironment::symboltable_clear() {
    var_table.clear();
    var_table.enterscope();
}

// 将成员变量加入符号表
void CgenEnvironment::update_attr() {
	for (int i = 0; i < attr_array.size(); i++) {
		std::vector<Value*> gep_array({util_get_int32(0), util_get_int32(i + 1)});  // 因为第一位是vtable，所以偏移量要+1
		if (cgen_debug) std::cerr << "update_attr : CreateGEP start" << endl;
		add_local(attr_array[i], xanxus_builder.CreateGEP(this_ptr, gep_array));
		if (cgen_debug) std::cerr << "update_attr : CreateGEP finish" << endl;
	}

}

////////////////////////////////////////////////////////////////////////////
//
// APS class methods
//
////////////////////////////////////////////////////////////////////////////

//******************************************************************
//
//   Fill in the following methods to produce code for the
//   appropriate expression.  You may add or remove parameters
//   as you wish, but if you do, remember to change the parameters
//   of the declarations in `cool-tree.handcode.h'.
//
//*****************************************************************

#ifdef MP3
// conform and get_class_tag are only needed for MP3

// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
Value* conform(operand src, op_type type, CgenEnvironment *env) {
	// ADD CODE HERE (MP3 ONLY)
	return nullptr;
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
Value* get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env) {
	// ADD CODE HERE (MP3 ONLY)
	return nullptr;
}
#endif

//
// Create a method body
// 
void method_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "method_class::code" << endl;

	// 获取函数类型
	// 定义函数
	// 将成员变量加入到符号表
	//处理形参，将形参加入到符号表中，注意有this*
	Function *func_ptr = xanxus_module->getFunction(util_create_method_name(name->get_string()));

	// 获取第一个arg
	for (auto &arg : func_ptr->args()) {
		env->set_this_ptr(&arg);
		break;
	}

	BasicBlock *entry_block = BasicBlock::Create(xanxus_context, "entry", func_ptr);
	xanxus_builder.SetInsertPoint(entry_block);
	// 初始化成员变量
	env->update_attr();
	// 初始化函数参数
	for (auto &arg : func_ptr->args())
		env->add_local(arg.getName().str(), &arg);
	// function body codegen()
	Value *res = expr->code(env);

    if (cgen_debug) std::cerr << "expr codegen() finish" << endl;

	// 处理函数返回值
	if (res)
	    xanxus_builder.CreateRet(res);
	else {
	    if (func_ptr->getReturnType() == Type::getInt32Ty(xanxus_context))
	        xanxus_builder.CreateRet(util_get_int32(0));
	    else if (func_ptr->getReturnType() == Type::getInt1Ty(xanxus_context))
            xanxus_builder.CreateRet(util_get_int1(0));
	    else if (func_ptr->getReturnType() == Type::getVoidTy(xanxus_context))
	        xanxus_builder.CreateRetVoid();
	}
}

//
// Codegen for expressions.  Note that each expression has a value.
//

Value* assign_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "assign" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *var = env->lookup(name->get_string());
	Value *assign_val = expr->code(env);
	xanxus_builder.CreateStore(assign_val, var, false);
	return assign_val;
}

// TODO consider how to handle the value generated by if-else statement
Value* cond_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "cond" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL

	Function *curr_func = xanxus_builder.GetInsertBlock()->getParent();
    Value *cond_val = pred->code(env);
    BasicBlock *then_block = BasicBlock::Create(xanxus_context, "then", curr_func);
    BasicBlock *else_block = BasicBlock::Create(xanxus_context, "else", curr_func);
    BasicBlock *merge_block = BasicBlock::Create(xanxus_context, "merge", curr_func);

    xanxus_builder.CreateCondBr(cond_val, then_block, else_block);

    // true chain
    xanxus_builder.SetInsertPoint(then_block);

    env->enterscope();
    Value *then_res = then_exp->code(env);
    env->exitscope();

    xanxus_builder.CreateBr(merge_block);

    // false chain
    xanxus_builder.SetInsertPoint(else_block);
    env->enterscope();
    Value *else_res = else_exp->code(env);
    env->exitscope();
    xanxus_builder.CreateBr(merge_block);

    xanxus_builder.SetInsertPoint(merge_block);
    PHINode *phi_node = xanxus_builder.CreatePHI(Type::getInt32Ty(xanxus_context), 2, "phi_val");
    phi_node->addIncoming(then_res, then_block);
    phi_node->addIncoming(else_res, else_block);

	return nullptr;
}

Value* loop_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "loop" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL

	Function *curr_func = xanxus_builder.GetInsertBlock()->getParent();

	// condition block
	BasicBlock *cond_block = BasicBlock::Create(xanxus_context, "cond", curr_func);
	BasicBlock *body_block = BasicBlock::Create(xanxus_context, "body", curr_func);
	BasicBlock *end_block = BasicBlock::Create(xanxus_context, "", curr_func);
	xanxus_builder.CreateBr(cond_block);    // br cond;

	// codition block
	xanxus_builder.SetInsertPoint(cond_block);
	Value *cond_res = pred->code(env);
	xanxus_builder.CreateCondBr(cond_res, body_block, end_block);

	// while body
	xanxus_builder.SetInsertPoint(body_block);

	env->enterscope();
	body->code(env);
	env->exitscope();

	xanxus_builder.CreateBr(cond_block);

	// end body
	xanxus_builder.SetInsertPoint(end_block);

	return nullptr;
} 

Value* block_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "block" << endl;

	Value *block_res = nullptr;
	env->enterscope();
	for (int i = body->first(); body->more(i); i = body->next(i))
	    block_res = body->nth(i)->code(env);
	env->exitscope();
	return block_res;
}

Value* let_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "let" << endl;

	env->enterscope();
	AllocaInst *param = nullptr;
	std::string type_str(type_decl->get_string());

	// alloc
	if (type_str == "Bool")
		param = xanxus_builder.CreateAlloca(Type::getInt1Ty(xanxus_context), nullptr, identifier->get_string());
	else if(type_str == "Int")
		param = xanxus_builder.CreateAlloca(Type::getInt32Ty(xanxus_context), nullptr, identifier->get_string());

	env->add_local(identifier->get_string(), param);

	// init val
	Value *param_val = init->code(env);
	if (param_val)
		xanxus_builder.CreateStore(param_val, param, false);
	else {
		// if param_val == nullptr then init param as 0
		if (type_str == "Bool")
			xanxus_builder.CreateStore(ConstantInt::get(xanxus_context, APInt(1, 0)), param, false);
		else if (type_str == "Int")
			xanxus_builder.CreateStore(ConstantInt::get(xanxus_context, APInt(32, 0)), param, false);
	}

	// return the result of body
	Value *res = body->code(env);
	env->exitscope();
	return res;
}

Value* plus_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "plus" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *res = xanxus_builder.CreateAdd(e1->code(env), e2->code(env));
	return res;
}

Value* sub_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "sub" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *res = xanxus_builder.CreateSub(e1->code(env), e2->code(env));
	return res;
}

Value* mul_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "mul" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *res = xanxus_builder.CreateMul(e1->code(env), e2->code(env));
	return res;
}

Value* divide_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "div" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *res = xanxus_builder.CreateSDiv(e1->code(env), e2->code(env));
	return res;
}

Value* neg_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "neg" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	return nullptr;
}

Value* lt_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "lt" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *res = xanxus_builder.CreateICmpSLT(e1->code(env), e2->code(env));
	return res;
}

Value* eq_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "eq" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *res = xanxus_builder.CreateICmpEQ(e1->code(env), e2->code(env));
	return res;
}

Value* leq_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "leq" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *res = xanxus_builder.CreateICmpSLE(e1->code(env), e2->code(env));
	return res;
}

Value* comp_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "complement" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	//Value *res = xanxus_builder.Create()
	return nullptr;
}

Value* int_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "Integer Constant" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *int_const = ConstantInt::get(xanxus_context, APInt(32, atoi(token->get_string())));
	return int_const;
}

Value* bool_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "Boolean Constant" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value *bool_const = ConstantInt::get(xanxus_context, APInt(1, val));
	return bool_const;
}

Value* object_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "Object" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	Value * res = env->lookup(name->get_string());
	return res;
}

Value* no_expr_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "No_expr" << endl;
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
	return nullptr;
}

//*****************************************************************
// The next few functions are for node types not supported in Phase 1
// but these functions must be defined because they are declared as
// methods via the Expression_SHARED_EXTRAS hack.
//*****************************************************************
// expr@class.method()
Value* static_dispatch_class::code(CgenEnvironment *env)
{ 
	if (cgen_debug) std::cerr << "static dispatch" << endl;
	std::string call_method_name = std::string(type_name->get_string())  + "_"  + std::string(name->get_string());
	Value *call_ptr = expr->code(env);
	std::vector<Value*> args;
	StructType *static_type = xanxus_module->getTypeByName(type_name->get_string());
	Value *bitcast_ptr = nullptr;
	Function *func = nullptr;
	if (static_type) {    // 如果该类型存在
		func = xanxus_module->getFunction(call_method_name);
		if (!func) {	// 所调用的函数不存在
			std::cerr << "Error: This function doesn't exist." << std::endl;
			return nullptr;
		}
		bitcast_ptr = xanxus_builder.CreateBitCast(call_ptr, static_type->getPointerTo());	// 转换成适合的指针
	}
	args.push_back(bitcast_ptr);  //　传入this指针
	for (int i = actual->first(); actual->more(i); i = actual->more(i))
		args.push_back(actual->nth(i)->code(env));

	Value *res = xanxus_builder.CreateCall(func, args);

	return res;
}

Value* string_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "string_const" << endl;

	return xanxus_builder.CreateGlobalStringPtr(token->get_string());
}

Value* dispatch_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "dispatch" << endl;
	// call builtin
	Function *builtin_func = util_get_builtin_func(name->get_string());
	if (builtin_func) {
		std::string builtin_name(name->get_string());
		if (builtin_name == "printlnInt")
			return xanxus_builder.CreateCall(builtin_func, {xanxus_builder.CreateGlobalStringPtr("%d\n"), actual->nth(0)->code(env)});
		else if (builtin_name == "printInt")
            return xanxus_builder.CreateCall(builtin_func, {xanxus_builder.CreateGlobalStringPtr("%d"), actual->nth(0)->code(env)});
        else if (builtin_name == "printlnStr")
            return xanxus_builder.CreateCall(builtin_func, {xanxus_builder.CreateGlobalStringPtr("%s\n"), actual->nth(0)->code(env)});
        else if (builtin_name == "printStr")
            return xanxus_builder.CreateCall(builtin_func, {xanxus_builder.CreateGlobalStringPtr("%s"), actual->nth(0)->code(env)});
	}

	// call member function
	std::string call_method_name = std::string(env->get_class()->get_name()->get_string())  + "_"  + std::string(name->get_string());
	Function *func = xanxus_module->getFunction(call_method_name);
	std::vector<Value*> args;
	args.push_back(env->get_this_ptr());  //　传入this指针
	for (int i = actual->first(); actual->more(i); i = actual->more(i))
		args.push_back(actual->nth(i)->code(env));

	Value *res = xanxus_builder.CreateCall(func, args);
	return res;
}

Value* typcase_class::code(CgenEnvironment *env)
{
	if (cgen_debug) 
		std::cerr << "typecase::code()" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
#endif
	return nullptr;
}

Value* new__class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "newClass" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
#endif
	return nullptr;
}

Value* isvoid_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "isvoid" << endl;
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
#endif
	return nullptr;
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls) 
{
    if (cgen_debug) std::cerr << "method_class::layout_feature" << endl;
	CgenEnvironment *env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
	std::vector<Type*> formals_type_vec;	// 形参类型
	std::vector<std::string> param_name_vec;  // 形参名
	// 收集形参的信息
    if (cgen_debug) std::cerr << "collect method info" << endl;

    formals_type_vec.push_back(cls->get_class_type()->getPointerTo());  // 方法的首个参数为this指针
    param_name_vec.push_back("this");

    for (int i = formals->first(); formals->more(i); i = formals->next(i)) {
		formals_type_vec.push_back(cls->convert_symbol_to_type(formals->nth(i)->get_type_decl()));
		param_name_vec.push_back(formals->nth(i)->get_name()->get_string());
	}
	Type *ret_type = cls->convert_symbol_to_type(return_type);
    if (cgen_debug && ret_type == nullptr) std::cerr << "ret_type is nullptr!" << endl;
    if (cgen_debug) std::cerr << "param_num : " << param_name_vec.size() << endl;


    if (cgen_debug) std::cerr << "get functiontype" << endl;

    FunctionType *func_type = FunctionType::get(ret_type, formals_type_vec, false);
	// func_name = class_method
	std::string func_name = cls->create_method_name(name->get_string());
	Function *func = Function::Create(func_type, Function::ExternalLinkage, func_name, xanxus_module.get());
	env->func_ptr = func;
	cls->vtable_vec_push_back(func_type->getPointerTo());  // 将该方法类型的指针记录到vtable_vec中
	cls->vtable_constant_push_back(func);

    if (cgen_debug) std::cerr << "create name for param" << endl;
    // 标注形参名
	int arg_idx = 0;
	for (auto &arg : func->args())
		arg.setName(param_name_vec[arg_idx++]);

}

// If the source tag is >= the branch tag and <= (max child of the branch class) tag,
// then the branch is a superclass of the source
Value* branch_class::code(operand expr_val, operand tag,
				op_type join_type, CgenEnvironment *env) {
#ifndef MP3
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING 
	// MORE MEANINGFUL
#endif
	return nullptr;
}

// Assign this attribute a slot in the class structure
void attr_class::layout_feature(CgenNode *cls)
{
    if (cgen_debug) std::cerr << "attr_class::layout_feature" << endl;
	CgenEnvironment *env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
	cls->setup_attr_types(type_decl, cls);  // 收集attr的Type
	cls->name_array_push_back(name->get_string()); // 记录attr的偏移量

}

void attr_class::code(CgenEnvironment *env)
{
	Value *init_val = init->code(env);
	// AllocaInst* attr_var = xanxus_builder.CreateAlloca("")
}

// 收集attr的Type到attr_types中
void CgenNode::setup_attr_types(Symbol type_decl, CgenNode *cls) {
	std::string type_str(type_decl->get_string());

	if (type_str == "Int")
		cls->attr_types.push_back(Type::getInt32Ty(xanxus_context));
	else if (type_str == "Bool")
		cls->attr_types.push_back(Type::getInt1Ty(xanxus_context));
    else if (xanxus_module->getTypeByName(type_str))
        cls->attr_types.push_back(xanxus_module->getTypeByName(type_str));
}

// sym为Symbol类型的Type
Type* CgenNode::convert_symbol_to_type(const Symbol& sym) {
	std::string type_str(sym->get_string());
    if (cgen_debug) std::cerr << "Type: " << type_str << endl;

    if (type_str == "Int")
		return Type::getInt32Ty(xanxus_context);
	else if (type_str == "Bool")
		return Type::getInt1Ty(xanxus_context);
	else if (type_str == "Object")
	    return Type::getVoidTy(xanxus_context);     // TODO
	else if (type_str == "String")
	    return Type::getInt32Ty(xanxus_context)->getPointerTo(); // TODO
	else if (type_str == "SELF_TYPE")
	    return Type::getVoidTy(xanxus_context); // TODO
	else
		return types_map[type_str];
}

// 获取builtin function的指针
Function *util_get_builtin_func(const std::string &name) {
	if (name == "printlnInt")
		return xanxus_module->getFunction("printf");
	else if (name == "printInt")
        return xanxus_module->getFunction("printf");
	else if (name == "printlnStr")
        return xanxus_module->getFunction("printf");
	else if (name == "printStr")
        return xanxus_module->getFunction("printf");
	return nullptr;
}
