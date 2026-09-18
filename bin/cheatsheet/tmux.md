# Tmux Cheatsheet

## Prefix
| Key | Action |
|-----|--------|
| `Ctrl+b` | default prefix key |

## Sessions
| Key | Action |
|-----|--------|
| `prefix + $` | rename session |
| `prefix + d` | detach session |
| `prefix + s` | list sessions |
| `tmux new -s name` | new named session |
| `tmux attach -t name` | attach session |
| `tmux kill-session -t name` | kill session |

## Windows
| Key | Action |
|-----|--------|
| `prefix + c` | new window |
| `prefix + ,` | rename window |
| `prefix + &` | kill window |
| `prefix + n / p` | next / prev window |
| `prefix + 0-9` | switch to window N |
| `prefix + w` | list windows |

## Panes
| Key | Action |
|-----|--------|
| `prefix + %` | split vertical |
| `prefix + "` | split horizontal |
| `prefix + arrow` | move between panes |
| `prefix + x` | kill pane |
| `prefix + z` | zoom pane toggle |
| `prefix + { / }` | swap pane left / right |
| `prefix + Ctrl+arrow` | resize pane |
| `prefix + q` | show pane numbers |

## Copy Mode
| Key | Action |
|-----|--------|
| `prefix + [` | enter copy mode |
| `q` | exit copy mode |
| `Space` | start selection |
| `Enter` | copy selection |
| `prefix + ]` | paste buffer |
| `/ or ?` | search forward / backward |

## Misc
| Key | Action |
|-----|--------|
| `prefix + t` | show clock |
| `prefix + ?` | list all keybindings |
| `prefix + :` | tmux command prompt |
| `prefix + r` | reload config |
