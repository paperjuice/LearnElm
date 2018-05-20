import Html exposing (..)
import Navigation exposing (Location)


main =
  Navigation.program MyUrl
  { init = init
  , view = view
  , subscriptions = (\_ -> Sub.none)
  , update = update
  }

type Msg
  = MyUrl Location

type Route
  = Home
  | Hello
  | NotFound

type alias Model =
  { text_ : String
  }

init : Location -> (Model, Cmd msg)
init location =
  update (MyUrl location) (Model location.pathname)

view : Model -> Html msg
view model =
  case model.text_ of
    "/" ->  div [] [ text ("Hello page 1 " ++ model.text_) ]
    "/cars" -> div [] [ text "this page is for cars" ]
    "/no" -> div [] [ text "No :()" ]
    _     -> div [] [ text "Not found 00000100 00000000 00000100" ]

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    MyUrl location ->
     let
         _ = Debug.log "hello" location
     in
      ({ model | text_ = location.pathname }, Cmd.none)


