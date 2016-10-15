module View exposing (rootView)

import Html exposing (..)
import Html.Attributes exposing (..)

import Types exposing (..)


-- VIEW


rootView : Model -> Html Msg
rootView model =
    let
        header = div [ id "header" ] [ h1 [] [ text "Elm Scaffolding" ] ]
        scaffoldingText = text "Best practices project structure for Elm projects."
        content = div [ class "content container" ] [scaffoldingText]
        footer = div [class "footer"]
                 [ text <| "Copyright Someone||Something" ]
    in
        div [] [ header
               , content
               , footer
               ]
