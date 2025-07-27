# ⚡ kilian_speed

A simple FiveM speed boost script for temporary player speed enhancement with countdown and visual feedback.

---

## Features

- Activates a 60-second sprint and movement speed boost
- Countdown notifications every 5 seconds
- Auto-resets after time expires
- Prevents re-triggering while active
- Uses `TriggerEvent("notifications", ...)` for alerts
- Registers the usable item `speed`
- Applies cooldown of 5 minutes (300 seconds)
- Triggers the client event to apply the speed boost
- Logs each use to a Discord channel via webhook
- Sends the player a cooldown notification if reused too early

---

## Author

**Kilian**
