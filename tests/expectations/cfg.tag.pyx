DEF PLATFORM_UNIX = 0
DEF PLATFORM_WIN = 0
DEF X11 = 0
DEF M_32 = 0


from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, intptr_t
from libc.stdint cimport uint8_t, uint16_t, uint32_t, uint64_t, uintptr_t
cdef extern from *:
  ctypedef bint bool
  ctypedef struct va_list

cdef extern from *:

  IF (PLATFORM_WIN or M_32):
    cdef enum:
      A,
      B,
      C,
    ctypedef uint32_t BarType;

  IF (PLATFORM_UNIX and X11):
    cdef enum:
      A,
      B,
      C,
    ctypedef uint32_t FooType;

  IF (PLATFORM_UNIX and X11):
    cdef struct FooHandle:
      FooType ty;
      int32_t x;
      float y;

  IF (PLATFORM_WIN or M_32):
    cdef struct BarHandle:
      BarType ty;
      int32_t x;
      float y;

  IF (PLATFORM_UNIX and X11):
    void root(FooHandle a, C c);

  IF (PLATFORM_WIN or M_32):
    void root(BarHandle a, C c);
