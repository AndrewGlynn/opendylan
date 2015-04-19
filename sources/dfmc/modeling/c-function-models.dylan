Module:   dfmc-modeling
Synopsis: C Function and code model objects.
Author:   Jonathan Bachrach
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

define sealed generic c-function-name
    (fun :: type-union(<&c-function>, <&c-callable-function>))
 => (name :: false-or(<string>));

define class <&c-function> (<&primitive>)
  constant slot c-function-name :: false-or(<string>),
    required-init-keyword: c-function-name:;
  constant slot c-modifiers :: <string> = "",
    init-keyword: c-modifiers:;
  slot c-signature :: <&signature>,
    init-keyword: c-signature:;
end class;

define method initialize
    (x :: <&c-function>, #rest all-keys, #key, #all-keys)
  next-method();
  // Unlike with the built-in primitives, we err on the side of caution...
  primitive-side-effecting?(x) := #t;
  primitive-stateless?(x)      := #f;
  primitive-dynamic-extent?(x) := #f;
end method;

define &class <c-callable-function> (<lambda>)
  // !@#$ should be somewhat virtual
  constant slot c-function-name :: false-or(<string>),
    required-init-keyword: c-function-name:;
  constant slot c-modifiers :: <string> = "",
    init-keyword: c-modifiers:;
  slot c-signature :: <&signature>;
  constant slot alternate-name,
    required-init-keyword: alternate-name:;
  constant slot dll-export? = #f,
    init-keyword: export:;
end &class;

define class <&c-variable> (<named-object>, <emitted-object>)
  constant slot dll-import? = #f, init-keyword: import:;
end class <&c-variable>;

define class <&objc-msgsend> (<&c-function>)
end class;
