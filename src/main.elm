module Main exposing (..)

import Html exposing (Html, button, div, text, fieldset, label, input)
import Html.App as App
import Html.Attributes exposing (type')
import Html.Events exposing (onClick)


main : Program Never
main =
    App.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { notifications : Bool
    , autoplay : Bool
    , location : Bool
    }


model : Model
model =
    Model True True True



-- UPDATE


type Msg
    = ToggleNotifications
    | ToggleAutoplay
    | ToggleLocation


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleNotifications ->
            { model | notifications = not model.notifications }

        ToggleAutoplay ->
            { model | autoplay = not model.autoplay }

        ToggleLocation ->
            { model | location = not model.location }



-- VIEW


view : Model -> Html Msg
view model =
    fieldset []
        [ checkbox ToggleNotifications "Email Notifications"
        , checkbox ToggleAutoplay "Video Autoplay"
        , checkbox ToggleLocation "Use Location"
        ]


checkbox : msg -> String -> Html msg
checkbox msg name =
    label []
        [ input [ type' "checkbox", onClick msg ] []
        , text name
        ]
