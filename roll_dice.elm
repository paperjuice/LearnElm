import Html exposing (..)
import Html.Events exposing (onClick)
import Random

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model =
  { dieFace : Int
  }

init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none)


type Msg
  = Roll
  | NewFace Int

view : Model -> Html Msg
view model =
  div []
    [ div [] [text "Roll the dice, baby!"]
    , button [onClick Roll] [ text "Roll!"]
    , div [] [text (toString model.dieFace )]
    ]


-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace (Random.int 1 6))

    NewFace newFace ->
      (Model newFace, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

