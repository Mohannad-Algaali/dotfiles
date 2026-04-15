# Create a new Android Kotlin project
function android-new --description "Create a new Android Kotlin project"
    set -l project_name $argv[1]
    set -l package_name $argv[2]

    if test -z "$project_name"
        read -P "Project name: " project_name
    end

    if test -z "$package_name"
        set -l default_package "com.example."(string lower $project_name)
        read -P "Package name [$default_package]: " package_name
        if test -z "$package_name"
            set package_name $default_package
        end
    end

    set -l package_path (string replace -a "." "/" $package_name)

    echo "Creating Android project: $project_name"
    mkdir -p $project_name
    cd $project_name

    # Create directory structure
    mkdir -p app/src/main/java/$package_path
    mkdir -p app/src/main/res/layout
    mkdir -p app/src/main/res/values
    mkdir -p app/src/main/res/drawable
    mkdir -p app/src/main/res/mipmap-hdpi
    mkdir -p app/src/main/res/mipmap-mdpi
    mkdir -p app/src/main/res/mipmap-xhdpi
    mkdir -p app/src/main/res/mipmap-xxhdpi
    mkdir -p app/src/main/res/mipmap-xxxhdpi
    mkdir -p app/src/test/java/$package_path
    mkdir -p app/src/androidTest/java/$package_path
    mkdir -p gradle/wrapper

    # settings.gradle.kts
    echo "pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = \"$project_name\"
include(\":app\")" > settings.gradle.kts

    # Root build.gradle.kts
    echo "plugins {
    id(\"com.android.application\") version \"8.7.3\" apply false
    id(\"org.jetbrains.kotlin.android\") version \"2.0.21\" apply false
}" > build.gradle.kts

    # gradle.properties
    echo "org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
kotlin.code.style=official
android.nonTransitiveRClass=true" > gradle.properties

    # App build.gradle.kts
    echo "plugins {
    id(\"com.android.application\")
    id(\"org.jetbrains.kotlin.android\")
}

android {
    namespace = \"$package_name\"
    compileSdk = 35

    defaultConfig {
        applicationId = \"$package_name\"
        minSdk = 24
        targetSdk = 35
        versionCode = 1
        versionName = \"1.0\"

        testInstrumentationRunner = \"androidx.test.runner.AndroidJUnitRunner\"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile(\"proguard-android-optimize.txt\"),
                \"proguard-rules.pro\"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = \"17\"
    }
    buildFeatures {
        viewBinding = true
    }
}

dependencies {
    implementation(\"androidx.core:core-ktx:1.15.0\")
    implementation(\"androidx.appcompat:appcompat:1.7.0\")
    implementation(\"com.google.android.material:material:1.12.0\")
    implementation(\"androidx.constraintlayout:constraintlayout:2.2.0\")
    implementation(\"androidx.activity:activity-ktx:1.9.3\")
    testImplementation(\"junit:junit:4.13.2\")
    androidTestImplementation(\"androidx.test.ext:junit:1.2.1\")
    androidTestImplementation(\"androidx.test.espresso:espresso-core:3.6.1\")
}" > app/build.gradle.kts

    # proguard-rules.pro
    echo "# Add project specific ProGuard rules here." > app/proguard-rules.pro

    # AndroidManifest.xml
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">

    <application
        android:allowBackup=\"true\"
        android:icon=\"@mipmap/ic_launcher\"
        android:label=\"@string/app_name\"
        android:roundIcon=\"@mipmap/ic_launcher_round\"
        android:supportsRtl=\"true\"
        android:theme=\"@style/Theme.Material3.Light.NoActionBar\">
        <activity
            android:name=\".MainActivity\"
            android:exported=\"true\">
            <intent-filter>
                <action android:name=\"android.intent.action.MAIN\" />
                <category android:name=\"android.intent.category.LAUNCHER\" />
            </intent-filter>
        </activity>
    </application>

</manifest>" > app/src/main/AndroidManifest.xml

    # MainActivity.kt
    echo "package $package_name

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import $package_name.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}" > app/src/main/java/$package_path/MainActivity.kt

    # activity_main.xml
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android=\"http://schemas.android.com/apk/res/android\"
    xmlns:app=\"http://schemas.android.com/apk/res-auto\"
    xmlns:tools=\"http://schemas.android.com/tools\"
    android:layout_width=\"match_parent\"
    android:layout_height=\"match_parent\"
    tools:context=\".MainActivity\">

    <TextView
        android:id=\"@+id/textView\"
        android:layout_width=\"wrap_content\"
        android:layout_height=\"wrap_content\"
        android:text=\"Hello World!\"
        android:textSize=\"24sp\"
        app:layout_constraintBottom_toBottomOf=\"parent\"
        app:layout_constraintEnd_toEndOf=\"parent\"
        app:layout_constraintStart_toStartOf=\"parent\"
        app:layout_constraintTop_toTopOf=\"parent\" />

</androidx.constraintlayout.widget.ConstraintLayout>" > app/src/main/res/layout/activity_main.xml

    # strings.xml
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<resources>
    <string name=\"app_name\">$project_name</string>
</resources>" > app/src/main/res/values/strings.xml

    # colors.xml
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<resources>
    <color name=\"black\">#FF000000</color>
    <color name=\"white\">#FFFFFFFF</color>
</resources>" > app/src/main/res/values/colors.xml

    # Download gradle wrapper
    echo "Downloading Gradle wrapper..."
    gradle wrapper --gradle-version 8.11.1 2>/dev/null

    echo ""
    echo "Project '$project_name' created successfully!"
    echo ""
    echo "Commands:"
    echo "  ./gradlew assembleDebug   - Build debug APK"
    echo "  ./gradlew installDebug    - Install on connected device"
    echo "  ./gradlew build           - Full build"
    echo "  ./gradlew clean           - Clean build"
end
