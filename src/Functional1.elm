import Graphics.Element exposing (..)

wrapper wrap argument =
  wrap ++ " " ++ argument ++ " " ++ wrap

stars =
  wrapper "***"

dashes =
  wrapper "---"

both =
  stars >> dashes

main =
  show [stars "stars", dashes "dashes", both "both"]
