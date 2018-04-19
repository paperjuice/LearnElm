import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


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


elmHubHeader : Html msg
elmHubHeader =
  header []
    [ h1 [] [ text "LearnElm" ]
    , div [ class "tagline" ] [ text "Getting started with Elm" ]
    ]

view model =
  div [ class "content" ]
    [ elmHubHeader
    , ul [ class "results" ] (List.map viewSearchResult model.result)
    ]

viewSearchResult result =
  li []
   [ span [ class "star-count" ]
     [ text (result.stars |> toString) ]
     , a [ href (url ++ result.name) ]
         [ text "special link" ]
     , button [class "hide-result", onClick {message = "delete", id = result.id}]
              [ text "X" ]
   ]


update msg model =
  if msg.message == "delete" then
    { model | result = List.filter (\result -> result.id /= msg.id) model.result }
  else
    model

main =
  Html.beginnerProgram
    { view = view
    , update = update
    , model = model
    }
