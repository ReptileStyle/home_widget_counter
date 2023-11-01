#!/bin/bash
flutter pub get
cd ios && pod install && cd ..

echo "Version: "
read version

echo "Build number: "
read build_number

sed -E -i '' "s/MARKETING_VERSION = [^;]+;/MARKETING_VERSION = $version;/g" ./ios/Runner.xcodeproj/project.pbxproj
sed -E -i '' "s/CURRENT_PROJECT_VERSION = [^;]+;/CURRENT_PROJECT_VERSION = $build_number;/g" ./ios/Runner.xcodeproj/project.pbxproj
