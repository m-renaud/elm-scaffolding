module Types exposing (Model, Msg(..))

-- Import modules for composition.
import SimpleModule
import ComplexModule.Types


-- MODEL


type alias Model =
    { simpleModuleModel : SimpleModule.Model
    , complexModuleModel : ComplexModule.Types.Model
    }



-- MESSAGES


type Msg
    = NoOp
    | SimpleMsg SimpleModule.Msg
    | ComplexMsg ComplexModule.Types.Msg
