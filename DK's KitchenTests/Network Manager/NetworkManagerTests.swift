//
//  NetworkManagerTests.swift
//  DK's KitchenTests
//
//  Created by Deonte Kilgore on 10/24/22.
//

import XCTest
@testable import DK_s_Kitchen

final class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager!
    var menu = [MenuItem]()
    
    override func setUpWithError() throws {
        networkManager = NetworkManager()
    }

    override func tearDownWithError() throws {
        networkManager = nil
    }

    func test_downloadMenu() async {
        do {
            try await networkManager.downloadMenu()
            await MainActor.run {
                menu = networkManager.menu
            }
        } catch {
            XCTFail()
        }
        
        XCTAssertEqual(networkManager.menu.count, menu.count)
    }
    
    func test_downloadMenuAndSaveToJSON() async {
        let jsonManager = MenuJSONStore.shared
        
        do {
            try await networkManager.downloadMenuAndSaveToJSON()
            await MainActor.run {
                menu = jsonManager.readData()
            }
        }  catch {
            XCTFail()
        }
        
        XCTAssertEqual(jsonManager.readData().count, menu.count)
    }
    
    func test_downloadMenuAndSaveToPlist() async {
        let plistManager = MenuPlistStore.shared
        
        do {
            try await networkManager.downloadMenuAndSavePlist()
            await MainActor.run {
                menu = plistManager.readData()
            }
        }  catch {
            XCTFail()
        }
        
        XCTAssertEqual(plistManager.readData().count, menu.count)
    }
}
