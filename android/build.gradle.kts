group = "com.aiuta.flutter.fashionsdk"
version = "1.0-SNAPSHOT"

buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        // Gradle plugin
        val gradlePluginVersion = "8.7.1"
        classpath("com.android.tools.build:gradle:$gradlePluginVersion")

        // Kotlin
        val kotlinVersion = "2.0.20"
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

plugins {
    id("com.android.library")
    id("kotlin-android")
    id("org.jetbrains.kotlin.plugin.compose") version "2.0.20"
    id("org.jetbrains.kotlin.plugin.serialization") version "2.0.20"
}

android {
    namespace = "com.aiuta.flutter.fashionsdk"

    buildFeatures {
        compose = true
    }

    compileSdk = 34

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }


    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
        getByName("test").java.srcDirs("src/test/kotlin")
    }

    defaultConfig {
        minSdk = 23
    }
}

dependencies {
    // Aiuta
    val aiutaVersion = "1.2.2"
    implementation(platform("com.aiuta:fashionsdk-bom:$aiutaVersion"))
    implementation("com.aiuta:fashionsdk-analytic")
    implementation("com.aiuta:fashionsdk-compose-icons")
    implementation("com.aiuta:fashionsdk-tryon-compose")

    // Material
    val materialVersion = "1.12.0"
    implementation("com.google.android.material:material:$materialVersion")

    // Compose
    val activityComposeVersion = "1.9.0"
    implementation("androidx.activity:activity-compose:$activityComposeVersion")

    // Appcompat
    val appcompatVersion = "1.7.0"
    implementation("androidx.appcompat:appcompat:$appcompatVersion")

    // Coil
    val coilVersion = "2.7.0"
    implementation("io.coil-kt:coil-compose:$coilVersion")

    // Serialization
    val kotlinxSerializationVersion = "1.7.3"
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:$kotlinxSerializationVersion")
}