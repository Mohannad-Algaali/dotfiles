# View Android logcat with optional filtering
function alogcat --description "View Android logcat"
    set -l filter $argv[1]

    if test -n "$filter"
        adb logcat | grep -i $filter
    else
        adb logcat
    end
end
