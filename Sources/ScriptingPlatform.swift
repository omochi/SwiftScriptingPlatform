//
//  ScriptingPlatform.swift
//  SwiftScriptingPlatform
//
//  Created by omochimetaru on 2017/03/26.
//
//

public func ScriptingPlatform(block: ( (String, Script) -> Void ) -> Void) throws {
    let dispatcher = ScriptDispatcher()
    block { (name, script) in
        dispatcher.scripts[name] = script
    }
    try dispatcher.main()
}
