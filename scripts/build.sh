#!/bin/sh


set -e

echo "Generating TrueType Fonts"
fontmake  -o ttf --output-dir ../fonts/ttf2/ -u ../sources/UFO/RailroadGothicCC.ufo

echo "Hot Fixes"
gftools fix-dsig -f ../fonts/ttf2/*.ttf

mkdir -p ../fonts/ttf

ttfautohint -n ../fonts/ttf2/RailroadGothicCC.ttf ../fonts/ttf/RailroadGothicCC.ttf

gftools fix-hinting ../fonts/ttf/RailroadGothicCC.ttf

echo "Cleaning Directory Up"
rm ../fonts/ttf/*.ttf

mv ../fonts/ttf/RailroadGothicCC.ttf.fix ../fonts/ttf/RailroadGothicCC.ttf

rm ../fonts/ttf2/*.ttf
rmdir ../fonts/ttf2

echo "Generating OpenType Fonts"
fontmake  -o otf --output-dir ../fonts/otf/ -u ../sources/UFO/RailroadGothicCC.ufo

echo "All Done!"
