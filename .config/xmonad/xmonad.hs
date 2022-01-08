{-# OPTIONS_GHC -Wno-missing-signatures #-}

import XMonad.Main (xmonad)
import XMonad.Config.Prime (def, mod4Mask, sendMessage, spawn)
import XMonad.Core
  ( borderWidth,
    focusedBorderColor,
    layoutHook,
    manageHook,
    modMask,
    normalBorderColor,
    workspaces,
  )
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Hooks.ManageHelpers (isDialog)
import XMonad.Hooks.StatusBar (statusBarProp, withSB)
import XMonad.Hooks.StatusBar.PP
  ( pad,
    ppCurrent,
    ppOrder,
    ppSep,
    ppTitle,
    shorten,
    trim,
    wrap,
  )
import XMonad.Layout
  ( Full (Full),
    JumpToLayout (JumpToLayout),
    Mirror (Mirror),
    Tall (Tall),
    (|||),
  )
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.Renamed (Rename (Replace), renamed)
import XMonad.ManageHook
  ( className,
    composeAll,
    doFloat,
    (-->),
    (=?),
  )
import XMonad.Util.EZConfig (additionalKeysP)

main =
  xmonad
    . withSB (statusBarProp "xmobar" $ pure myPP)
    . ewmh
    . docks
    $ myConfig

myPP =
  def
    { ppCurrent = wrap "<" ">" . trim,
      ppSep = " . ",
      ppOrder = \(w : _ : t) -> w : t,
      ppTitle = shorten 128
    }

myConfig =
  def
    { modMask = mod4Mask,
      workspaces = map (pad . show) [1 .. 9 :: Int],
      normalBorderColor = "#073642",
      focusedBorderColor = "#2aa198",
      borderWidth = 2,
      layoutHook = myLayoutHook,
      manageHook = myManageHook
    }
    `additionalKeysP` myKeys

myLayoutHook = avoidStruts (tall ||| Mirror tall) ||| full
  where
    tall = Tall 1 (1 / 100) (1 / 2)
    full = renamed [Replace "full"] $ noBorders Full -- renamed for JumpToLayout

myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat,
      isDialog --> doFloat
    ]

myKeys =
  [ ("M-y", spawn "setxkbmap -layout se"),
    ("M-u", spawn "setxkbmap -layout us"),
    ("M-s", spawn "import png:- | xclip -selection clipboard -t image/png"),
    ("M-S-s", spawn "import $HOME/Pictures/screenshot.png"),
    ("M-f", sendMessage $ JumpToLayout "full")
  ]
