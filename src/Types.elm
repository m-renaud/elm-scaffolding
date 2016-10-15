module Types exposing (Model, Msg(..))

-- Import subcomponent types for composition.
import SimpleSubcomponent
import ComplexSubcomponent.Types


-- MODEL


type alias Model =
    { simpleSubcomponentModel : SimpleSubcomponent.Model
    , complexSubcomponentModel : ComplexSubcomponent.Types.Model
    }



-- MESSAGES


type Msg
    = NoOp
    | SimpleMsg SimpleSubcomponent.Msg
    | ComplexMsg ComplexSubcomponent.Types.Msg
