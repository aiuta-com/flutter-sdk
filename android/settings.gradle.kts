dependencyResolutionManagement {
    versionCatalogs {
        create("libs") {
            from(files("./gradle/libs.versions.toml"))
        }
    }
}

rootProject.name = 'flutter_aiutasdk'