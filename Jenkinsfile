library 'springfield-pipeline-steps_v2@jenkins-github'

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

# Counter to generate a commit webhook message: 2
