//
//  Log.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 28.05.2022.
//

import Foundation

class Log {
    private struct Context {
        enum LogLevel: String {
            case debug = "🟦[INFO]"
            case warning = "🟨[WARN]"
            case error = "🟥[ALERT]"
        }

        let type: LogLevel
        let time: String
        let data: String
        let file: String
        let line: Int
        let function: String

        var result: String {
            "\(type.rawValue)\(time)[\(file):\(line)][\(function)] |> \(data) <|"
        }
    }

    private static let formatter = DateFormatter()
    private static var logTime: String {
        formatter.dateFormat = "HH:mm:ss"
        return "[\(formatter.string(from: Date()))]"
    }

    private init() {}

    static func d(
        _ data: @autoclosure () -> Any?,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) {
        let context = Context(
            type: .debug,
            time: logTime,
            data: String(describing: data() ?? "-"),
            file: extractFileName(from: file),
            line: line,
            function: function
        )
        print(context.result)
    }

    static func w(
        _ data: @autoclosure () -> Any?,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) {
        let context = Context(
            type: .warning,
            time: logTime,
            data: String(describing: data() ?? "-"),
            file: extractFileName(from: file),
            line: line,
            function: function
        )
        print(context.result)
    }

    static func e(
        _ data: @autoclosure () -> Any?,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) {
        let context = Context(
            type: .error,
            time: logTime,
            data: String(describing: data() ?? "-"),
            file: extractFileName(from: file),
            line: line,
            function: function
        )
        print(context.result)
    }

    private static func extractFileName(from path: String) -> String {
        path.components(separatedBy: "/").last ?? "[No file path]"
    }
}
