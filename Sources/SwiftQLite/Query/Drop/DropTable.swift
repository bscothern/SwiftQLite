//
//  DropTable.swift
//  SwiftQLite
//
//  Created by Braden Scothern on 1/30/20.
//  Copyright © 2020 Braden Scothern. All rights reserved.
//

#if os(Linux)
import SwiftQLiteLinux
#else
import SQLite3
#endif

public struct DropTable: Statement {
    @inlinable
    public var _statement: String { base._statement }

    @usableFromInline
    let base: DropStatementBase

    @inlinable
    public init(name: TableName, ifExists: Bool = true) {
        base = .init(.table, name: name, schemaName: nil, ifExists: ifExists)
    }

    @inlinable
    public init(name: TableName, schemaName: SchemaName, ifExists: Bool = true) {
        base = .init(.table, name: name, schemaName: schemaName, ifExists: ifExists)
    }
}