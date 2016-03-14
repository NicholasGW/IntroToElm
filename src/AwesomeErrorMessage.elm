import Graphics.element exposing (..)


type alias Model = { name: String, age: Int}

createPerson: String -> Int -> Model
createPerson name age =
  { name : name, age : age}


makePersonOlder: Int -> Model -> Model
makePersonOlder yearsToAge person =
  { person | age = person.age + yearToAge}

getAge: Model -> Int
getAge person =
  person.aeg

main =
  createPerson "Nick" 25
    |> makePersonolder 10
    |> getAge
    |> show
