import StartApp.Simple as StartApp
import Html exposing (..)
import Html.Events exposing (..)


--Model

type alias Model = Int
initialModel = 0

--Update

type Action = Increment | Decrement

update action model =
  case action of
    Increment ->
      model + 1
    Decrement ->
      model - 1

--View

view address model =
  div [] [ button [onClick address Increment] [ text "+"]
         , div [] [text (toString model)]
         , button [onClick address Decrement] [text "-"]
         ]

main =
  StartApp.start {model = initialModel, update = update, view = view}
