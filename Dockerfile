FROM node:10.15.0

RUN apt-get update && apt-get install -y python-dev jq
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install awscli --upgrade
RUN npm install -g aws-cdk@0.37
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl 
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/ 
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
RUN chmod +x get_helm.sh
RUN ./get_helm.sh