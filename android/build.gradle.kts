group = "com.aiuta.flutter.fashionsdk"
version = "1.0-SNAPSHOT"

buildscript {
    repositories {
        google()
        mavenCentral()
        // TODO
        mavenLocal()
    }

    dependencies {
        classpath(libs.gradlePlugin.android)
        classpath(libs.gradlePlugin.kotlin)
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        // TODO
        mavenLocal()
    }
}

plugins {
    id("com.android.library")
    id("kotlin-android")
    alias(libs.plugins.kotlin.compose.compiler)
    alias(libs.plugins.kotlin.serialization)
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
    implementation(platform(libs.aiuta.bom))

    implementation(libs.aiuta.analytic)
    implementation(libs.aiuta.compose.icons)
    implementation(libs.aiuta.tryon.compose)
    implementation(libs.android.material)
    implementation(libs.androidx.activity.compose)
    implementation(libs.androidx.appcompat)
    implementation(libs.coil.compose)
    implementation(libs.kotlinx.serialization)
}