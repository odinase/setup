#!/bin/bash

# Install rust
curl https://sh.rustup.rs -sSf | sh


# Set up tools for rust
source $HOME/.cargo/env
rustup toolchain add nightly
rustup component add rustfmt
rustup component add clippy
cargo +nightly install racer
sudo apt install cargo
