-- Remove any canceled downloads from the queue.

tell application "cTiVo"
    set stale to every download whose canceled is true
    if (count of stale) is 0 then
        return "Queue is clean"
    end if
    delete stale
    return "Removed " & (count of stale) & " canceled downloads"
end tell
