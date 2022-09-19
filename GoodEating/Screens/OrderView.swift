//
//  OrderView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            if order.items.isEmpty {
                EmptyStateView(emoji: "🧾", text: "You haven't selected anything just yet. Check out the menu, you might find something you like.")
                    .navigationTitle("Order 🧾")
            } else {
                VStack {
                    VStack {
                        List {
                            ForEach($order.items) { item in
                                MenuItemCell(menuItem: item)
                            }
                            .onDelete { indexSet in
                                order.deleteItems(at: indexSet)
                            }
                        }
                        .listStyle(.plain)
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    Button {
                        print("order placed")
                    } label: {
                        OrderButton()
                    }
                }
                .navigationTitle("Order 🧾")
            }
        }
        .background(
            Color(uiColor: .secondarySystemBackground)
            .ignoresSafeArea()
        )
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}

struct OrderButton: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var order: Order
    
    var body: some View {
        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
            .frame(width: Constants.ScreenSize.width - 24, height: 50)
            .font(.headline)
            .foregroundColor(colorScheme == .light ? Color.white : Color.black)
            .background(Color.accentColor)
            .cornerRadius(10)
            .padding(.bottom)
    }
}
