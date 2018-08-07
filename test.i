%module test

/* The brackets tags `%{ ... %}` indicate that the following code is inline. This
 * means that everything in this block will be copied as-is into the generated C
 * file.
 */
%{
#include "test.h"

// We can define the wrapper function here (in the inline block).
int MyHelloWrapper(char *string) {
    SayHello(string);
    return 0;
}
%}

/* Now we redefine the names that we want to expose in our module. Here we list
 * the names one by one. If we know that we want to wrap *every* function and 
 * data structure, we can instead use the `%include "test.h"` directive.
 */
void SayHello(char *name);
int  ReturnOne();
typedef struct {
    int one;
    int two;
} MyStruct;

/* We also want to expose our wrapper function in our module! */
int MyHelloWrapper(char *string);

/* Let's add a function to our struct that does something. This is a very cool
 * feature of SWIG because it turns structs into class-like objects with their
 * own methods. This could be useful in a case where you have a field in a struct
 * that is a void pointer. SWIG doesn't understand void pointers very well, and
 * certainly doesn't allocate memory for them, so you might need to write a 
 * helper function called `set_data()` that allocates new memory and then sets
 * the memory to a given value.
 */
%extend MyStruct {
    int GetOne() {
        return $self->one;
    }
    int GetTwo() {
        return $self->two;
    }
    int AddEm() {
        return $self->one + $self->two;
    }
}