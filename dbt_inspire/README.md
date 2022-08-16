# dbtインスパイア
* dbt風にテストコードを動的に生成
* gen-sql.ps
  * 実行ファイル
  * powershellしかない環境で頑張る
* target_model.sql
  * テスト対象のモデル
* target_column.sql
  * テスト対象のカラム
* unique.sql
  * テストケース
* output.sql
  * 出力ファイル

```sh
% pwsh gen-sql.ps 
% bq query --use_legacy_sql=false < output.sql
Waiting on bqjob_111111111111111111111 ... (0s) Current status: DONE   
+--------+
| result |
+--------+
|   true |
+--------+
```
