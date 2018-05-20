import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Result =
  { id : Int
  , name : String
  , stars : Int
  }

type alias Model =
  { query : String
  , result : List Result
  }

type Msg
  = QueryString String
  | DeleteById Int


model : Model
model =
  { query = "tutorial"
  , result =
    [
      { id = 1
      , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
      , stars = 66
      }
    , { id = 2
      , name = "name2"
      , stars = 41
      }
    , { id = 3
      , name = "name3"
      , stars = 43
      }
    , { id = 4
      , name = "name4"
      , stars = 213
      }
    , { id = 5
      , name = "name5"
      , stars = 81
      }
    , { id = 6
      , name = "name6"
      , stars = 91
      }
    ]
  }

url : String
url =
  "http://github.com/"


elmHubHeader : Html Msg
elmHubHeader =
  header []
    [ h1 [] [ text "LearnElm" ]
    , div [ class "tagline" ] [ text "Getting started with Elm" ]
    ]

searchQuery : Html Msg
searchQuery =
  input
    [ class "search-query"
    , onInput QueryString
    , defaultValue (Debug.log "query is" model.query)
    ]
    []

view : Model -> Html Msg
view model =
  div [ class "content" ]
    [ elmHubHeader
    , searchQuery
    , button [class "search-button"] [ text "Submit"]
    , ul [ class "results" ] (List.map viewSearchResult model.result)
    ]

viewSearchResult : Result -> Html Msg
viewSearchResult result =
  li []
   [ span [ class "star-count" ]
     [ text (result.stars |> toString) ]
     , a [ href (url ++ result.name) ]
         [ text "special link" ]
     , button [class "hide-result", onClick(DeleteById result.id) ]
              [ text "X" ]
   ]

update : Msg -> Model -> Model
update msg model =
  case msg of
    QueryString message ->
      { model | query = message}

    DeleteById id ->
      { model | result = List.filter(\record -> record.id /= id) model.result}


main : Program Never Model Msg
main =
  Html.beginnerProgram
    { view = view
    , update = update
    , model = model
    }
