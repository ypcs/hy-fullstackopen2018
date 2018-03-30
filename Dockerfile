FROM ypcs/node:upstream

RUN \
    /usr/local/sbin/docker-upgrade && \
    apt-get --assume-yes install \
        bash-completion \
        git \
        less \
        source-highlight \
        vim \
        vim-scripts && \
    /usr/local/sbin/docker-cleanup


RUN adduser --disabled-password --gecos "User,,," user

WORKDIR /home/user

USER user

# Create ~/.npm-packages, which is set as target for globally installed packages
ENV NPM_PACKAGES .npm-packages 
RUN mkdir -p "$(pwd)/${NPM_PACKAGES}" && \
    echo "prefix=$(pwd)/${NPM_PACKAGES}" >>${HOME}/.npmrc && \
    echo "PATH=\"\${PATH}:$(pwd)/${NPM_PACKAGES}/bin\"" >>${HOME}/.bashrc

RUN npm install -g npx
RUN npm install -g create-react-app

CMD ["bash"]
