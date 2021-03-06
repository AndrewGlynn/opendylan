Module:       database-viewer
Author:       Andy Armstrong, Keith Playford
Synopsis:     A simple database viewer
Copyright:    Original Code is Copyright (c) 1995-2004 Functional Objects, Inc.
              All rights reserved.
License:      See License.txt in this distribution for details.
Warranty:     Distributed WITHOUT WARRANTY OF ANY KIND

/// Main

define method main () => ()
  spawn-database-viewer($default-database-viewer-database);
  wait-for-shutdown();
end method main;

begin
  main();
end;
