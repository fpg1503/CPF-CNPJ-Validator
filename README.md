# CPF-CNPJ-Validator

[![CI Status](http://img.shields.io/travis/fpg1503/CPF-CNPJ-Validator.svg?style=flat)](https://travis-ci.org/fpg1503/CPF-CNPJ-Validator)
[![Version](https://img.shields.io/cocoapods/v/CPF-CNPJ-Validator.svg?style=flat)](https://cocoapods.org/pods/CPF-CNPJ-Validator)
[![License](https://img.shields.io/cocoapods/l/CPF-CNPJ-Validator.svg?style=flat)](https://cocoapods.org/pods/CPF-CNPJ-Validator)
[![Platform](https://img.shields.io/cocoapods/p/CPF-CNPJ-Validator.svg?style=flat)](https://cocoapods.org/pods/CPF-CNPJ-Validator)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A Swift library to validate CPF and CNPJ. Automatically strips formatting, covers valid numbers, wrong length, number sequences, and common fake numbers. Options can be passed to allow invalid number sequences, that's useful for testing.

## Usage

You can use two types of validators: `StatusValidator` (if you're interested in what's wrong) and `BooleanValidator` (if you only care if a given number is valid or not).

### `BooleanValidator`

```swift
let success = BooleanValidator().validate(cpf: "12345678909")
```

### `StatusValidator`

```swift
let cpf = "1234567890912345678909"
let status = validator.validate(cpf: cpf)
//Status is .wrongLength
```

### Validation Options

You can also pass options to the validate method. The options available are:

- Add Leading Zeros
- Ignore Remaining Characters
- Interpret Only Numbers
- Allow Repeated Patterns
- Allow Common Numbers

By default no options are given

### Validation Statuses

The possible validation statuses are:

- Valid
- Wrong Length (i.e. `111`)
- Repeated Pattern (i.e. `111.111.111-11`)
- Common Number (i.e. `123.456.789-09`)
- Invalid (invalid verification digits)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

For Swift 4.0+ use v1.0

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CPF-CNPJ-Validator into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'CPF-CNPJ-Validator'
```

Then, run the following command:

```bash
$ pod install
```


### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate CPF-CNPJ-Validator into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "fpg1503/CPF-CNPJ-Validator" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `CPF-CNPJ-Validator.framework` into your Xcode project.


## Author

Francesco Perrotti-Garcia ([@fpg1503](https://github.com/fpg1503))

### Contributing

All contributions are welcome. Feel free to open Issues and PRs. In case of doubts read our [CONTRIBUTING.md](https://github.com/fpg1503/CPF-CNPJ-Validator/blob/master/CONTRIBUTING.md), open an issue or tweet me [@fpg1503](https://twitter.com/fpg1503).

## License

CPF-CNPJ-Validator is available under the MIT license. See the LICENSE file for more info.
