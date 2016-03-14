import StartApp exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Mouse exposing (..)
import Effects exposing (..)

--Model

type alias Model = { clicks: List (Int,Int)}
initialModel =
  { clicks = []
  }

init =
  (initialModel, Effects.none)


--Update
type Action position = Click position

update action model =
  case action of
    Click position ->
      ({model | clicks = position :: model.clicks}, Effects.none)

clicksHtml clicks =
  List.map (\c -> div [] [text (toString c)]) clicks
--View
view: Signal.Address action -> Model -> Html
view address model =
  div [] (clicksHtml model.clicks)


mouseClicks =
  Signal.map (\c -> Click c) (Signal.sampleOn Mouse.clicks Mouse.position)

app =
  StartApp.start {init = init, update = update, view = view, inputs = [mouseClicks]}

main =
  app.html
