-- Add every unqueued, non-protected episode of a given series to the
-- download queue. Adjust `targetSeries` for your show.

property targetSeries : "The Bear"

tell application "cTiVo"
    set picks to every show ¬
        whose series title is targetSeries ¬
        and queued is false ¬
        and protected is false ¬
        and on disk is false
    if (count of picks) is 0 then
        return "Nothing to do for " & targetSeries
    end if
    add picks
    return "Queued " & (count of picks) & " episodes of " & targetSeries
end tell
