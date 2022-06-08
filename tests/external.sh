#!/usr/bin/env bash
# Test to setup and build a Motoko project

# fail on any error
set -eu -o pipefail
set -x

repo="https://github.com/7flash/icp_eight"
name="test_project"
canister="icp_eight"
base_dir="$PWD"

cleanup() {
    cd "$base_dir"
    killall dfx || true
    sleep .5
    rm -rf "$name"
    echo "cleanup done"
}

cleanup

# setup project
dfx --version
git clone "$repo" "$name"
cd "$name"

# test dfx start/deploy/canister call 
dfx start &
npm install
sleep 15 # wait for dfx start to complete

dfx deploy

dfx canister call icp_eight proposeNew "Hey"
dfx canister call icp_eight getProposal

dfx ping ic

dfx build


cleanup
echo "ALL TEST PASSED"