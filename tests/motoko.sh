#!/usr/bin/env bash
# Test to setup and build a Motoko project

set -eu -o pipefail
set -x

name="test_project"

cleanup() {
    killall dfx || true
    sleep .5
    rm -rf "$name"
    echo "cleanup done"
}

cleanup

# setup project
dfx --version
dfx new "$name"
cd "$name"

# test dfx start/deploy/canister call 
dfx start &
npm install
sleep 15 # wait for dfx start to complete

dfx deploy

dfx canister call "$name" greet world

dfx ping ic

dfx build

cleanup