import Graphics.Element exposing (..)
import Signal exposing (..)
import Mouse exposing(..)

main =
  Signal.map show Mouse.position
