Sonar qube cmd : 

 docker run --rm -v "${PWD}:/usr/src" --network="host" -e SONAR_HOST_URL="http://localhost:9000" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=flask-student-demo -Dsonar.exclusions=**/.pytest_cache/**" -e SONAR_TOKEN="sqp_e70065d2e97f245e58ce20f43dcb24904607586f" sonarsource/sonar-scanner-cli
