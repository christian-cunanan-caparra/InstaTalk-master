plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.members_lists"
    compileSdk 34 // Use actual SDK version

    ndkVersion "27.0.12077973"

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_11
                targetCompatibility JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId "com.example.members_lists"
        minSdk 21  // Set this according to your app's needs
        targetSdk 34
        versionCode 1
        versionName "1.0.0"
    }

    signingConfigs {
        release {
            storeFile file("app/keystore.jks") // Correct path
            storePassword System.getenv("CM_KEYSTORE_PASSWORD") ?: "123456789"
            keyAlias System.getenv("CM_KEY_ALIAS") ?: "my-key"
            keyPassword System.getenv("CM_KEY_PASSWORD") ?: "123456789"
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
                    minifyEnabled false
            shrinkResources false
        }
    }
}

flutter {
    source "../.."
}
