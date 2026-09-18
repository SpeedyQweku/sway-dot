# Neovim Cheatsheet

## Navigation
| Key | Action |
|-----|--------|
| `h j k l` | left / down / up / right |
| `w / b` | next / prev word |
| `0 / $` | line start / end |
| `gg / G` | file top / bottom |
| `Ctrl+d / Ctrl+u` | half page down / up |
| `% ` | jump to matching bracket |
| `{ / }` | prev / next paragraph |
| `zz` | center cursor on screen |

## Editing
| Key | Action |
|-----|--------|
| `i / I` | insert / insert at line start |
| `a / A` | append / append at line end |
| `o / O` | new line below / above |
| `dd` | delete line |
| `yy` | yank line |
| `p / P` | paste after / before |
| `u / Ctrl+r` | undo / redo |
| `ciw` | change inner word |
| `daw` | delete around word |
| `.` | repeat last action |

## Visual
| Key | Action |
|-----|--------|
| `v` | visual mode |
| `V` | visual line mode |
| `Ctrl+v` | visual block mode |
| `gv` | reselect last selection |
| `< / >` | indent left / right |

## Search & Replace
| Key | Action |
|-----|--------|
| `/pattern` | search forward |
| `?pattern` | search backward |
| `n / N` | next / prev match |
| `:%s/old/new/g` | replace all |
| `*` | search word under cursor |
| `#` | search word backward |

## Windows & Tabs
| Key | Action |
|-----|--------|
| `:sp / :vsp` | split horizontal / vertical |
| `Ctrl+w h/j/k/l` | move between splits |
| `Ctrl+w =` | equalize splits |
| `:tabnew` | new tab |
| `gt / gT` | next / prev tab |
| `:q / :wq / :wqa` | quit / save+quit / quit all |

## LSP
| Key | Action |
|-----|--------|
| `gd` | go to definition |
| `gr` | go to references |
| `K` | hover documentation |
| `gi` | go to implementation |
| `[d / ]d` | prev / next diagnostic |
| `<leader>ca` | code action |
| `<leader>rn` | rename symbol |
