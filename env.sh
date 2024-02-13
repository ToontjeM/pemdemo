#!/bin/bash
export H='\033[1;32m'
export N='\033[0m'

export EDB_SUBSCRIPTION_TOKEN=$(cat $HOME/.edbtoken)
export EDB_REPO_CREDENTIALS_FILE="$HOME/.edbrepocred"