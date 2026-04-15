# Build Android project
function abuild --description "Build Android project (debug APK)"
    if test -f "./gradlew"
        ./gradlew assembleDebug
    else if test -f "../gradlew"
        ../gradlew assembleDebug
    else
        echo "No Gradle wrapper found. Run from project root."
        return 1
    end
end
