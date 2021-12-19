# GhCompare

Generate GitHub compare url like [this](https://github.com/kenzo-tanaka/gh_compare/compare/cca247f41b4117248abe200c71ea97ab02f442d0...dacbc27a288f727e3f3995afe201c191ac923924).

## Installation

Add this line to your application's Gemfile:

```shell
gem install gh_compare
```

## Usage

```shell
gh_compare -n [number]

# e.g. Generates a comparison URL from 3 commits ago to HEAD
gh_compare -n 3
```

```shell
gh_compare -d [from-hash],[to-hash]

# e.g. Generate a comparison URL from [from-hash] to [to-hash]
gh_compare -d c794e7718ef18011b9d96f812f62f31608deeca8,45c38cac44e96ee2545f1e70dba80b23058309bf
```

## Development

```shell
bundle install
bundle exec rspec
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GhCompare project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/gh_compare/blob/master/CODE_OF_CONDUCT.md).
