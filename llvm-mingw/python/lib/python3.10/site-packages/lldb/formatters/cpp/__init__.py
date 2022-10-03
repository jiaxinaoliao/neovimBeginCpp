__all__ = ["gnu_libstdcpp", "libcxx"]
for x in __all__:
  __import__('lldb.formatters.cpp.' + x)

def __lldb_init_module(debugger, internal_dict):
  import lldb
  for x in __all__:
    submodule = getattr(lldb.formatters.cpp, x)
    lldb_init = getattr(submodule, '__lldb_init_module', None)
    if lldb_init:
      lldb_init(debugger, internal_dict)
