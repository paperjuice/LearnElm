import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

main =
  Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }


-- MODEL
type alias Model =
  { username : String
  , password : String
  , rPassword : String
  , age : String
  }

model : Model
model =
  { username = ""
  , password = ""
  , rPassword = ""
  , age = ""
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

    Submit ->
      model

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



validatePasswordLength : Model -> Html msg
validatePasswordLength model =
  let
    (code, message) =
      if String.length(model.password) > 8 then
        ("Red", "Password too long")
      else
        ("Green", "Password is fine")
  in
    div [ style [ ("color", code) ] ] [ text message ]

validatePasswordMatch : Model -> Html msg
validatePasswordMatch model =
  let
    (color, message) =
      if model.password == model.rPassword then
        ("Green", "All good")
      else
        ("Red", "Passwords must match!")
  in
    div [ style [ ("color", color)] ] [ text message]

validateAge : Model -> Html msg
validateAge model =
  let
    (color, message) =
      case (model.age |> String.toInt) of
        Ok message ->
          ("Green", "Age is fine")

        Err message ->
          ("Red", "Age needs to be a number")
  in
    div [ style [("color", color)] ] [ text message]
