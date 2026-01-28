# OpusPlayer for LÖVE

OpusPlayer is a Lua module for LÖVE that allows streaming and decoding of Ogg Opus audio files. It provides a queueable audio source interface compatible with LÖVE’s audio system.  

## Features

- Stream or fully load Ogg Opus files.
- Queue decoded PCM into a `love.audio.Source`.
- Play, pause, stop, and query playback status.
- Track decoding statistics.

## Requirements

- LÖVE 11.5 or later.
- `opus.dll` and `ogg.dll` placed in the same directory as the executable.

## Usage

```lua
local OpusPlayer = require("OpusPlayer")

-- Create a streaming source
local source = OpusPlayer.newSource("example.opus", "stream")

source:play()

function love.update(dt)
    source:update(8) -- number of packets to decode per frame
end

source:pause()
source:stop()

-- Get stats
local stats = source:getStats()
print(stats.packets_decoded, stats.is_playing)
```

## API

- OpusPlayer.newSource(filename, source_type) – Creates a new source. source_type can be "stream" or "static".
- source:play() – Starts playback.
- source:pause() – Pauses playback.
- source:stop() – Stops playback.
- source:isPlaying() – Returns true if currently playing.
- source:update(packets_per_frame) – Decodes and queues audio packets. Default packets_per_frame is 8.
- source:getStats() – Returns statistics: packets decoded, free buffers, playback status, and source type.
- source:destroy() – Cleans up resources.

## Special Thanks

- Cakejamble & Radge from the LÖVE Discord for advice.
- Proddy for code review.
