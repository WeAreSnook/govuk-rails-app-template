# GOV UK Rails Application Template

> Get started quickly building GDS compliant Rails applications.

This Rails template follows the (Rails application conventions outlined by GDS](https://docs.publishing.service.gov.uk/manual/conventions-for-rails-applications.html). It aims to provide a general starting point to build government services.

This means that certain features described in the GDS conventions are not included. Over time this could evolve to include these but as configuration options or plugins. These are listed below:

## What does it not do (yet)?

## What does it do?

### Application

- []

### Documentation

- Creates a `docs` directory to store project documentation
- Creates a `docs/adr` directory to store technical decisions using the [Architectural Decision Record format](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)

### Linting

- [rubocop-govuk](https://github.com/alphagov/rubocop-govuk) - To lint and format ruby code
- []

### Testing tools

**Backend**

- [rspec-rails](https://github.com/rspec/rspec-rails) - Core test framework
- [rspec-mocks](https://github.com/rspec/rspec-mocks) - For handling mocks and stubs in tests
- [simplecov](https://github.com/colszowka/simplecov) - For reporting test coverage
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) - For fixtures / test data
- [webmock](https://github.com/bblimke/webmock) - For mocking HTTP calls for example to APIs

**Frontend**

- [Jasmine for frontend testing](https://github.com/jasmine/jasmine-gem) - configured to run tests in Selenium with headless Chrome

### Secrets

### Configuration

## How to use it

### From Github

You can create a copy of this

### Running it locally

1. `git clone https://github.com/WeAreSnook/govuk_rails_app_template.git` the repository to where you store your code.
2.

## Contributing
