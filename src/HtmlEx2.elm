import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)

type alias Profile = {
  name: String,
  color: String
}

createProfile: (String, String) -> Profile
createProfile (name, color) =
  { name = name, color = color}

profileData =
  [ ("Nick", "red")
  , ("Adam", "green")
  , ("Alice", "yellow")
  , ("Jess", "orange")
  ]

profiles: List Profile
profiles =
  List.map createProfile profileData

colorStyle color =
  style [("backgroundColor", color)]

awesomeStyle profile =
  style [ ("paddingLeft", "10px")
        , ("marginRight", "10px")
        , ("width", "60px")
        , ("backgroundColor", profile.color)
        ]

profileHtml: Profile -> Html
profileHtml profile =
  div [ colorStyle profile.color] [text profile.name]

awesomeHtml: Profile -> Html
awesomeHtml profile =
  div [] [ span [awesomeStyle profile] []
         , span [style [("fontSize", "20px")]] [ text profile.name]
         ]
main =
  div [] (List.map profileHtml profiles)
