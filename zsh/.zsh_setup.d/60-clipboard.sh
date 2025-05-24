# Stolen from oh-my-zsh
# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/clipboard.zsh
# 
# - pbcopy, pbpaste (macOS)
# - cygwin (Windows running Cygwin)
# - wl-copy, wl-paste (if $WAYLAND_DISPLAY is set)
# - xsel (if $DISPLAY is set)
# - xclip (if $DISPLAY is set)
# - win32yank (Windows)
#
# Defines two functions, clipcopy and clippaste, based on the detected platform.
#  <command> | clipcopy    - copies stdin to clipboard
#  clipcopy <file>         - copies a file's contents to clipboard
#  clippaste   - writes clipboard's contents to stdout
#  clippaste | <command>    - pastes contents and pipes it to another process
#  clippaste > <file>      - paste contents to a file

function detect-clipboard() {
  emulate -L zsh

  if [[ "${OSTYPE}" == darwin* ]] && (( ${+commands[pbcopy]} )) && (( ${+commands[pbpaste]} )); then
    function clipcopy() { cat "${1:-/dev/stdin}" | pbcopy; }
    function clippaste() { pbpaste; }
  elif [[ "${OSTYPE}" == (cygwin|msys)* ]]; then
    function clipcopy() { cat "${1:-/dev/stdin}" > /dev/clipboard; }
    function clippaste() { cat /dev/clipboard; }
  elif (( $+commands[clip.exe] )) && (( $+commands[powershell.exe] )); then
    function clipcopy() { cat "${1:-/dev/stdin}" | clip.exe; }
    function clippaste() { powershell.exe -noprofile -command Get-Clipboard; }
  elif [ -n "${WAYLAND_DISPLAY:-}" ] && (( ${+commands[wl-copy]} )) && (( ${+commands[wl-paste]} )); then
    function clipcopy() { cat "${1:-/dev/stdin}" | wl-copy &>/dev/null &|; }
    function clippaste() { wl-paste --no-newline; }
  elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xsel]} )); then
    function clipcopy() { cat "${1:-/dev/stdin}" | xsel --clipboard --input; }
    function clippaste() { xsel --clipboard --output; }
  elif [ -n "${DISPLAY:-}" ] && (( ${+commands[xclip]} )); then
    function clipcopy() { cat "${1:-/dev/stdin}" | xclip -selection clipboard -in &>/dev/null &|; }
    function clippaste() { xclip -out -selection clipboard; }
  elif (( ${+commands[win32yank]} )); then
    function clipcopy() { cat "${1:-/dev/stdin}" | win32yank -i; }
    function clippaste() { win32yank -o; }
  else
    function _retry_clipboard_detection_or_fail() {
      local clipcmd="${1}"; shift
      if detect-clipboard; then
        "${clipcmd}" "$@"
      else
        print "${clipcmd}: Platform $OSTYPE not supported or xclip/xsel not installed" >&2
        return 1
      fi
    }
    function clipcopy() { _retry_clipboard_detection_or_fail clipcopy "$@"; }
    function clippaste() { _retry_clipboard_detection_or_fail clippaste "$@"; }
    return 1
  fi
}

# Placeholders that deferr the clipboard detection until first invocation
function clipcopy clippaste {
  unfunction clipcopy clippaste
  detect-clipboard || true # let one retry
  "$0" "$@"
}

