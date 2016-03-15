import StartApp.Simple as StartApp
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Time exposing (..)
import Card exposing (..)

--Model
type alias Model = List Card.Model
type alias ID = Int

values: List String
values = [ "Elm Rocks", "Watch me", "Flip!", "Maritime", "Dev", "Con", "Thanks", "For", "Listening!"]

initialModel: Model
initialModel = List.indexedMap Card.init values

type Action = Modify ID Card.Action

update: Action -> Model -> Model
update action model =
  case action of

    Modify id cardAction ->

      let updateCard cardModel =
        if id == cardModel.id
          then Card.update cardAction cardModel
          else cardModel
      in
        List.map updateCard model

--View


view: Signal.Address Action -> Model -> Html
view address model =
  div [class "clearfix", style [("width", "300px"), ("height", "300px")]] (List.map (viewCard address) model)

viewCard: Signal.Address Action -> Card.Model -> Html
viewCard address cardModel =
  Card.view (Signal.forwardTo address (Modify cardModel.id)) cardModel


main =
  StartApp.start {model = initialModel, update = update, view = view}
