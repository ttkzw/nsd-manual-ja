# nsd-manual ja

本プロジェクトは[nsd-manual](https://github.com/NLnetLabs/nsd-manual)の文書を日本語に翻訳するものです。

## 必要とするもの

- Docker
- make
- OmegaT

## 手順

1. フォークして、git cloneする。
2. 次のコマンドを実行して、poファイルを生成し、OmegaTのsourceディレクトリにコピーする。

    ```
    make pull
    ```

3. OmegaTを起動し、omegatディレクトリを開き、翻訳する。
4. OmegaTで訳文ファイルを生成する。このとき、訳文ファイルはOmegaTのtargetディレクトリに生成される。
5. 次のコマンドを実行して、訳されたpoファイルをnsd-manualのlocaleに戻して、HTMLファイルを生成する。

    ```
    make push
    ```

6. GitHubのリポジトリにコミットして、プルリクエストを作成する。

## 参考ページ

- [nsd-manual](https://github.com/NLnetLabs/nsd-manual)
- [国際化 - Sphinx Documentation](https://www.sphinx-doc.org/ja/master/usage/advanced/intl.html)
