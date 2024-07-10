# Flake test

I want to create a flake that can provide me multiple shells

## How to run

### Develop in serviceA
```shell
nix develop .#serviceA
```

the shell comes with fish shell, but it is not loaded automatically
to use fish shell, run this command
```shell
nix develop .#serviceA --command fish
```

### Develop in serviceB
```shell
nix develop .#serviceB
```

the shell comes with fish shell, but it is not loaded automatically
to use fish shell, run this command
```shell
nix develop .#serviceB --command fish
```
