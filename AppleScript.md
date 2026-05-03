# Scripting cTiVo

cTiVo exposes its TiVos, recordings, download queue, and conversion formats to AppleScript, JavaScript for Automation (JXA), and Shortcuts.app. Open cTiVo's dictionary in Script Editor (File → Open Dictionary…) to browse the full terminology.

## Object model

- **`application "cTiVo"`** — the running app. Holds elements `tivo`, `show`, `download`, `format`. Has `download queue`, `selected format`, and `processing paused` properties.
- **`tivo`** — a discovered TiVo device. Has elements `show`. Properties: `name`, `serial number`, `enabled`, `reachable`, `mini`, `supports RPC`, `supports transport stream`, `last download ended`.
- **`show`** — a recording on a TiVo. ~25 properties covering identity (`id`, `unique id`), titles (`series title`, `episode title`, `description`), episode numbering (`season`, `episode`, `season episode`), type/state flags (`movie`, `episodic`, `suggestion`, `queued`, `protected`, `in progress`, `HD`, `on disk`), recording metadata (`show date`, `length`, `file size`), channel info (`channel`, `channel number`, `station`), and ratings (`age rating`, `star rating`).
- **`download`** — a queued or in-progress download. References its underlying `show` and `format`. Has `status`, `progress`, `speed`, `time left`, and the convenience flags `downloading`, `done`, `canceled`.
- **`format`** — a conversion format. Properties: `name`, `description`, `extension`, `encoder`, `available`, `hidden`, `factory`, `deprecated`, `commercial skip`, `add to iTunes`.
- **`download queue`** — the application's one queue. Holds `download` elements.

## Common patterns

### Listing

```applescript
tell application "cTiVo"
    every show of tivo "Living Room" whose movie is true and queued is false
end tell
```

`whose` filters work against any property, including booleans and strings.

### Queuing

```applescript
tell application "cTiVo"
    add (every show whose series title is "The Bear" and queued is false)
end tell
```

The `add` command takes a single `show` or a list of them and returns the new `download` objects. It uses the currently selected format and the user's default download options.

### Removing from the queue

Use AppleScript's standard `delete` verb on a `download` reference:

```applescript
tell application "cTiVo"
    delete (every download whose canceled is true)
end tell
```

### Pausing and resuming

```applescript
tell application "cTiVo" to pause processing
tell application "cTiVo" to resume processing

-- or, equivalently:
tell application "cTiVo" to set processing paused to true
```

## Notes

- Show data loads asynchronously after cTiVo connects to a TiVo, so `count of shows` may be 0 for a few seconds after launch. Scripts that poll on launch should wait until `count of shows > 0`.
- A `download` references its `show` directly (`show of download 1`); a `show` doesn't carry a back-reference to its download. Use `every download whose show is X` if you need to find an existing queue item.
- Sample scripts live in `scripts/` at the top of the repo.
