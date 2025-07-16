plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin") // This should match what's in your settings.gradle.kts
}

android {
    namespace = "com.example.flutter_feedback_app"
    compileSdk = 34
    ndkVersion = "27.0.12077973" // Match your installed NDK version

    defaultConfig {
        applicationId = "com.example.flutter_feedback_app"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            signingConfig = signingConfigs.getByName("debug") // Only for testing; create a real signingConfig later
        }
    }
}
