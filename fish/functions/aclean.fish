# Clean Android project
function aclean --description "Clean Android project"
    if test -f "./gradlew"
        ./gradlew clean
    else
        echo "No Gradle wrapper found."
        return 1
    end
end
