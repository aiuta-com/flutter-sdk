allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.layout.buildDirectory.set(File("../build"))

subprojects {
    layout.buildDirectory.set(File("${rootProject.layout.buildDirectory}/${name}"))
}

subprojects {
    evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}