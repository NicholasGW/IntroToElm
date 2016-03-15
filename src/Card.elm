module Card (Model, init, Action, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model = { id: Int, value: String, flipped: Bool}

init: Int -> String -> Model
init id value =
  { id = id, value = value, flipped = True}

--Update
type Action = Flip


update: Action -> Model -> Model
update action model =
  case action of
      Flip ->
        { model | flipped = not model.flipped}

view: Signal.Address Action -> Model -> Html
view address model =
  div [ onClick address Flip
      , backgroundColor model.flipped
      ] [ div [ showCard model.flipped] [text model.value]]

showCard: Bool -> Attribute
showCard flipped =
  if flipped
    then style [("display", "none")]
    else style [("display", "block")]

backgroundColor: Bool -> Attribute
backgroundColor flipped =
  let
    baseStyle = [ ("float", "left")
                , ("width","90px")
                , ("height","90px")
                , ("margin", "5px")
                , ("lineHeight", "90px")
                , ("textAlign", "center")
                ]
  in
    if flipped
      then style ([("backgroundColor", "red")] ++ baseStyle)
      else style ([("backgroundColor", "white")] ++ baseStyle)
