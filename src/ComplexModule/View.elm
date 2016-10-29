module ComplexModule.View exposing (view)

import Html exposing (..)

import ComplexModule.Types exposing (..)


view : Model -> Html Msg
view model =
    div [] [ text "Complex Module" ]
