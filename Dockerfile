FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-venv \
        lsb-release && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/bin/python3 /usr/bin/python

# Switch back to the jenkins user for security
USER jenkins
