module View exposing (view)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)

import Types exposing (..)
import SimpleSubcomponent
import ComplexSubcomponent.View


view : Model -> Html Msg
view model =
    let
        header = div [ id "header" ] [ h1 [] [ text "Elm Scaffolding" ] ]
        scaffoldingText = text "Best practices project structure for Elm projects."
        content = div [ class "content container" ]
                  [ scaffoldingText
                  , SimpleSubcomponent.view model.simpleSubcomponentModel
                      |> Html.App.map SimpleMsg
                  , ComplexSubcomponent.View.view model.complexSubcomponentModel
                      |> Html.App.map ComplexMsg
                  ]
        footer = div [class "footer"]
                 [ text <| "Copyright Someone||Something" ]

    in
        div [] [ header
               , content
               , footer
               ]
