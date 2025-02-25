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

### **6. デプロイ方法**
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
![railway배포-1](https://github.com/user-attachments/assets/16f2577b-468d-4036-9e12-5ab1057c8944)
**▲ 蛍光ファンで強調した部分をクリックすると、デプロイされたウェブサイトを確認できます。**


![배포-1](https://github.com/user-attachments/assets/1ac59fa6-32a1-47ef-ae7d-b94a0617f88f)
**▲ `https://myapp.railway.app` 形式のURLが確認できます。**


### **7. Rails サーバーの起動**
開発環境で Rails サーバーを起動するには:

```bash
bundle exec rails server
```

ローカル環境でアプリにアクセスするには、ブラウザで以下の URL を開いてください。

```bash
http://localhost:3000
```

## **ブログの紹介**

### **1. ホーム画面**
![홈화면](https://github.com/user-attachments/assets/d9f5d54b-5919-4692-ae90-11b8666341da)
**▲ これはブログのホーム画面です。**

### **2. About画面**
![image](https://github.com/user-attachments/assets/a61da36b-c6f7-457e-9a8c-175cf8128c34)
About画面では私の簡単な紹介が出ています。

### **3. ユーザー登録 (Sign Up)**
![회원가입](https://github.com/user-attachments/assets/fb544781-4f1b-419a-a355-0a9b37be4c83)
**▲ 画面右上の「Sign up」ボタンをクリックすると、新規登録ページに遷移します。ここで名前・メールアドレス・パスワードを入力して登録できます。**


### **4. ログイン**
![로그인](https://github.com/user-attachments/assets/84a0ddad-11bb-4941-911f-7a951867ba2a)
**▲ 既にユーザー登録がされている場合は、「Login」ボタンをクリックしてログインすることができます。**


![로그인 홈화면](https://github.com/user-attachments/assets/77f64416-4ad9-4f3e-9603-f83a302796ce)
**▲ ログインすると、ホーム画面右上にユーザー名が表示されます。**


### **5. ユーザー ドロップダウンメニュー (User Dropdown Menu)**
画面の右上にある **ユーザー名の横の矢印** をクリックすると、  
以下のメニューが表示されます。
![로그인 드롭바](https://github.com/user-attachments/assets/3461a5d1-2c45-46b0-884e-2d97b5246453)
📌 **ドロップダウンメニューでできること**
1. **新しい投稿を作成する** (`New Post`); 
3. **ユーザー情報を変更する** (`Edit Account`)
4. **ログアウトする** (`Sign Out`)

### **6. ユーザー情報を変更する(`Edit Account`) 8**
![Edit account](https://github.com/user-attachments/assets/c103a5c2-74eb-4095-a523-a8a24369c3bc)
▲ ドロップダウンメニューのEdit Accountボタンを押すと、上記の画面に移動します。 ここでユーザーの名前、パスワードを変更することもできますし、アカウントを削除することもできます。

### **7. 投稿(Posts)**
ホーム画面左上のPostsボタンを押すと、ブログに掲示された掲示物を確認することができます。
![image](https://github.com/user-attachments/assets/ce097807-53ff-4773-95e8-7164bc8e29ab)

#### **(1) 新しい投稿アップロード **
新しい投稿の作成は、ログインした状態でのみ可能です。ユーザードロップダウンメニューのNew Postボタンを押して投稿できます。
![image](https://github.com/user-attachments/assets/6618d634-de75-4704-a5ff-558ce62fe99e)
▲ これが投稿するときの画面です。 タイトル、文章を書くことができ、写真もアップロードできます。 また、投稿のカテゴリもユーザーが設定できます。

#### **(2) 投稿の修正、削除 **
![image](https://github.com/user-attachments/assets/f500949d-28e6-420b-9a0d-06f08b2f98b7)
![image](https://github.com/user-attachments/assets/786788a7-7819-49f5-8761-c4b3d50d4b33)
▲ 投稿の修正、削除は、投稿の作成者のみ可能です！作成者のアカウントでログインしたときのみ、削除、修正ボタンが見えることを確認できます。

#### **(3) カテゴリで投稿検索 **
![image](https://github.com/user-attachments/assets/80809698-fc19-4d6a-9263-e64880add67f)
▲ カテゴリで投稿検索ができます。 上の画面でLifeカテゴリに該当する投稿だけがフィルタリングされていることが確認できます。

この機能はVue.jsで実装しようとしましたが、Trix editorのような他の要素との衝突によって発生するエラーを修正できませんでした。 それでRailsのサーバーサイド方式を利用して具現しました。

#### **(4) 投稿タイトル、ユーザー名による投稿検索 **
![image](https://github.com/user-attachments/assets/f9c38991-6098-412a-ae17-a913b08ee048)
![image](https://github.com/user-attachments/assets/146aa2e8-b159-436f-9f5d-80642279b704)
▲ 投稿のタイトルまたはユーザー名を入力して投稿を検索できます。検索語に1文字でも含まれている投稿がすべて表示され、希望する投稿をすばやく見つけることができます。

![검색게시물없음](https://github.com/user-attachments/assets/09ce40f3-30e5-43d5-bd1f-3cb81e62ea30)
▲ 検索語に関連する投稿が存在しない場合は、上記のようなメッセージが表示されます。

### **8. コメント(comments) **
![image](https://github.com/user-attachments/assets/2900085f-e2de-4fa0-a7e9-7b98143948aa)
▲ ログインした状態では投稿にコメントを残すことができます。

![로그인 안하고 댓글 쓰려고 하면](https://github.com/user-attachments/assets/eaf3b6f3-a804-4934-8286-2df58497037a)
▲ もしログインせずにコメントを残そうとしたら、上のような画面が表示されます。

![image](https://github.com/user-attachments/assets/d0d5d7e4-5349-4eba-b364-406d85ca6c07)
▲ 投稿と同様に、コメントの削除もコメントの作成者のみが行うことができます。


