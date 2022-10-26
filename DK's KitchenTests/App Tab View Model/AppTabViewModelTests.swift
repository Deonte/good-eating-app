//
//  AppTabViewModelTests.swift
//  DK's KitchenTests
//
//  Created by Deonte Kilgore on 10/24/22.
//

import XCTest
@testable import DK_s_Kitchen

final class AppTabViewModelTests: XCTestCase {

    var viewModel: AppTabViewModel!
    var menu: [MenuItem]!
    
    override func setUpWithError() throws {
      viewModel = AppTabViewModel()
        menu = []
    }

    override func tearDownWithError() throws {
        viewModel = nil
        menu = nil
    }
    
    func test_animateSplashScreen() {
        viewModel.animateSplashScreen()
        
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for n seconds")], timeout: 3.0)

        XCTAssertEqual(viewModel.animate, true)
        XCTAssertEqual(viewModel.showSplash, false)
        XCTAssertEqual(viewModel.animationEnded, true)
    }
    
    func test_downloadData() async {
        Task {
            await viewModel.downloadData()
        }
        
        await MainActor.run {
            menu = viewModel.menu
        }
        
        XCTAssertEqual(viewModel.menu.count, menu.count)
    }
    
}
