#!/bin/bash
spotim_sdk_version='0.3.2'

set -e
cd "$(dirname "$0")"

output_dir="./downloads"
mkdir -p "$output_dir"

cd $output_dir

rm -fr ./*.zip
rm -fr ./OpenWrapSDK
rm -fr ./OpenWrapHandlers
rm -fr ./SpotImStandaloneAds

dfp_filename='openwrap-handler-dfp-4.0.0.zip'
openwrap_dfp_source="https://repo.pubmatic.com/artifactory/public-repos/ios/openwrap-handler-dfp/4.0.0/$dfp_filename"

openwrapsdk_filename='openwrap-sdk-3.3.0.zip'
openwrapsdk_source="https://repo.pubmatic.com/artifactory/public-repos/ios/openwrap-sdk/3.3.0/$openwrapsdk_filename"

spotimsdk_filename='SpotImStandaloneAds.zip'
spotimsdk_source="https://github.com/Aniview/spotim-sdk-ios-pods/releases/download/${spotim_sdk_version}/$spotimsdk_filename"

echo "\nDownloading: $openwrap_dfp_source"
curl --output $dfp_filename  -L $openwrap_dfp_source
echo "\nDownloading: $openwrapsdk_source"
curl --output $openwrapsdk_filename  -L $openwrapsdk_source
echo "\nDownloading: $spotimsdk_source"
curl --output $spotimsdk_filename -L $spotimsdk_source
unzip $dfp_filename
unzip $openwrapsdk_filename
unzip $spotimsdk_filename
