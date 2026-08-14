# Blog with Rails

This repository contains a blog application built with **Ruby on Rails**.

The basic structure of this project was developed based on the following tutorial:

https://medium.com/jungletronics/a-rails-blog-in-vs-code-quick-start-5c3173191a64

## Development Environment

This project was developed using the following environment and technologies:

* **OS**: Ubuntu 20.04
* **IDE**: Visual Studio Code
* **Backend**: Ruby on Rails (Server-Side Rendering)
* **Frontend**: ERB (Embedded Ruby), Bootstrap (CSS)
* **Deployment Platform**: Railway
* **Authentication**: Devise (login, user registration, and password reset)
* **File Uploads**: Active Storage

## Ruby and Rails Versions

* **Ruby**: 3.2.2
* **Rails**: 7.2.2.1

## System Dependencies

* **Database**: SQLite3 (development and test) / PostgreSQL (production on Railway)
* **Web Server**: Puma

## Setup

This project uses `rbenv` to manage and apply a specific Ruby version in the local environment.

When running Rails commands, use `bundle exec`.

### 1. Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/augustinus2000/my-blog.git
cd my-blog
```

### 2. Set the Ruby Version

This project uses `rbenv` to specify the required Ruby version.

```bash
rbenv local 3.2.2
```

Verify that the correct Ruby version is being used:

```bash
ruby -v
```

Example output:

```text
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]
```

### 3. Set Up Bundler

This project uses `Bundler` to manage RubyGem dependencies.

#### (1) Install Bundler

First, check whether Bundler is installed. If it is not installed, run:

```bash
gem install bundler
```

You can check the installed Bundler version with:

```bash
bundle -v
```

#### (2) Create a Gemfile

If a `Gemfile` does not exist, create one with:

```bash
bundle init
```

Then open the `Gemfile` and add or modify the Rails dependency as follows:

```ruby
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
```

#### (3) Install Rails and Dependencies

Install the dependencies specified in the `Gemfile`:

```bash
bundle install
```

Running `bundle install` will install the specified Rails version and create a `Gemfile.lock`.

#### (4) Verify the Rails Installation

To verify that Rails has been installed correctly, run:

```bash
bundle exec rails -v
```

Example output:

```text
Rails 7.2.2.1
```

### 4. Set Up the Database

The project already contains the database-related files under the `db/` directory.

Depending on your environment, you may need to apply the existing migrations:

```bash
bundle exec rails db:migrate
```

Optionally, if you want to load initial seed data:

```bash
bundle exec rails db:seed
```

If there are no new migration files under `db/migrate/`, running the migration command will not make any changes.

### 5. Run Tests

This project includes the standard Rails testing framework.

Run the tests with:

```bash
bundle exec rails test
```

### 6. Deploy with Railway

This project can be deployed using Railway.

#### (1) Install the Railway CLI

Install the Railway CLI:

```bash
npm install -g @railway/cli
```

#### (2) Log In to Railway

```bash
railway login
```

#### (3) Deploy the Application

Run:

```bash
railway up
```

Additional environment variables may need to be configured depending on your Railway environment.

After the deployment is successfully completed, click the **Live URL** to access the deployed application.

![railway deployment](https://github.com/user-attachments/assets/16f2577b-468d-4036-9e12-5ab1057c8944)

**▲ Click the highlighted section to access the deployed website.**

![deployment URL](https://github.com/user-attachments/assets/1ac59fa6-32a1-47ef-ae7d-b94a0617f88f)

**▲ The deployed application URL will be displayed in a format such as `https://myapp.railway.app`.**

### 7. Start the Rails Server

To start the Rails server in the development environment, run:

```bash
bundle exec rails server
```

Then open the following URL in your browser:

```text
http://localhost:3000
```

---

## Application Features

### 1. Home Page

