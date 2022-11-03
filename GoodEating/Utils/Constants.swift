//
//  Constants.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 8/21/22.
//

import SwiftUI

enum Constants {
    enum SFSymbol {
        public static let sheet = "newspaper.circle.fill"
        public static let menu = "menucard"
        public static let star = "star.circle.fill"
        public static let creditCard = "creditcard"
        public static let user = "person.circle.fill"
        public static let heart = "heart.fill"
    }
    
    enum ScreenSize {
        static let width = UIScreen.main.bounds.size.width
        static let height = UIScreen.main.bounds.size.height
        static let maxLength = max(ScreenSize.width, ScreenSize.height)
        static let minLength = min(ScreenSize.width, ScreenSize.height)
    }

}
