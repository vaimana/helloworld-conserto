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
        docker.withServer("tcp://192.168.46.242:2376") {
            app.inside {
                sh 'echo "Tests passed"'
            }
        }
    }
    
    stage("Deploy container") {
        docker.withServer("tcp://192.168.46.242:2376") {
            sh 'docker run -d --rm -p 8000:80 --name conserto-test helloworld-conserto:${env.BUILD_ID}'
        }
    }
}
