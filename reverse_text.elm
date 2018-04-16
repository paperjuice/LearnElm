import Html exposing (div, text, input, Html)
import Html.Events exposing (onInput)
import Html.Attributes exposing (placeholder)

main =
  Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }

-- MODEL
type alias Model =
  { content : String
  }

model : Model
model =
  { content = ""
  }


-- UPDATE

type Msg =
  Content String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Content newMessage ->
      { model | content = newMessage }

-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ input [placeholder "Asa da", onInput Content] []
  , div [] [text(String.reverse(model.content))]
  ]
