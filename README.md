# SimpleHome

## About this application
This an e-commerce website which allows users to do checking and checkout to goods
## Contribution Guide
### Prerequiste

This project uses this stack :
  * elixir v1.11.2
  * phoenix v1.5.6
  * node v12.x
  * postgresql v12.x

**Guide on install are on these links below:**

- [installing elixir](https://elixir-lang.org/install.html)
- [installing phoenix](https://hexdocs.pm/phoenix/installation.html)
- [installing node](https://nodejs.org/en/download/)
- [installing postgresql](https://www.postgresql.org/download/)

*Kindly note you can use [asdf](https://github.com/asdf-vm/asdf) version manager for elixir and node*

### Contributing

Fork the this repo then clone from forked repo from your github account 

```git clone https://github.com/your_username/simple_home.git```  

or
```git clone git@github.com:your_username/simple_home.git```

To start your Phoenix server:

  * Change directory into the cloned repo: `cd simple_home`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Create a remote repo with name upstream, i.e

```bash
git remote add upstream https://github.com/okothkongo/simple_home.git
```

 or

```bash
git remote add upstream git@github.com:okothkongo/simple_home.git
```

Before working on an issue, ensure your local repo is up-to-date, by running:

```bash
git checkout develop
git pull upstream develop
```

When creating a branch, ensure it has an issue number.

For example, issue `#3 update contribution readme` should be in the branch name:

`3-update-contribution-readme`

Run

```mix check_lints```

and

```mix test```

Then solve any arising issues before pushing up.

Upon making changes push to the `upstream` remote 

```git push upstream branchname```

Your last commit message should be in the form `Update contribution readme fixes #3`

Then create a pull request if you feel the issue is completed.

## Rules and Regulations

  We follow these rules
[https://www.contributor-covenant.org/version/2/0/code_of_conduct/](https://www.contributor-covenant.org/version/2/0/code_of_conduct/)
## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
