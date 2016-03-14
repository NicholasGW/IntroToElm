import Html exposing (..)
import Html.Attributes exposing (..)

myStyle =
  style [  ("backgroundColor", "red")
        , ("width", "100px")
        ]

main =
  div [ myStyle] [text "Test", div [] [text "New Div"]]
