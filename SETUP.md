# 手動セットアップ
最初の評価を実行した後，手動でセットアップしないといけない事項を記載します．

## OpenPGPのセットアップ
必要な鍵を取り込み，SSH認証時に差し出すKeygripを設定します．

```bash
$ gpg --import <PATH_TO_KEY.key>
$ gpg -K --with-keygrip #この出力から，認証に使用する鍵のKeygripを取得
$ echo <KEYGRIP> >> ~/.gnupg/sshcontrol
```

