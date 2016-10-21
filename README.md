# Elm Scaffolding

A basic separation-by-feature directory structure for Elm projects
inspired by the
[Elm Architecture Tutorial](https://github.com/evencz/elm-architecture-tutorial)
and Kris Jenkins'
[How I Structure Elm Apps](http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html)
which I encourage everyone to read.


## How to use

Clone the repository and remove the existing `.git` directory, you'll
want to start with a clean slate for your project.

```bash
git clone https://github.com/m-renaud/elm-scaffolding.git \
&& rm -rf elm-scaffolding/.git \
&& cd elm-scaffolding && git init
```

Once you do this you'll also want to go through and update the
`elm-package.json` to point to your repository.

## Building

`./build`

This builds your application and places it and all necessary resources
into the `dist/` subdirectory.


## Directory Layout

All of the source code for the app lives in the `src/` directory and
the css, external JavaScript, and media live in the `assets/`
directory. Lets dig a bit deeper into the source directory.

Each component is broken up into 4 main files `Types.elm`,
`State.elm`, `View.elm`, and `Rest.elm`.

> _Types: The Model and Msg types._

> _State: The init, subscriptions, and update function._

> _View: The view function._

> _Rest: The REST APIs and JSON decoders. Not every component will
> have this._

This pattern will repeat at the top level of your app as well for each
of your subcomponents. For small components you may chose to combine
these into a single file, that's up to you.


### `scr/App.elm`

This is the entrypoint into your Elm application. This module doesn't
contain anything except the `main` function that will be invoked from
your `src/index.html`. All this file does is glue together your
initial state, update function, subscriptions, and top level view.

```elm
import State
import View


main : Program Never
main =
    Html.App.program
        { init = State.init
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.view
        }
```


### `src/Types.elm`

Contains the top level `Model` and `Msg` types for your app. Your `Model`
will typically consist of the models of the submodules of your
application as we'll see later on. The message type will be a union
type containing the messages of your subcomponents and any application
level messages that you have.


### `src/View.elm`

Contains the top level `view` function for your app which sets up the
high level layout, leaving specifics to the `view` function of
subcomponents. 

### `src/State.elm`

The `init`, `upate`, and `subscriiptions` functions at the top level
of your app end up being mostly boilerplate to invoke the
corresponding functions on each of the subcomponents and wrap them
with the appropriate message type. This will also be the case if you
have other components with subcomponents, this file should give you a
good idea of how to handle the composition.



