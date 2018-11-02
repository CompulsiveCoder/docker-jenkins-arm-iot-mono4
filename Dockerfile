FROM compulsivecoder/jenkins-arm

USER root

RUN apt-get update && apt-get install -y nano python python-pip build-essential && rm -rf /var/lib/apt/lists/*

RUN python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"

RUN apt-get update && apt-get -y install \
  wget \
  git \
  tzdata \
  mono-complete \
  ca-certificates-mono \
  python \
  python-pip \
  && rm -rf /var/lib/apt/lists/*

ADD http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war /usr/local/jenkins.war

USER ${user}

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/local/jenkins.war"]
EXPOSE 8080
CMD [""]
