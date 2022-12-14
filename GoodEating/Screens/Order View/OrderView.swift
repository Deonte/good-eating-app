//
//  OrderView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 9/18/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var viewModel: OrderViewModel

    var body: some View {
        NavigationView {
            if viewModel.items.isEmpty {
                EmptyStateView(emoji: "🧾",
                               text: "You haven't selected anything just yet. Check out the menu, you might find something you like.")
                    .navigationTitle("Order 🧾")
            } else {
                VStack {
                    VStack {
                        List {
                            ForEach(viewModel.items) { item in
                                MenuItemCell(menuItem: item)
                            }
                            .onDelete { indexSet in
                                viewModel.deleteItems(at: indexSet)
                            }
                        }
                        .listStyle(.plain)
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    Button {
                        viewModel.placeOrder()
                    } label: {
                        OrderButton(order: viewModel)
                    }
                }
                .navigationTitle("Order 🧾")
            }
        }
        .alert("Order Placed!", isPresented: $viewModel.isDisplayingAlert, actions: {
            Button("Close", role: .cancel) { }
        }, message: {
            Text("Order has been sent to the kitchen successfully!")
        })
        .background(
            Color(uiColor: .secondarySystemBackground)
            .ignoresSafeArea()
        )
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

struct OrderButton: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var order: OrderViewModel
    
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
