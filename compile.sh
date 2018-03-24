#!/bin/bash

set -e # Exit with nonzero exit code if anything fails

echo "hellos"
stack exec site build
ls