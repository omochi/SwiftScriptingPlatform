//
//  ScriptService.swift
//  SwiftScriptingPlatform
//
//  Created by omochimetaru on 2017/03/26.
//
//

import Foundation

public typealias ScriptServiceMainBlock = ( (String, Script.Type) -> Void ) -> Void

public class ScriptService {
    public init() {
        self.originalArgs = CommandLine.arguments
        
        let dispatcher = ScriptDispatcher()
        self.dispatcher = dispatcher
        dispatcher.service = self
    }
    
    public let originalArgs: [String]
    
    public let dispatcher: ScriptDispatcher
    
    public func main(block: ScriptServiceMainBlock) throws {
        block { (scriptName, scriptFactory) in
            dispatcher.scripts[scriptName] = scriptFactory
        }
        try dispatcher.main()
    }
    
    public static func main(block: ScriptServiceMainBlock) throws {
        try ScriptService().main(block: block)
    }
}
