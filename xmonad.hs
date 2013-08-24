import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks
import XMonad.Prompt.Shell
import XMonad.Prompt
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops

myLayout = avoidStruts (tiled ||| Mirror tiled ||| noBorders Full)
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

myManageHook = composeAll (
    [ manageHook gnomeConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-shell" --> doFloat
    ])

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

main = xmonad $ gnomeConfig {
    manageHook = myManageHook
    , normalBorderColor = "#000000"
    , focusedBorderColor = "#00FF00"
    , handleEventHook = fullscreenEventHook

    , layoutHook = myLayout
    }
    `additionalKeysP`
    [ ("M-o", spawn "google-chrome")
    , ("M-i", spawn "google-chrome --incognito")
    , ("M-b", sendMessage ToggleStruts)
    , ("M-m", spawn "rhythmbox")
    , ("M-<Tab>", toggleWS)
    -- , ("M-s", shellPrompt myXPConfig)
    ]
