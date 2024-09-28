# Nix Configuration

## Usage

Install Nix
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Initialize Home Manager and apply the configuration
```bash 
nix run home-manager -- init
nix run home-manager -- switch --flake github:JanOlencki/nix-config
```
