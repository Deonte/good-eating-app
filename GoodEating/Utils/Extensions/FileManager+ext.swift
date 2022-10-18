//
//  FileManager+ext.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/17/22.
//

import Foundation

extension FileManager {
    static var documentDirectoryURL: URL {
        Self.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
