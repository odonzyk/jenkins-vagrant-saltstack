include:
  - jenkins
  - base

{% set jenkins_pwd = salt.cmd.run('cat /var/lib/jenkins/secrets/initialAdminPassword') %}

update.jenkins.update.centre:
  cmd.run:
    - name: "curl -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack"
    - require:
      - pkg: curl
      
{% for pluginName in ['git', 'postbuild-task', 'greenballs', 'xunit'] %}

jenkins.plugin.{{ pluginName }}:
  cmd.run:
    - name: java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 -auth admin:{{ jenkins_pwd }} install-plugin {{ pluginName }}
    - user: root
    - watch_in:
      - module: jenkins-restart
    - require:
      - pkg: jenkins
      - cmd: update.jenkins.update.centre

{% endfor %}
