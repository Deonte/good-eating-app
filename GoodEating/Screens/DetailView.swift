//
//  DetailView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/10/22.
//

import SwiftUI

struct DetailView: View {
    let menuItem: MenuItem
    
    var body: some View {
        Text(menuItem.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(menuItem: MockMenu.data[0])
    }
}
