-- Print every movie cTiVo can see, newest first, that hasn't been queued.

tell application "cTiVo"
    set candidates to every show whose movie is true and queued is false and protected is false
    repeat with s in candidates
        log (series title of s) & "  " & (channel of s) & "  " & ((file size of s) div 1000000) & " MB"
    end repeat
end tell
