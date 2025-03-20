import java.util.Properties
import java.io.File

plugins {
    id("com.android.application") // Or "com.android.library" if applicable
    kotlin("android")
}

android {
    namespace = "com.example.barena" // Replace with your actual package name
    compileSdk = 34
    sourceSets["main"].manifest.srcFile("app/src/main/AndroidManifest.xml")
    defaultConfig {
        applicationId = "com.example.barena"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }
}



// Apply to all projects
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Load signing properties safely
val keyPropertiesFile = File(rootProject.rootDir, "key.properties")
val keyProperties = Properties()
if (keyPropertiesFile.exists()) {
    keyProperties.load(keyPropertiesFile.inputStream())
}

subprojects {
    project.evaluationDependsOn(":app")
}

