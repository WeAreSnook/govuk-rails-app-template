# GOV UK Rails Application Template

> Get started quickly building GDS compliant Rails applications.

This Rails template follows the [Rails application conventions outlined by GDS](https://docs.publishing.service.gov.uk/manual/conventions-for-rails-applications.html).

It aims to provide a general starting point for teams inside and outside government building services.

This means certain features described in the GDS conventions are not included. Over time the template could evolve to include these but as configuration options or plugins.

## What does it not do (yet)?

### Authentication

- [gds-sso](https://github.com/alphagov/gds-sso) - It does not integrate with [signon](https://github.com/alphagov/signon).

### Sending emails

- [notify](https://github.com/dxw/mail-notify) - It does not integrate with [GOV.UK Notify](https://www.notifications.service.gov.uk/) for sending transactional emails. Not all applications need to send emails. For those that do, there is some admin involved and so this feels something that can be added later by the team.

### Publisher tools

Some of the guidance on using publisher may not be relevant to all projects.

- [govuk_publishing_components](https://github.com/alphagov/govuk_publishing_components) -
- [govuk_schemas](https://github.com/alphagov/govuk_schemas) - I've not come across this before so needs some more research.

### GDS Deployment

Not all projects that use this template will be deployed on Government infrastructure. Instead we provide a `Procfile` to host the application on Heroku. We also provide the `Procfile.dev` for running the application in a production like environment locally.

## What does it do?

### Application

- Creates a simple application layout using the [GDS Page template](https://design-system.service.gov.uk/styles/page-template/)

### Background jobs

- Installs [sidekiq](https://sidekiq.org/) for running background jobs with ActiveJob.
- Installs [sidekiq-scheduler](https://github.com/moove-it/sidekiq-scheduler) for scheduling background jobs
- Uses [govuk_sidekiq](https://github.com/alphagov/govuk_sidekiq) to include the GOV.UK Sidekiq configuration

### Documentation

- Creates a `docs` directory to store project documentation
- Creates a `docs/index.md` file with a minimal template for documentation
- Creates a `docs/adr` directory to log technical decisions using the [Architectural Decision Record format](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions) with a README and template.
- Creates up a sample `README.md` file and links back to your docs

### Linting

**Backend**

- Installs [rubocop](https://github.com/rubocop-hq/rubocop) using [rubocop-govuk](https://github.com/alphagov/rubocop-govuk) rules and configuration to lint and format ruby code.

**Frontend**

- Installs [scss-lint-govuk](https://github.com/alphagov/scss-lint-govuk) to lint SCSS files.

### Testing tools

**Backend**

- Installs [rspec-rails](https://github.com/rspec/rspec-rails) as the core test framework
- Installs [rspec-mocks](https://github.com/rspec/rspec-mocks) to support mocks and stubs in tests
- Installs [simplecov](https://github.com/colszowka/simplecov) to report test coverage
- Installs [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) for fixtures / test data
- Installs [webmock](https://github.com/bblimke/webmock) for mocking HTTP calls in tests for example to APIs
- Installs [climate_control](https://github.com/thoughtbot/climate_control) for modifying environment variables in tests
- Merges the `spec_helper.rb` and `rails_helper.rb` files into `spec_helper.rb` to [avoid having two configuration files](https://docs.publishing.service.gov.uk/manual/conventions-for-rails-applications.html#testing-utilities).

**Frontend**

- Installs [Jasmine for frontend testing](https://github.com/jasmine/jasmine-gem)
- Configures Jasmine to run Selenium tests with headless Chrome using [jasmine_selenium_runner](https://github.com/jasmine/jasmine_selenium_runner)

### Secrets and configuration

- Installs [dotenv] to support use of environment variables in development.
- Adds the `.env` file to `.gitignore` so it isn't accidentally checked into version control.
- Creates a `example.env` file to support sharing of example environment variables between developers.
- _Deviation_ - Explore use of encrypted `config/credentials.yml.enc` file for storing secrets.

### Frontend assets

- [govuk-frontend](https://github.com/alphagov/govuk-frontend) - Installs the GOV UK design system

## How to use it

### Prerequisites

You will need the following dependencies installed on your machine.

- [Postgres](https://www.postgresql.org/download/)
- [Redis](https://redis.io/download)
- [Rails 5+](https://guides.rubyonrails.org/getting_started.html)
- [Foreman](https://github.com/ddollar/foreman) or [Hivemind](https://github.com/DarthSim/hivemind) as your local Procfile based process manager

### Running it locally

1. `git clone https://github.com/WeAreSnook/govuk_rails_app_template.git` the repository to where you store your code.
2. Enter the `(Service name):`

## Contributing
