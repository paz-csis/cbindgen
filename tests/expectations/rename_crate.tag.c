#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

struct Foo {
  int32_t x;
};

struct RenamedTy {
  uint64_t y;
};

#if !defined(DEFINE_FREEBSD)
struct NoExternTy {
  uint8_t field;
};
#endif

#if !defined(DEFINE_FREEBSD)
struct ContainsNoExternTy {
  struct NoExternTy field;
};
#endif

#if defined(DEFINE_FREEBSD)
struct ContainsNoExternTy {
  uint64_t field;
};
#endif

void root(struct Foo a);

void renamed_func(struct RenamedTy a);

void no_extern_func(struct ContainsNoExternTy a);
