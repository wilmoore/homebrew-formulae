# Homebrew Formulae
> [brew tap][] by [@wilmoore][].

## Usage

Packages in located in the [./Formula][] directory can be installed via canonical formula path:

    brew install --verbose wilmoore/formulae/claude-code

or, add the `wilmoore/formulae` tap:

    brew tap wilmoore/formulae

then, install packages contained in the tap:

    brew install aws-iam-authenticator
    brew install claude-code
    brew install php-version

## Contributing

Submit pull requests against the respective repos:

* [php-version](https://github.com/wilmoore/php-version)
* [aws-iam-authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator)


[./Formula]: https://github.com/wilmoore/homebrew-formulae/tree/master/Formula
[@wilmoore]: https://github.com/wilmoore
[brew tap]: https://github.com/Homebrew/brew/blob/master/docs/Taps.md