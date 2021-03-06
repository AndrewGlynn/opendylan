Module:    win32-util-test
Synopsis:  Tests utility functions in the Win32-common library.
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND


define suite win32-util-suite ()
  test win32-util-test;
  test win32-types-test;
end suite;

define method run-suite ()
  run-test-application(win32-util-suite);
end method run-suite;

run-suite();


