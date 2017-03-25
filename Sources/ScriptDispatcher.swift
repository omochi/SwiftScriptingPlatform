//
//  ScriptDispatcher.swift
//  SwiftScriptingPlatform
//
//  Created by omochimetaru on 2017/03/26.
//
//

import Darwin

public enum ScriptDispatchError : Error {
    case notSpecified
    case invalidScript(name: String)
}

public class ScriptDispatcher {
    public func main() throws {
        let args = CommandLine.arguments
        
        guard args.count >= 2 else {
            throw ScriptDispatchError.notSpecified
        }
        
        let name = args[1]
        
        guard let script = scripts[name] else {
            throw ScriptDispatchError.invalidScript(name: name)
        }
        
        do {
            try script.main(args: Array(args[2..<args.count]))
        } catch let e as ScriptError {
            exit(e.statusCode)
        } catch let e {
            throw e
        }
        
        exit(EXIT_SUCCESS)
    }
    
    public var scripts: [String: Script] = [:]
}
