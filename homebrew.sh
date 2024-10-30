
# Source Homebrew based on x86 mode
if [ "$(sysctl -n sysctl.proc_translated)" = "1" ]; then
    local brew_path="/opt/homebrew/bin"
else
    local brew_path="/usr/local/homebrew/bin"
fi
export PATH="${brew_path}:${PATH}"
export PATH="/usr/local/homebrew/bin:${PATH}"
