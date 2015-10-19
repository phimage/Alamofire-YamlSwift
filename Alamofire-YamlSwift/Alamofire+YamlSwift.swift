//
//  Alamofire+YamlSwift.swift
//  Alamofire-YamlSwift
/*
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
*/
import Foundation

import YamlSwift
import Alamofire

extension Request {
    public static func YamlResponseSerializer() -> ResponseSerializer<Yaml, NSError> {
        return ResponseSerializer { request, response, data, error in
            guard error == nil else { return .Failure(error!) }
            
            guard let validData = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }
            
            guard let string = String(data: validData, encoding: NSUTF8StringEncoding) else {
                let failureReason = "Data could not be deserialized. Input data was not convertible to String."
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }
            
            let result: YamlSwift.Result<Yaml> = Yaml.load(string)
            switch result {
            case .Error(let failureReason):
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            case .Value:
                return .Success(result.value!)
            }
        }
    }

    public func responseYaml(completionHandler: Response<Yaml, NSError> -> Void) -> Self {
        return response(responseSerializer: Request.YamlResponseSerializer(), completionHandler: completionHandler)
    }
}