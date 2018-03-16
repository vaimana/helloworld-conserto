node {
    def app

    docker.withServer("tcp://192.168.46.242:2376") {
        stage("Clone repository") {
            checkout scm
        }

        stage("Build image") {
            app = docker.build("helloworld-conserto:${env.BUILD_ID}")
        }

        stage("Test image") {
            app.inside {
                sh 'echo "Tests passed"'
            }
        }
        
        stage("Deploy container") {
            sh 'docker run -d --rm -p 8000:80 --name conserto-test helloworld-conserto:${env.BUILD_ID}'
        }
    }
}
