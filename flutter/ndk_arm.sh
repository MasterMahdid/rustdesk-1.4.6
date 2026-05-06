#!/usr/bin/env bash
set -e

export VCPKG_ROOT=/opt/vcpkg

# =========================
# 1. HOST SAFE ENV (IMPORTANT)
# =========================
unset PKG_CONFIG_PATH
unset PKG_CONFIG_LIBDIR
unset OPENSSL_DIR
unset OPENSSL_LIB_DIR
unset OPENSSL_INCLUDE_DIR

# Ensure host OpenSSL is used
export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1

# =========================
# 2. ANDROID TOOLCHAIN ONLY FOR CARGO-NDK
# =========================
export ANDROID_NDK_HOME=${ANDROID_NDK_HOME:-/opt/android-sdk/ndk/25.2.9519653}

# DO NOT expose vcpkg globally
# Only pass it during dependency build (not Rust build.rs)

# =========================
# 3. BUILD
# =========================
cargo ndk \
  --platform 21 \
  --target armv7-linux-androideabi \
  build --release --features flutter,hwcodec