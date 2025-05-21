# Display time
SPACESHIP_TIME_SHOW=true

# Display username always
SPACESHIP_USER_SHOW=always

# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# Add custom Ember section
# See: https://github.com/spaceship-prompt/spaceship-ember
spaceship add ember

# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode

# Kubernetes
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECTL_PREFIX="using "
SPACESHIP_KUBECTL_SUFFIX=" "
SPACESHIP_KUBECTL_COLOR="cyan"
SPACESHIP_KUBECTL_SYMBOL="☸️·"
SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE=true
