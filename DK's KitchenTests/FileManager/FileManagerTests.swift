//
//  FileManagerTests.swift
//  DK's KitchenTests
//
//  Created by Deonte Kilgore on 10/24/22.
//

import XCTest
@testable import DK_s_Kitchen

final class FileManagerTests: XCTestCase {
    var url: URL?
    
    override func setUpWithError() throws {
        url = FileManager.documentDirectoryURL
    }

    override func tearDownWithError() throws {
        url = nil
    }

    func test_documentDirectory() {
        XCTAssertEqual(url, FileManager.documentDirectoryURL)
    }

}
