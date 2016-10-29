module ComplexModule.State exposing (init, subscriptions, update)

import ComplexModule.Types exposing (..)


init : (Model, Cmd Msg)
init =
    let
        model =
            {
            }
        cmds =
            Cmd.none

    in
        (model, cmds)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
