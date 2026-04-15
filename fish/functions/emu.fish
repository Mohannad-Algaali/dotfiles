# Launch Android emulator
function emu --description "Launch Android emulator"
    set -l avd_name $argv[1]

    if test -z "$avd_name"
        # List available AVDs and let user choose
        set -l avds (avdmanager list avd -c 2>/dev/null)
        if test -z "$avds"
            echo "No AVDs found. Create one with: avd-create <name>"
            return 1
        end
        echo "Available AVDs:"
        set -l i 1
        for avd in $avds
            echo "  $i) $avd"
            set i (math $i + 1)
        end
        read -P "Select AVD number: " choice
        set avd_name $avds[$choice]
    end

    if test -n "$avd_name"
        echo "Starting emulator: $avd_name"
        emulator -avd $avd_name &
        disown
    end
end
