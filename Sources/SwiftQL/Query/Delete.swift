//
//  Delete.swift
//  SwiftQL
//
//  Created by Braden Scothern on 1/30/20.
//  Copyright © 2020 Braden Scothern. All rights reserved.
//

#if os(Linux)
import SwiftQLLinux
#else
import SQLite3
#endif

public struct Delete: Statement {
    @inlinable
    public var _statement: String {
        let with = self.with.map { "\($0) " } ?? ""
        let tableName = self.tableName
        let `where` = self.where.map { " WHERE \($0)" } ?? ""
        return "\(with)DELETE FROM \(tableName)\(`where`)"
    }

    @usableFromInline
    let with: With?
    
    @usableFromInline
    let tableName: String
    
    @usableFromInline
    let `where`: Expression?
    
    @inlinable
    public init(tableName: String, with: With? = nil, where whereExpression: Expression? = nil) {
        self.tableName = tableName
        self.with = with
        self.where = whereExpression
    }
    
    // TODO: How to support: Optional LIMIT and ORDER BY clauses ?
}
