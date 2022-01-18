#!/bin/bash

java -Drundeck.jaaslogin=true -Djava.security.auth.login.config=/etc/rundeck/jaas-loginmodule.conf -Dloginmodule.name=RDpropertyfilelogin -Drdeck.config=/etc/rundeck -Drundeck.server.configDir=/etc/rundeck -Dserver.datastore.path=/var/lib/rundeck/data/rundeck -Drundeck.server.serverDir=/var/lib/rundeck -Drdeck.projects=/var/lib/rundeck/projects -Dlog4j.configurationFile=/etc/rundeck/log4j2.properties -Dlogging.config=file:/etc/rundeck/log4j2.properties -Drdeck.runlogs=/var/lib/rundeck/logs -Drundeck.server.logDir=/var/lib/rundeck/logs -Drundeck.config.location=/etc/rundeck/rundeck-config.properties -Djava.io.tmpdir=/tmp/rundeck -Drundeck.server.workDir=/tmp/rundeck -Dserver.http.port=${RUNDECK_PORT} -Drdeck.base=/var/lib/rundeck -Xmx${JAVA_XMX} -Xms${JAVA_XMS} -XX:MaxMetaspaceSize=256m -server ${JAVA_OPTS} -jar /var/lib/rundeck/bootstrap/rundeck-${RUNDECK_VERSION}-*.war --skipinstall