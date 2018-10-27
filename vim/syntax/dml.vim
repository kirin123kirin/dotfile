" Vim syntax file
" Language: dml base on C++
" Current Maintainer: vim-jp (https://github.com/vim-jp/vim-cpp)
if version < 600
syntax clear
elseif exists("b:current_syntax")
finish
endif
" Read the C syntax to start with
if version < 600
so <sfile>:p:h/c.vim
else
runtime! syntax/c.vim
unlet b:current_syntax
endif
" C++ extensions
syn keyword cppStatement new delete this friend using
syn keyword dmlStatement let del allocate const
syn keyword cppAccess public protected private
syn keyword cppType inline virtual explicit export bool wchar_t
syn keyword dmlType string decimal void integer vector int ebcdic bigendian litleendian unicode NULL
syn keyword cppExceptions throw try catch
syn keyword dmlExceptions force_error
syn keyword cppOperator operator typeid
"syn keyword dmlOperator for while if
syn keyword cppOperator and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword dmlCast ::
syn keyword cppStorageClass mutable
syn keyword cppStructure class typename template namespace
syn keyword dmlStructure record end metadata begin
syn keyword cppBoolean true false
syn keyword cppConstant __cplusplus
" C++ 11 extensions
if !exists("cpp_no_cpp11")
syn keyword cppType override final
syn keyword cppExceptions noexcept
syn keyword cppStorageClass constexpr decltype thread_local
syn keyword cppConstant nullptr
syn keyword cppConstant ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
syn keyword cppConstant ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
syn keyword cppConstant ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE
syn keyword cppConstant ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
syn keyword cppConstant ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE
syn keyword cppConstant ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
syn region cppRawString matchgroup=cppRawDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell
endif
" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"
" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
if version < 508
let did_cpp_syntax_inits = 1
command -nargs=+ HiLink hi link <args>
else
command -nargs=+ HiLink hi def link <args>
endif
HiLink cppAccess cppStatement
HiLink cppCast cppStatement
HiLink dmlCast Statement
HiLink cppExceptions Exception
HiLink dmlExceptions Exception
HiLink cppOperator Operator
HiLink cppStatement Statement
HiLink dmlStatement Statement
HiLink cppType Type
HiLink dmlType Identifier
HiLink cppStorageClass StorageClass
HiLink cppStructure Structure
HiLink dmlStructure Statement
HiLink cppBoolean Boolean
HiLink cppConstant Constant
HiLink cppRawDelimiter Delimiter
HiLink cppRawString String
delcommand HiLink
endif
let b:current_syntax = "dml"
" vim: ts=8
