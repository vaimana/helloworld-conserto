node {
    def app

    stage("Clone repository") {
        checkout scm
    }

    stage("Build image") {
        docker.withServer("tcp://192.168.46.242:2376") {
            app = docker.build("helloworld-conserto:${env.BUILD_ID}")
        }
    }

    stage("Test image") {
        app.inside {
            sh "echo "Tests passed""
        }
    }
}
