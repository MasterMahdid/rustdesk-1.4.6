#!/usr/bin/env bash
export VCPKG_ROOT=/opt/vcpkg
export PKG_CONFIG_PATH="$VCPKG_ROOT/installed/arm64-android/lib/pkgconfig"
export PKG_CONFIG_LIBDIR="$PKG_CONFIG_PATH"
export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
export C_INCLUDE_PATH="$VCPKG_ROOT/installed/arm64-android/include"
export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH"
export LIBRARY_PATH="$VCPKG_ROOT/installed/arm64-android/lib"
cargo ndk --platform 21 --target aarch64-linux-android build --release --features flutter,hwcodec
