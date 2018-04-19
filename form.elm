import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

main =
  Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }

type alias Status =
  { isMatch : Bool
  , isTooLong : Bool
  , isAgeNumber : Bool
  }

-- MODEL
type alias Model =
  { username : String
  , password : String
  , rPassword : String
  , age : String
  , status : Status
  }

model : Model
model =
  { username = ""
  , password = ""
  , rPassword = ""
  , age = ""
  , status =
    { isMatch = True
    , isTooLong = True
    , isAgeNumber = True
    }
  }

type Msg
  = Username String
  | Password String
  | RepeatPassword String
  | Age String
  | Submit

-- UPDATE

update : Msg -> Model -> Model
update msg model =
  case msg of
    Username username ->
      { model | username = username }

    Password password ->
      { model | password = password}

    RepeatPassword rPassword ->
      { model | rPassword = rPassword }

    Age age ->
      { model | age = age }

    Submit  ->
      { model | status.isMatch = isMatchFunc model
              , status.isTooLong = isTooLongFunc model
              , status.isAgeNumber = isAgeNumberFunc model
              }

isMatchFunc : Model -> Bool
isMatchFunc model =
  case model.password == model.rPassword of
    True -> True
    False -> False

isTooLongFunc : Model -> Bool
isTooLongFunc model =
  case (model.password |> String.length) > 8 of
    True -> True
    False -> False

isAgeNumberFunc : Model -> Bool
isAgeNumberFunc model =
  case model.age |> String.toInt of
    Ok _msg  -> True
    Err _msg -> False


-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ input [type_ "text", placeholder "Username", onInput Username] []
  , input [type_ "password", placeholder "Password", onInput Password] []
  , input [type_ "password", placeholder "Password again", onInput RepeatPassword] []
  , input [type_ "text", placeholder "Insert age", onInput Age] []
  , button [ onClick Submit ] [ text "Submit" ]
  ]

