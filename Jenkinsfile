library 'springfield-pipeline-steps_v2'

String project = "examples"
String appName = "springfield-example"

String deployNamespace = "example"

String releaseType = "backend"

springfieldPipeline {

    logging = [
        debug: true
    ]

    maven = [
        javaVersion: '17',
        junitReports: 'target/surefire-reports/*.xml'
    ]

    images = [
        [
            dockerRepo: project,
            name: appName,
        ]
    ]

}