![Home page](https://github.com/user-attachments/assets/2d68a7d9-00e2-471f-92e7-8136eb90d404)

**▲ The home page of the blog application.**

### 2. About Page

![About page](https://github.com/user-attachments/assets/a61da36b-c6f7-457e-9a8c-175cf8128c34)

**▲ The About page provides a brief introduction about me.**

### 3. User Registration

![Sign Up](https://github.com/user-attachments/assets/fb544781-4f1b-419a-a355-0a9b37be4c83)

**▲ Click the `Sign Up` button in the upper-right corner to open the registration page. Users can create an account by entering their name, email address, and password.**

### 4. Login

![Login](https://github.com/user-attachments/assets/84a0ddad-11bb-4941-911f-7a951867ba2a)

**▲ Registered users can log in by clicking the `Login` button.**

![Home page after login](https://github.com/user-attachments/assets/77f64416-4ad9-4f3e-9603-f83a302796ce)

**▲ After logging in, the user's name is displayed in the upper-right corner of the home page.**

### 5. User Dropdown Menu

Click the **arrow next to the username** in the upper-right corner to open the user menu.

![User dropdown menu](https://github.com/user-attachments/assets/3461a5d1-2c45-46b0-884e-2d97b5246453)

The dropdown menu provides the following options:

1. **Create a new post** (`New Post`)
2. **Edit account information** (`Edit Account`)
3. **Log out** (`Sign Out`)

### 6. Edit Account

![Edit Account](https://github.com/user-attachments/assets/c103a5c2-74eb-4095-a523-a8a24369c3bc)

**▲ Clicking `Edit Account` from the dropdown menu opens the account settings page. Users can update their name and password or delete their account.**

### 7. Posts

Click the `Posts` button in the upper-left corner of the home page to view posts published on the blog.

![Posts](https://github.com/user-attachments/assets/ce097807-53ff-4773-95e8-7164bc8e29ab)

#### (1) Creating a New Post

Only logged-in users can create new posts.

Select `New Post` from the user dropdown menu to open the post creation page.

![New Post](https://github.com/user-attachments/assets/6618d634-de75-4704-a5ff-558ce62fe99e)

**▲ Users can enter a title and content, upload images, and assign a category to the post.**

#### (2) Editing and Deleting Posts

![Edit Post](https://github.com/user-attachments/assets/f500949d-28e6-420b-9a0d-06f08b2f98b7)

![Post permissions](https://github.com/user-attachments/assets/786788a7-7819-49f5-8761-c4b3d50d4b33)

**▲ Posts can only be edited or deleted by their original author. The edit and delete buttons are displayed only when the author of the post is logged in.**

#### (3) Filtering Posts by Category

![Category filtering](https://github.com/user-attachments/assets/80809698-fc19-4d6a-9263-e64880add67f)

**▲ Posts can be filtered by category. In the example above, only posts belonging to the `Life` category are displayed.**

I initially attempted to implement this feature using **Vue.js**. However, I encountered compatibility issues with other components, such as the Trix editor, and was unable to resolve the resulting errors.

Therefore, I implemented the category filtering feature using the **Rails server-side rendering approach** instead.

#### (4) Searching Posts by Title or Username

![Search by title](https://github.com/user-attachments/assets/f9c38991-6098-412a-ae17-a913b08ee048)

![Search by username](https://github.com/user-attachments/assets/146aa2e8-b159-436f-9f5d-80642279b704)

**▲ Posts can be searched by entering either a post title or username. All posts containing the entered search term are displayed, making it easier to quickly find relevant posts.**

![No search results](https://github.com/user-attachments/assets/09ce40f3-30e5-43d5-bd1f-3cb81e62ea30)

**▲ If no posts match the search term, a message indicating that no results were found is displayed.**

### 8. Comments

![Comments](https://github.com/user-attachments/assets/2900085f-e2de-4fa0-a7e9-7b98143948aa)

**▲ Logged-in users can leave comments on posts.**

![Login required for comments](https://github.com/user-attachments/assets/eaf3b6f3-a804-4934-8286-2df58497037a)

**▲ If a user attempts to leave a comment without being logged in, the login page is displayed.**

![Delete comment](https://github.com/user-attachments/assets/d0d5d7e4-5349-4eba-b364-406d85ca6c07)

**▲ Like posts, comments can only be deleted by the user who created them.**

### 9. Responsive Design / Mobile Support

The application is designed to work on mobile devices as well as desktop environments.

![Mobile view 1](https://github.com/user-attachments/assets/80fea349-1293-4776-9f8c-f4d47d0effaa)

![Mobile view 2](https://github.com/user-attachments/assets/44e730e4-b26b-44a7-bbc6-2cff44a40397)

![Mobile view 3](https://github.com/user-attachments/assets/69ef8107-2b10-485c-a61b-2c7d7ecdf61d)

![Mobile view 4](https://github.com/user-attachments/assets/3d434f71-a3fc-4315-a644-3faa8cc38952)

![Mobile view 5](https://github.com/user-attachments/assets/88864a6e-d935-4baa-8ee3-7892be975a3e)

![Mobile view 6](https://github.com/user-attachments/assets/a017cdc2-af54-418a-bdd1-981665216e31)

![Mobile view 7](https://github.com/user-attachments/assets/5fea5e7a-2f5c-4823-bad2-3e999bcb2d2f)
