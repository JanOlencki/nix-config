FROM debian:latest

RUN apt update -y
RUN apt install curl -y
RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  --extra-conf "sandbox = false" \
  --init none \
  --no-confirm
ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"

ENV USER=root
RUN nix run home-manager -- init
RUN nix run home-manager -- switch --flake github:JanOlencki/nix-config
