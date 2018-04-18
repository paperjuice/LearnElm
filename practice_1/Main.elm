import Html exposing (..)
import Html.Attributes exposing (..)


model =
  { result =
    { id = 1
    , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
    , stars = 66
    }
  }

url : String
url =
  "http://github.com/"



main =
  let
      elmHubHeader =
        header []
          [ h1 [] [ text "LearnElm" ]
          , div [ class "tagline" ] [ text "Getting started with Elm" ]
          ]
  in
      div [ class "content" ]
          [ elmHubHeader
          , ul [ class "results" ]
            [ li []
              [ span [ class "star-count" ]
                [ text (model.result.stars |> toString)
                , a [ href (url ++ model.result.name) ] [ text "special link" ]
                ]
              ]
            ]
          ]
