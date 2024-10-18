allprojects {
    repositories {
        google()
        mavenCentral()
        // TODO
        mavenLocal()
    }
}

rootProject.layout.buildDirectory.set(File("../build"))

subprojects {
    layout.buildDirectory.set(File("${rootProject.buildDir}/${name}"))
}

subprojects {
    evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}