#!/bin/bash
export G='\033[1;32m'
export R='\033[1;31m'
export N='\033[0m'

export EDB_SUBSCRIPTION_TOKEN=$(cat $HOME/.edbtoken)
export EDB_REPO_CREDENTIALS_FILE="$HOME/.edbrepocred"
