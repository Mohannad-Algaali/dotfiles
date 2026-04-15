# Mirror Android device screen using scrcpy
function ascrcpy --description "Mirror Android device screen"
    if command -v scrcpy >/dev/null
        scrcpy $argv
    else
        echo "scrcpy not installed. Install with: sudo dnf install scrcpy"
        return 1
    end
end
