import Graphics.Element exposing (..)

--Values are immutable
test = 23
--test = 12
adder val =
  val + 12

--So are records

myRec =
  { prop1 = "Test",
    prop2 = "Immutable"
  }

recordChanger rec =
  { rec | prop1 = "Changed"}


main =
  show [adder test, test]
  --show [recordChanger myRec, myRec]
