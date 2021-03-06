from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, intptr_t
from libc.stdint cimport uint8_t, uint16_t, uint32_t, uint64_t, uintptr_t
cdef extern from *:
  ctypedef bint bool
  ctypedef struct va_list

cdef extern from *:

  cdef struct NotReprC_Box_i32:
    pass

  ctypedef NotReprC_Box_i32 Foo;

  cdef struct MyStruct:
    int32_t *number;

  void root(const Foo *a, const MyStruct *with_box);

  void drop_box(int32_t *x);

  void drop_box_opt(int32_t *x);
