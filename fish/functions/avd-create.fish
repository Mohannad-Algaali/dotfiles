# Create a new Android Virtual Device
function avd-create --description "Create a new AVD"
    set -l name $argv[1]
    set -l device $argv[2]
    set -l api $argv[3]

    if test -z "$name"
        read -P "AVD name: " name
    end

    if test -z "$device"
        echo "Available devices:"
        avdmanager list device -c 2>/dev/null | head -20
        read -P "Device ID (e.g., pixel_7): " device
    end

    if test -z "$api"
        echo "Available system images:"
        sdkmanager --list 2>/dev/null | grep "system-images" | grep "google_apis" | head -10
        set api "android-36"
        read -P "API level [android-36]: " input_api
        if test -n "$input_api"
            set api $input_api
        end
    end

    set -l package "system-images;$api;google_apis;x86_64"

    echo "Creating AVD '$name' with device '$device' and $api..."
    echo "no" | avdmanager create avd -n $name -k $package -d $device
end
