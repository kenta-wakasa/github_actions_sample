#!/bin/bash

# アップデートなどをかけるために path 情報を生成する
root=$(pwd) 
flutter_dir=$root/flutter
flutter_bin_dir=$flutter_dir/bin
flutter=$flutter_bin_dir/flutter

# flutter を clone してくる
git clone https://github.com/flutter/flutter.git

# upgrade をかける
$flutter upgrade

# 情報を取得
flutter_commit=$(cd flutter; git log --oneline -1 | awk '{print $1}')
flutter_full_version=$(cat $flutter_dir/version)
vers=(${flutter_full_version//./ })
flutter_version=${vers[0]}.${vers[1]}

# 出力する
echo "$flutter_full_version"

echo "$flutter_bin_dir" >> $GITHUB_PATH
echo "FLUTTER_COMMIT=$flutter_commit" >> $GITHUB_ENV
echo "FLUTTER_HOME=$flutter_dir" >> $GITHUB_ENV
echo "FLUTTER_FULL_VERSION=$flutter_full_version" >> $GITHUB_ENV
echo "FLUTTER_VERSION=$flutter_version" >> $GITHUB_ENV