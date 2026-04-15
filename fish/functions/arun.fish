# Build and install Android app on connected device
function arun --description "Build and install Android app"
    if test -f "./gradlew"
        ./gradlew installDebug
        if test $status -eq 0
            # Get package name from build.gradle.kts
            set -l package (grep -oP 'applicationId\s*=\s*"\K[^"]+' app/build.gradle.kts 2>/dev/null)
            if test -n "$package"
                echo "Launching $package..."
                adb shell am start -n "$package/.MainActivity"
            end
        end
    else
        echo "No Gradle wrapper found. Run from project root."
        return 1
    end
end
