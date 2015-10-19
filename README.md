# Alamofire - YamlSwift

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat
            )](http://mit-license.org) [![Platform](http://img.shields.io/badge/platform-ios_osx-lightgrey.svg?style=flat
             )](https://developer.apple.com/resources/) [![Language](http://img.shields.io/badge/language-swift-orange.svg?style=flat
             )](https://developer.apple.com/swift) [![Cocoapod](http://img.shields.io/cocoapods/v/Alamofire-YamlSwift.svg?style=flat)](http://cocoadocs.org/docsets/Alamofire-YamlSwift/)

[<img align="left" src="logo.png" hspace="20">](#logo)Allow to load remote [YAML](http://yaml.org) file.

It's built on top of [Alamofire](https://github.com/Alamofire/Alamofire) and [YamlSwift](https://github.com/behrang/YamlSwift)

# Usage #
Simply use `reponseYaml` method on your Alamofire `Request` to get an `Yaml` object on success

```swift
Alamofire.request(.GET, "https://example.com/myfile.yml").responseYaml {
	(response:Response<Yaml, NSError>) -> Void in
    ...

}
```

# Setup #

## Using [cocoapods](http://cocoapods.org/) ##

If not already done :
- Add `pod 'Alamofire'` to your `Podfile`.
- Add `pod 'YamlSwift'` to your `Podfile`.

Then :
- Add `pod 'Alamofire-YamlSwift'` to your `Podfile` and run `pod install`.

*Add `use_frameworks!` to the end of the `Podfile`.*

# Licence #
```
The MIT License (MIT)

Copyright (c) 2015 Eric Marchand (phimage)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```