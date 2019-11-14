include:
  - jenkins

{% set jenkins_pwd = salt.cmd.run('cat /var/lib/jenkins/secrets/initialAdminPassword') %}

jenkins.job.opg.core.public.domain.model:
  cmd.run:
    - name: java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 -auth admin:{{ jenkins_pwd }} create-job opg-core-public-domain-model < /var/www/jenkins/jobs/opg-core-public-domain-model.xml
    - user: root
    - watch_in:
      - sls: jenkins
