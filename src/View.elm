module View exposing (view)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)

import Types exposing (..)
import SimpleModule
import ComplexModule.View


view : Model -> Html Msg
view model =
    let
        header = div [ id "header" ] [ h1 [] [ text "Elm Scaffolding" ] ]
        scaffoldingText = text "Best practices project structure for Elm projects."
        content = div [ class "content container" ]
                  [ scaffoldingText
                  , SimpleModule.view model.simpleModuleModel
                      |> Html.App.map SimpleMsg
                  , ComplexModule.View.view model.complexModuleModel
                      |> Html.App.map ComplexMsg
                  ]
        footer = div [class "footer"]
                 [ text <| "Copyright Someone||Something" ]

    in
        div [] [ header
               , content
               , footer
               ]
