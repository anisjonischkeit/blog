#!/bin/bash

set -e # Exit with nonzero exit code if anything fails

echo "hellos"
cabal install hakyll
ghc --make site.hs
./site build
# stack build
# stack exec site build
ls