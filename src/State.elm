module State exposing (init, subscriptions, update)

import SimpleSubcomponent
import ComplexSubcomponent.State
import Types exposing (..)


init : (Model, Cmd Msg)
init =
    let
        (simpleSubcomponent, simpleCmd) = SimpleSubcomponent.init
        (complexSubcomponent, complexCmd) = ComplexSubcomponent.State.init
        model =
            { simpleSubcomponentModel = simpleSubcomponent
            , complexSubcomponentModel = complexSubcomponent
            }

    in
        ( model
        , Cmd.batch
              [ Cmd.map SimpleMsg simpleCmd
              , Cmd.map ComplexMsg complexCmd
              ]
        )


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)

        SimpleMsg simpleMsg ->
            let
                (updatedSimpleModel, simpleCmd) =
                    SimpleSubcomponent.update simpleMsg model.simpleSubcomponentModel
                updatedModel =
                    { model | simpleSubcomponentModel = updatedSimpleModel }

            in
                (updatedModel, Cmd.map SimpleMsg simpleCmd)

        ComplexMsg complexMsg ->
            let
                (updatedComplexModel, complexCmd) =
                    ComplexSubcomponent.State.update complexMsg model.complexSubcomponentModel
                updatedModel =
                    { model | complexSubcomponentModel = updatedComplexModel }

            in
                (updatedModel, Cmd.map ComplexMsg complexCmd)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ SimpleSubcomponent.subscriptions model.simpleSubcomponentModel
              |> Sub.map SimpleMsg
        , ComplexSubcomponent.State.subscriptions model.complexSubcomponentModel
              |> Sub.map ComplexMsg
        ]
