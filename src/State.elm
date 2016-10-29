module State exposing (init, subscriptions, update)

import SimpleModule
import ComplexModule.State
import Types exposing (..)


init : (Model, Cmd Msg)
init =
    let
        (simpleModule, simpleCmd) = SimpleModule.init
        (complexModule, complexCmd) = ComplexModule.State.init
        model =
            { simpleModuleModel = simpleModule
            , complexModuleModel = complexModule
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
                    SimpleModule.update simpleMsg model.simpleModuleModel
                updatedModel =
                    { model | simpleModuleModel = updatedSimpleModel }

            in
                (updatedModel, Cmd.map SimpleMsg simpleCmd)

        ComplexMsg complexMsg ->
            let
                (updatedComplexModel, complexCmd) =
                    ComplexModule.State.update complexMsg model.complexModuleModel
                updatedModel =
                    { model | complexModuleModel = updatedComplexModel }

            in
                (updatedModel, Cmd.map ComplexMsg complexCmd)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ SimpleModule.subscriptions model.simpleModuleModel
              |> Sub.map SimpleMsg
        , ComplexModule.State.subscriptions model.complexModuleModel
              |> Sub.map ComplexMsg
        ]
