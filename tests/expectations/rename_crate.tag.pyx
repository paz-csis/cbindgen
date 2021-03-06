DEF DEFINE_FREEBSD = 0


from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, intptr_t
from libc.stdint cimport uint8_t, uint16_t, uint32_t, uint64_t, uintptr_t
cdef extern from *:
  ctypedef bint bool
  ctypedef struct va_list

cdef extern from *:

  cdef struct Foo:
    int32_t x;

  cdef struct RenamedTy:
    uint64_t y;

  IF not DEFINE_FREEBSD:
    cdef struct NoExternTy:
      uint8_t field;

  IF not DEFINE_FREEBSD:
    cdef struct ContainsNoExternTy:
      NoExternTy field;

  IF DEFINE_FREEBSD:
    cdef struct ContainsNoExternTy:
      uint64_t field;

  void root(Foo a);

  void renamed_func(RenamedTy a);

  void no_extern_func(ContainsNoExternTy a);
