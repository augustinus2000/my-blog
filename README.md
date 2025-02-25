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
```

### **2. Ruby のバージョンを適用**
このプロジェクトは rbenv を使用して、指定した Ruby バージョンを適用します。

```bash
rbenv local 3.2.2  # プロジェクトディレクトリ内の Ruby バージョンを指定
```

バージョンが正しく適用されたか確認:

```bash
ruby -v
```

出力例:

```css
 ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]
```

### **3. Bundler のセットアップ**
このプロジェクトでは `Bundler` を使用して RubyGems の依存関係を管理します。

#### **(1) Bundler のインストール**
まず、Bundler がインストールされているか確認し、ない場合はインストールします。

```bash
gem install bundler
```

Bundler のバージョンを確認するには:

```bash
bundle -v
```

#### **(2) Gemfile の作成**
もし Gemfile が存在しない場合、以下のコマンドで作成します。

```bash
bundle init
```

その後、Gemfile を開いて以下の内容を追加または変更してください。

```bash
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
```

#### **(3) Rails のインストール**
次に、指定されたバージョンの Rails をインストールします。

```bash
bundle install
```

bundle install を実行すると Gemfile.lock が作成され、指定されたバージョンの Rails がインストールされます。

#### **(4) Rails の動作確認**

Rails が正しくインストールされたか確認するには、次のコマンドを実行してください。

```bash
bundle exec rails -v
```

出力例:

```nginx
Rails 7.2.2.1
```

### **4. データベースのセットアップ**
このプロジェクトには **既にデータベースファイル (`db/`) が含まれています**。  
そのため、新しくデータベースを作成する必要はありません。  

しかし、環境に応じて **マイグレーションの適用が必要な場合があります**。  
以下のコマンドを実行してください。

```bash
bundle exec rails db:migrate
```


(オプション) 初期データを追加する場合:

```bash
bundle exec rails db:seed
```
もし db/migrate/ に新しいマイグレーションファイルが存在しない場合、このコマンドは何も変更しません。

### **5. テストの実行方法**
このプロジェクトには Rails の標準テストフレームワーク が含まれています。
以下のコマンドでテストを実行できます。

```bash
bundle exec rails test
```

### **6. サービス**

### **7. デプロイ方法**
このプロジェクトは Railway を使用してデプロイできます。

#### **(1) Railway CLI のインストール**
まず、Railway CLI をインストールしてください。

```bash
npm install -g @railway/cli
```

#### **(2) Railway にログイン**

```bash
railway login
```

#### **(3) デプロイの実行**

```bash
railway up
```

環境変数を設定する手順が追加される場合があります。

デプロイが成功裏に完了すると、Live URL をクリックしてウェブサイトを確認することができます。
![railway배포](https://github.com/user-attachments/assets/952c8265-062a-40a9-b28d-11c5832ac10c)
