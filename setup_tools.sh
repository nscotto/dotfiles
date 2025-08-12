#!/usr/bin/env bash

# Exit immediately if any command fails
set -e

# Suppress ALL prompts
export DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
yes | sudo apt-get -y --allow-downgrades --allow-remove-essential --allow-change-held-packages install \
  build-essential \
  gpg \
  wget \
  git \
  curl \
  make \
  perl \
  bzip2 xz-utils lzma zstd \
  unzip unrar rar p7zip-full cabextract \
  rpm libarchive-tools \
  groff-base dpkg-dev \
  w3m lynx links elinks \
  poppler-utils antiword catdoc unrtf \
  libimage-exiftool-perl \
  imagemagick id3v2 mp3info \
  html2text pandoc \
  libnetpbm11t64 djvulibre-bin \
  libfile-mimeinfo-perl \
  perl-doc libxml2-utils \
  ghostscript groff texlive-binaries \
  autoconf automake libtool pkg-config

# eza installation
if ! command -v eza &>/dev/null; then
  echo "Installing eza..."
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list >/dev/null
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
  sudo apt-get update -y
  sudo apt-get install -y --no-install-recommends eza
fi

# bat installation
if ! command -v bat &>/dev/null; then
  echo "Installing bat..."
  sudo apt-get install -y --no-install-recommends bat
fi

# Chafa installation
if ! command -v chafa &>/dev/null; then
  echo "Installing chafa from source..."
  temp_dir=$(mktemp -d)
  trap 'rm -rf "$temp_dir"' EXIT

  (
    cd "$temp_dir" || exit 1
    git clone --depth 1 https://github.com/hpjansson/chafa.git
    cd chafa || exit 1
    ./autogen.sh && make && sudo make install
  ) || echo "Failed to install chafa" >&2
fi

# ExifTool installation
if ! command -v exiftool &>/dev/null; then
  echo "Installing ExifTool..."
  temp_dir=$(mktemp -d)
  trap 'rm -rf "$temp_dir"' EXIT

  (
    cd "$temp_dir" || exit 1
    wget https://exiftool.org/Image-ExifTool.tar.gz
    tar -xzf Image-ExifTool.tar.gz
    cd Image-ExifTool-* || exit 1
    perl Makefile.PL
    make test
    sudo make install
  ) || echo "Failed to install ExifTool" >&2
fi

# lesspipe installation with all features enabled
if ! command -v lesspipe &>/dev/null && [ ! -f ~/.lesspipe ]; then
  echo "Installing lesspipe with all features..."
  temp_dir=$(mktemp -d)
  trap 'rm -rf "$temp_dir"' EXIT

  (
    cd "$temp_dir" || exit 1
    wget https://github.com/wofr06/lesspipe/archive/refs/heads/master.tar.gz -O lesspipe.tar.gz
    tar -xzf lesspipe.tar.gz
    cd lesspipe-master || exit 1

    # Configure with all features enabled
    #yes | ./configure --prefix="$HOME/.local" <<< $'y\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny\ny'
    yes | ./configure --prefix="$HOME/.local"

    make
    make install
  ) && {
    # Set up environment
    echo "export LESSOPEN=\"|\$HOME/.local/bin/lesspipe.sh %s\"" >>~/.bashrc
    echo "export LESS_ADVANCED_PREPROCESSOR=1" >>~/.bashrc
    echo "lesspipe with full features installed to $HOME/.local/bin"
    export LESSOPEN="|$HOME/.local/bin/lesspipe.sh %s"
    export LESS_ADVANCED_PREPROCESSOR=1
  } || {
    echo "Failed to install lesspipe" >&2
    exit 1
  }
fi

