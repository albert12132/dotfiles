-- Layouts
import XMonad hiding ( (|||) )
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.Accordion
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

-- Gnome config (for Unity menubar)
import XMonad.Config.Gnome

-- Misc
import XMonad.Util.EZConfig
import XMonad.Prompt.Shell
import XMonad.Prompt

-- Actions
import XMonad.Actions.WithAll
import XMonad.Actions.Warp

-- Unity menubar
myManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-shell" --> doFloat
    ])

-- Layout
myLayout = avoidStruts (tiled
                        ||| Grid
                        ||| Accordion
                        ||| noBorders Full)
    where
        tiled = ResizableTall nmaster delta ratio []
        nmaster = 1
        ratio = 1/2
        delta = 3/100

-- Fonts
myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
    { bgColor = "#000000"
    , fgColor = "#00ff00"
    , bgHLight = "#00ff00"
    , fgHLight = "#000000"
    , height  = 20
    , borderColor = "#000000"
    , font    = "-*-*-*-*-*-*-20-*-*-*-*-*-*-*"
    }

-- Main
main = xmonad $ gnomeConfig {
    manageHook = myManageHook
    , normalBorderColor = "#000000"
    , focusedBorderColor = "#00FF00"
    , handleEventHook = fullscreenEventHook
    , layoutHook = myLayout
    }
    `additionalKeysP`
    [ ("M-o", spawn "google-chrome")             -- chrome
    , ("M-i", spawn "google-chrome --incognito") -- incognito chrome
    , ("M-b", sendMessage ToggleStruts)          -- toggle menubar
    , ("M-n", spawn "nautilus")                  -- nautilus
    , ("M-m", spawn "rhythmbox")                 -- music player
    , ("M-f", sendMessage $ JumpToLayout "Full") -- jump to fullscreen
    , ("M-s", shellPrompt myXPConfig)
    , ("M-S-h", sendMessage MirrorExpand)        -- expand non-master
    , ("M-S-l", sendMessage MirrorShrink)        -- shrink non-master
    , ("M-S-a", killAll)                         -- close all windows
    , ("M-'", banishScreen LowerRight)           -- banish mouse
    ]
