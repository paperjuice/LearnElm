import Html exposing (text, div, button)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram
  { model = my_model
  , view = my_view
  , update = my_update
  }

type Msg = UP | DOWN

my_model : Int
my_model = 0

my_view : Int -> Html.Html Msg
my_view model =
  div []
    [ button [onClick UP] [text "UP"]
    , div [] [text (toString model)]
    , button [onClick DOWN] [text "DOWN"]
    ]

my_update msg model=
  case msg of
    UP ->
      model + 1
    DOWN ->
      model - 1
