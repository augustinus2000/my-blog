# my-blog

このリポジトリは、Ruby on Rails を使用して開発されたブログアプリケーションです。

基本的な枠組みは、下記URLのガイドラインどおりに構築しました。

https://medium.com/jungletronics/a-rails-blog-in-vs-code-quick-start-5c3173191a64

## Ruby および Rails のバージョン

- **Ruby**: 3.2.2
- **Rails**: 7.2.2.1

## システム依存関係

- **データベース**: SQLite3（開発・テスト環境） / PostgreSQL（Railway での本番環境）
- **Webサーバー**: Puma
- **JavaScript ランタイム**: Node.js (JavaScriptコードを実行できるようにするランタイム)
- **パッケージマネージャー**: Yarn (JavaScriptライブラリを管理するパッケージマネージャ)

## 設定 (セットアップ手順)

このプロジェクトは `rbenv` を使用して、特定の Ruby バージョンをローカル環境で適用しています。  
Rails コマンドを実行する際には `bundle exec` を付ける必要があります。

### **1. リポジトリをクローン**
まず、プロジェクトをローカル環境にダウンロードします。

```bash
git clone https://github.com/augustinus2000/my-blog.git
cd my-blog

### **2. Ruby のバージョンを適用**
このプロジェクトは rbenv を使用して、指定した Ruby バージョンを適用します。

'''bash
rbenv local 3.2.2  # プロジェクトディレクトリ内の Ruby バージョンを指定

バージョンが正しく適用されたか確認:

'''bash
ruby -v

出力例:
'''css ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]

   
Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

