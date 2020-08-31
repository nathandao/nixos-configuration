import XMonad
import XMonad.Config.Xfce

import XMonad.Hooks.ManageDocks

import qualified Data.Map as M
import XMonad.Util.Run
import XMonad.Util.EZConfig

floatingClasses =
  [ "MPlayer"
  , "Gimp"
--, "Wrapper"
  , "xfce4-xkb-plugin"
  , "xfce4-appfinder"
  , "Xfrun4"
  ]

main = do
  xmproc <- spawnPipe "xfce4-panel -d"
  xmonad $ xfceConfig
    { modMask = mod4Mask
    , terminal = "xfce4-terminal"
    , manageHook = manageDocks <+> (composeAll . map (\n -> className =? n --> doFloat)) floatingClasses
    } `additionalKeys`
    [ ((0, 0x1008ff81), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next") --media next
    , ((0, 0x1008ff30), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause") --media pause
    , ((0, 0x1008ff59), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous") --media prev
    ]
