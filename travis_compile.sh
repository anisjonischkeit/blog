#!/bin/bash

set -e # Exit with nonzero exit code if anything fails

cabal install blaze-markup
ghc --make site.hs
./site build
cp -a _site/. out/
# stack build
# stack exec site build
ls