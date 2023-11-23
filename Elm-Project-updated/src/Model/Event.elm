module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


cmp : Event -> Event -> Order
cmp ev1 ev2 =
    Interval.compare ev1.interval ev2.interval


sortByInterval : List Event -> List Event
sortByInterval events =
    List.sortWith cmp events
    --Debug.todo "Implement Event.sortByInterval"


view : Event -> Html Never
view event =
    div [if event.important == False then class "event" else class "event event-important"] [
        div[class "event-title"][text event.title],
        div[class "event-interval"][],
        div[class "event-description"][event.description],
        div[class "event-category"][categoryView event.category],
        div[class "event-url"][text (Maybe.withDefault "Nothing" event.url)]

    ]
   -- Debug.todo "Implement the Model.Event.view function"
