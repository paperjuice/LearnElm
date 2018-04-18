import Html exposing (..)
import Html.Attributes exposing (..)


main =
  Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }

-- MODEL

type alias Model =
  { state : Int
  }

model : Model
model =
  { state = 0 }

-- UPDATE

type Msg =
  Msg

update : Msg -> Model -> Model
update msg model=
  model

-- VIEW

myStyle : Attribute msg
myStyle =
  style
    [ ("backgroundColor", "red")
    , ("width", "90px")
    , ("height", "90px")
    ]

view : Model -> Html msg
view model =
  div []
  [ div [myStyle] []
  , div [myStyle] []
  ]
