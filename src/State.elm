module State exposing (initialState, update, subscriptions)

import Types exposing (..)


initialState : (Model, Cmd Msg)
initialState =
    let
        model = {}
        cmds = Cmd.none
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
