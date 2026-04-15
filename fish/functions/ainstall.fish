# Install APK on connected device
function ainstall --description "Install APK on connected device"
    set -l apk $argv[1]

    if test -z "$apk"
        # Find debug APK
        set apk (find . -name "*.apk" -path "*/debug/*" 2>/dev/null | head -1)
        if test -z "$apk"
            set apk (find . -name "*.apk" 2>/dev/null | head -1)
        end
    end

    if test -n "$apk"
        echo "Installing $apk..."
        adb install -r $apk
    else
        echo "No APK found. Build first with: abuild"
        return 1
    end
end
