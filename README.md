# scripts-for-EMSOFT2025
This repository includes scripts for reproducing the results of Breach and ForeSee.

## breach_scripts

BreachでATとCCを回すためのスクリプト一式が入っています。

- 各ディレクトリにはそれぞれ以下のファイルが含まれています。
  - *.stl: propertyを記述したファイル。
  - InitXX.m: モデルの初期化に用いる MATLAB スクリプト。各種パラメータが記述されています。
  - run.m: falsificationを1回実行するためのスクリプト。
    - run(i)と呼び出すことでモデルXXに対してstli.stlのfalsificationを実行します。
  - experiments.m: 複数回実験を回したいときに使うファイル。
    - for文中の `i` はpropertyのindex, `j`は実験の試行回数を表しています。
    - runの実行に加えてcacheの削除, logの記録, run全体の実行時間の取得を行なっています。

## ForeSee_scripts
ForeSeeでATとCCを回すためのスクリプト一式が入っています。

- AT, CCディレクトリには実験を回すためのshell scriptが含まれています。
- 以下の設定を行った後`<path/to/script> <path/to/result>` を実行することで、`<path/to/result>`に結果をまとめたCSVファイルが出力されます。
  - 環境変数`FORESEE_HOME`にForeSeeのディレクトリへのパスを設定する。
  - `matlab` コマンドでMATLABが起動するようにする。
    - `matlab`コマンド以外で動かしたい時は各スクリプトの3行目のコマンドを適宜修正する。
  - ATを動かす場合は環境に応じて6行目のpathを修正する。
- 実験の試行回数は各スクリプト中の`trials`で管理しています。
