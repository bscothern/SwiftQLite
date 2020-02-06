//
//  Column.swift
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

/// https://www.sqlite.org/syntax/column-def.html
public struct Column: Substatement {
    @usableFromInline
    let name: String
    
    @usableFromInline
    let type: DataType?
    
    @usableFromInline
    let constraints: [ColumnConstraintSubstatement]

    @inlinable
    public var substatement: String { "" }

    @usableFromInline
    init(name: String, type: DataType?, constraints: [ColumnConstraintSubstatement]) {
        self.name = name
        self.type = type
        self.constraints = constraints
    }

    @inlinable
    public init(name: String, type: DataType, @PassThroughBuilder<ColumnConstraintSubstatement> constraints constraintsBuilder: () -> [ColumnConstraintSubstatement]) {
        //swiftlint:disable:previous attributes
        self.init(name: name, type: type, constraints: constraintsBuilder())
    }
}