# Neovim Nightly AppImage installation
install_neovim_nightly() {
  echo "Installing Neovim Nightly AppImage..."

  # Set installation directories
  NVIM_DIR="${HOME}/.local/share/nvim-nightly"
  NVIM_BIN="${HOME}/.local/bin"
  mkdir -p "${NVIM_DIR}" "${NVIM_BIN}"

  temp_dir=$(mktemp -d)
  trap 'rm -rf "${temp_dir}"' EXIT

  (
    cd "${temp_dir}" || {
      echo "Failed to enter temp directory" >&2
      exit 1
    }

    # Download nightly AppImage with proper user-agent and retries
    wget --tries=3 --waitretry=5 \
      --user-agent="Mozilla/5.0" \
      "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage"

    # Verify download
    if [ ! -f "nvim-linux-x86_64.appimage" ]; then
      echo "Failed to download Neovim Nightly AppImage" >&2
      echo "You can try manually downloading from:" >&2
      echo "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage" >&2
      exit 1
    fi

    # Make executable and extract
    if ! chmod u+x nvim-linux-x86_64.appimage; then
      echo "Failed to make AppImage executable" >&2
      exit 1
    fi

    if ! ./nvim-linux-x86_64.appimage --appimage-extract >/dev/null 2>&1; then
      echo "Failed to extract AppImage" >&2
      exit 1
    fi

    # Install to target directory
    if [ ! -d "squashfs-root" ]; then
      echo "Extracted files not found" >&2
      exit 1
    fi

    mv squashfs-root "${NVIM_DIR}/appimage" || {
      echo "Failed to move extracted files" >&2
      exit 1
    }
    ln -sf "${NVIM_DIR}/appimage/AppRun" "${NVIM_BIN}/nvim" || {
      echo "Failed to create symlink" >&2
      exit 1
    }

    # Verify installation
    if ! "${NVIM_BIN}/nvim" --version >/dev/null 2>&1; then
      echo "Neovim installation verification failed" >&2
      exit 1
    fi

    # Add to PATH if needed
    case ":${PATH}:" in
    *:"${NVIM_BIN}":*) ;; # Already in PATH
    *)
      echo "Adding Neovim to PATH..."
      echo "export PATH=\"${NVIM_BIN}:\${PATH}\"" >>"${HOME}/.bashrc"
      echo "export PATH=\"${NVIM_BIN}:\${PATH}\"" >>"${HOME}/.zshrc"
      export PATH="${NVIM_BIN}:${PATH}"
      ;;
    esac

    echo "Neovim Nightly installed successfully to ${NVIM_DIR}"
    echo "Binary linked to ${NVIM_BIN}/nvim"
    echo "Version: $("${NVIM_BIN}/nvim" --version | head -n 1)"
  ) || {
    echo "Neovim Nightly installation failed" >&2
    rm -rf "${NVIM_DIR}" # Clean up failed installation
    exit 1
  }
}

# Main execution
if command -v nvim >/dev/null 2>&1; then
	echo "Skipping Neovim installation"
else
  install_neovim_nightly
fi

# Install latest Go version if not found
install_go() {
  if ! command -v go &>/dev/null; then
    echo "Installing latest Go version..."

    # Set installation directory
    GO_DIR="${HOME}/.local/go"
    mkdir -p "${GO_DIR}"

    temp_dir=$(mktemp -d)
    trap 'rm -rf "${temp_dir}"' EXIT

    (
      cd "${temp_dir}" || {
        echo "Failed to enter temp directory" >&2
        exit 1
      }

      # Get latest Go version
      GO_URL="https://go.dev/dl/"
      GO_VERSION=$(curl -s https://go.dev/dl/ | grep -oP 'go[0-9.]+\.linux-amd64\.tar\.gz' | head -1)

      if [ -z "${GO_VERSION}" ]; then
        echo "Failed to determine latest Go version" >&2
        exit 1
      fi

      echo "Downloading ${GO_VERSION}..."

      # Download with retries
      for i in {1..5}; do
        if wget --tries=3 --waitretry=5 \
          --user-agent="Mozilla/5.0" \
          "https://go.dev/dl/${GO_VERSION}"; then
          break
        fi
        sleep $((i * 2))
        echo "Retry $i/5..."
      done

      # Verify download
      if [ ! -f "${GO_VERSION}" ]; then
        echo "Failed to download Go" >&2
        echo "You can try manually downloading from:" >&2
        echo "https://go.dev/dl/" >&2
        exit 1
      fi

      # Install Go
      echo "Installing to ${GO_DIR}..."
      tar -xzf "${GO_VERSION}" -C "${GO_DIR}" --strip-components=1 || {
        echo "Failed to extract Go" >&2
        exit 1
      }

      # Add to PATH if needed
      case ":${PATH}:" in
      *:"${GO_DIR}/bin":*) ;; # Already in PATH
      *)
        echo "Adding Go to PATH..."
        echo "export PATH=\"${GO_DIR}/bin:\${PATH}\"" >>"${HOME}/.bashrc"
        echo "export PATH=\"${GO_DIR}/bin:\${PATH}\"" >>"${HOME}/.zshrc"
        echo "export GOROOT=\"${GO_DIR}\"" >>"${HOME}/.bashrc"
        echo "export GOROOT=\"${GO_DIR}\"" >>"${HOME}/.zshrc"
        export PATH="${GO_DIR}/bin:${PATH}"
        export GOROOT="${GO_DIR}"
        ;;
      esac

      # Verify installation
      if ! go version &>/dev/null; then
        echo "Go installation verification failed" >&2
        exit 1
      fi

      echo "Go installed successfully: $(go version)"
    ) || {
      echo "Go installation failed" >&2
      rm -rf "${GO_DIR}" # Clean up failed installation
      exit 1
    }
  else
    echo "Go already installed: $(go version)"
  fi
}

# Main execution
install_go
