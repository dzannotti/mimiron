#!/bin/bash

# Set identification from install inputs
if [[ -n "${MIMIRON_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$MIMIRON_USER_NAME"
fi

if [[ -n "${MIMIRON_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$MIMIRON_USER_EMAIL"
fi
