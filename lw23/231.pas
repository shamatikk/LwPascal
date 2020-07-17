PROGRAM InsertSort2 (INPUT, OUTPUT);
TYPE
  NodePtr = ^Node;
  Node = RECORD
    Next: NodePtr;
    Key: CHAR
  END;
VAR
  FirstPtr, NewPtr, Curr, Prev: NodePtr;
  Found: BOOLEAN;
  
PROCEDURE AddAndSort(VAR FirstPtr, Prev, NewPtr: NodePtr);
VAR 
  found: BOOLEAN;
BEGIN
  Curr := FirstPtr;
  Found := FALSE;
  WHILE (Curr <> NIL) AND NOT Found
  DO
    IF NewPtr^.Key > Curr^.Key
    THEN
      BEGIN
         Prev := Curr;
         Curr := Curr^.Next
      END
    ELSE
      Found := TRUE;
    NewPtr^.Next := Curr;
    IF Prev = NIL
    THEN
      FirstPtr := NewPtr
    ELSE
    Prev^.Next := NewPtr
END;

PROCEDURE OutputSpis(NewPtr: NodePtr);
BEGIN
  WHILE NewPtr <> NIL
  DO
    BEGIN
      WRITE(NewPtr^.Key);
      NewPtr := NewPtr^.Next
    END
END;

BEGIN {InsertSort2}
  FirstPtr := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      NEW(NewPtr);
      READ(NewPtr^.Key);
      Prev := NIL;
      Curr := FirstPtr;
      AddAndSort(FirstPtr,Prev,NewPtr);
    END;
  OutputSpis(FirstPtr);
END.  {InsertSort2}

