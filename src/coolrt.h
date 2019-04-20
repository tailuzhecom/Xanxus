/* 
 * This file provides the runtime library for cool. It implements
 * the cool classes in C.  Feel free to change it to match the structure
 * of your code generator.
*/

#include <stdbool.h>

typedef struct Object Object;
typedef struct String String;
typedef struct IO IO;
typedef struct Int Int;
typedef struct Bool Bool;

typedef struct Object_vtable Object_vtable;
typedef struct String_vtable String_vtable;
typedef struct IO_vtable IO_vtable;
typedef struct Int_vtable Int_vtable;
typedef struct Bool_vtable Bool_vtable;

/* class type definitions */
struct Object {
	/* ADD CODE HERE */
	Object_vtable *type;
};

struct Int {
	/* ADD CODE HERE */
	Int_vtable *type;
	int val;
};

struct Bool {
	/* ADD CODE HERE */
	Bool_vtable *type;
};

struct String {
	/* ADD CODE HERE */
	String_vtable *type;
};

struct IO {
	/* ADD CODE HERE */
	IO_vtable *type;
};


/* vtable type definitions */
struct Object_vtable {
	/* ADD CODE HERE */
	int id;
	int addr;
	char *name;
	Object* (*Object_new)(void);
	Object* (*Object_abort)(Object*);
	const String* (*Object_type_name)(Object*);
	Object* (*Object_copy)(Object*);
};

struct IO_vtable {
	/* ADD CODE HERE */
	int id;
	int addr;
	char *name;
	IO* (*IO_new)(void);
	Object* (*Object_abort)(IO*);
	String* (*Object_type_name)(IO*);
	IO* (*Object_copy)(IO*);
	IO* (*IO_out_string)(IO*, String*);
	IO* (*IO_out_int)(IO*, Int*);
	String* (*IO_in_string)(IO*);
	Int* (*IO_in_int)(IO*);
};

struct Int_vtable {
	/* ADD CODE HERE */
	int id;
	int addr;
	char *name;
	Int* (*Int_new)(void);
	Object* (*Object_abort)(Int*);
	String* (*Object_type_name)(Int*);
	Int* (*Object_copy)(Int*);
};

struct Bool_vtable {
	/* ADD CODE HERE */
	int id;
	int addr;
	char *name;
	Bool* (*Bool_new)(void);
	Object* (*Object_abort)(Bool*);
	String* (*Object_type_name)(Bool*);
	Bool* (*Object_copy)(Bool*);
};
   
struct String_vtable {
	/* ADD CODE HERE */
	int id;
	int addr;
	char *name;
	Bool* (*String_new)(void);
	Object* (*Object_abort)(String*);
	String* (*Object_type_name)(String*);
	Bool* (*Object_copy)(String*);
	Int* (*String_length)(String*);
	String* (*String_concat)(String*, String*);
	String* (*String_substr)(String*);
};

/* methods in class Object */
Object* Object_abort(Object *self);
const String* Object_type_name(Object *self);
	/* ADD CODE HERE */

/* methods in class IO */
IO* IO_new(void);
void IO_init(IO *self);
IO* IO_out_string(IO *self, String *x);
IO* IO_out_int(IO *self, int x);
String* IO_in_string(IO *self);
int IO_in_int(IO *self);

/* methods in class Int */
	/* ADD CODE HERE */


/* methods in class Bool */
	/* ADD CODE HERE */


/* methods in class String */
	/* ADD CODE HERE */
