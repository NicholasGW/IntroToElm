import Graphics.Element exposing (..)


addNums first second =
  first + second

nums =
  addNums 1 2

strings =
  addNums "test" "adding"

main =
  show [nums, strings]
