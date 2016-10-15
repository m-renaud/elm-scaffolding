module ComplexSubcomponent.View exposing (view)

import Html exposing (..)

import ComplexSubcomponent.Types exposing (..)


view : Model -> Html Msg
view model =
    div [] [ text "Complex Subcomponent" ]
