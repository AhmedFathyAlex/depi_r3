import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("development") {
            dimension = "flavor-type"
            applicationId = "com.example.depi_flutter.dev"
            resValue(type = "string", name = "app_name", value = "DEPI DEV")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.example.depi_flutter.prod"
            resValue(type = "string", name = "app_name", value = "DEPI PRODUCTION")
        }
    }
}