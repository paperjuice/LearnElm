import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

main =
  Html.beginnerProgram
  { model = model
  , view = view
  , update = update
  }


type StatusOptions
  = Correct
  | Incorrect
  | Undefined

type alias Status =
  { isMatch : StatusOptions
  , isGoodLength: StatusOptions
  , isAgeNumber : StatusOptions
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
    { isMatch = Undefined
    , isGoodLength = Undefined
    , isAgeNumber = Undefined
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
      let
          oldStatus = model.status
          newStatus =
            { oldStatus | isMatch = isMatch model
                        , isGoodLength = isGoodLength model
                        , isAgeNumber = isAgeNumber model
                        }
      in
          { model | status = newStatus }



isMatch : Model -> StatusOptions
isMatch model =
  case model.password == model.rPassword of
    True  -> Correct
    False -> Incorrect

isGoodLength : Model -> StatusOptions
isGoodLength model =
  case (model.password |> String.length) < 8 of
    True  -> Correct
    False -> Incorrect

isAgeNumber : Model -> StatusOptions
isAgeNumber model =
  case (model.age |> String.toInt) of
    Ok  msg -> Correct
    Err msg -> Incorrect


-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ input [type_ "text", placeholder "Username", onInput Username] []
  , input [type_ "password", placeholder "Password", onInput Password] []
  , input [type_ "password", placeholder "Password again", onInput RepeatPassword] []
  , input [type_ "text", placeholder "Insert age", onInput Age] []
  , button [ onClick Submit ] [ text "Submit" ]
  , showPasswordMatchValidation model
  , showPasswordLengthValidation model
  , showAgeValidation model
  ]

showPasswordMatchValidation : Model -> Html msg
showPasswordMatchValidation model =
  case model.status.isMatch of
   Correct   -> div [ style [ ("color", "Green") ] ] [ text "Passwords match." ]
   Incorrect -> div [ style [ ("color", "Red") ] ] [ text "Passwords need to match!" ]
   Undefined -> div [] []

showPasswordLengthValidation : Model -> Html msg
showPasswordLengthValidation model =
  case model.status.isGoodLength of
   Correct   -> div [ style [ ("color", "Green") ] ] [ text "Password is short and sweet." ]
   Incorrect -> div [ style [ ("color", "Red") ] ] [ text "Passwords is too long." ]
   Undefined -> div [] []

showAgeValidation : Model -> Html msg
showAgeValidation model =
  case model.status.isAgeNumber of
   Correct   -> div [ style [ ("color", "Green") ] ] [ text "Age is fine." ]
   Incorrect -> div [ style [ ("color", "Red") ] ] [ text "Age needs to be a number." ]
   Undefined -> div [] []

