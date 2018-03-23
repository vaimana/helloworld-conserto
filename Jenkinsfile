node {
    def app

    stage("Clone repository") {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"                        
        commit_id = readFile('.git/commit-id').trim()
    }

    stage("Build image") {
        docker.withServer("tcp://192.168.46.115:2376") {
            //app = docker.build("helloworld-conserto:${env.BUILD_ID}")
            app = docker.build("helloworld-conserto:${commit_id}")
        }
    }

    stage("Test image") {
        docker.withServer("tcp://192.168.46.115:2376") {
            app.inside {
                sh 'echo "Tests passed"'
            }
        }
    }
    
    stage("Deploy container") {
        docker.withServer("tcp://192.168.46.115:2376") {
            sh ' docker stop conserto-test || true && docker rm conserto-test || true'
            docker.image("helloworld-conserto:${commit_id}").run("--name conserto-test -p 8000:80")
        }
    }
}
