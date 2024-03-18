# Install home-manager
initialize:
  if [ -d "./result/" ]; then \
    echo "home-manager is installed"; \
  else \
    echo "Installing home-manager"; \
    nix run . -- switch --flake .; \
  fi

# Regenerate all dotfiles
@reload: initialize 
  # Normally you could just use a . for the -flake arg, 
  # but this means it cannot see git ignored files and therefore 
  # can't see anything in private/
  @home-manager switch --flake path:$(pwd)

# Format nix files
fmt:
  nix fmt

# Delete result
clean:
  rm -rf result
