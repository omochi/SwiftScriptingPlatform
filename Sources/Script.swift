//
//  Script.swift
//  SwiftScriptingPlatform
//
//  Created by omochimetaru on 2017/03/26.
//
//

public protocol Script {
    init(service: ScriptService)
    static var name: String { get }
    func main(args: [String]) throws
}
