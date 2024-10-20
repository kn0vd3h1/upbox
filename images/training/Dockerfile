FROM alpine:latest
RUN apk add --update --no-cache \
  bash \
  curl \
  docker \
  file \
  git \
  go \
  gopls \
  helm \
  jq \
  lynx \
  make \
  nodejs \
  openssh \
  podman \
  python3 \
  supervisor \
  vim \
  zsh

COPY config/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Replace PR branch path below with "https://cli.upbound.io"
RUN curl -sL \
  "https://raw.githubusercontent.com/upbound/up/refs/heads/feature-aarch-support/install.sh" \
  -o "install.sh" && \
  sh ./install.sh && \
  rm ./install.sh && \
  mv ./up /usr/local/bin
RUN curl -sL \
  "https://raw.githubusercontent.com/crossplane/crossplane/main/install.sh" \
  -o "install.sh" && \
  sh ./install.sh && \
  rm ./install.sh && \
  mv ./crossplane /usr/local/bin
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin
RUN mv /usr/bin/vim /usr/bin/vi

COPY training-material /root/training-material
COPY dot/dot-vim /root/.vim
COPY dot/dot-vimrc /root/.vimrc
COPY dot/dot-oh-my-zsh /root/.oh-my-zsh
COPY dot/dot-zshrc /root/.zshrc

ENV TERM xterm-256color
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
ENV HOME /root

ENTRYPOINT ["zsh"]
#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
