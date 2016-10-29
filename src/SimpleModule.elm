{- A simple module that is small enough to be defined in one file. -}
module SimpleModule exposing (Model, Msg(..), init, subscriptions, update, view)

import Html exposing (..)


-- MODEL


type alias Model =
    {
    }


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


-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)


-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text "Simple module" ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
