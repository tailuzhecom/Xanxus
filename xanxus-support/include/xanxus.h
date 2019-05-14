#ifndef _XANXUS_H_
#define _XANXUS_H_

#include "xanxus-io.h"

/* a type renaming */
typedef int Boolean;
class Entry;
typedef Entry *Symbol;

Boolean copy_Boolean(Boolean);
void assert_Boolean(Boolean);
void dump_Boolean(ostream &,int,Boolean);

Symbol copy_Symbol(Symbol);
void assert_Symbol(Symbol);
void dump_Symbol(ostream &,int,Symbol);

#endif
