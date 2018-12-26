import XMonad

main = do
  xmonad def
    { terminal = "st"
    , modMask = mod4Mask
    }

