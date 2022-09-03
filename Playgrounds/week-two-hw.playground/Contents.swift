import Foundation

// MARK: Assignment 1 & 3
struct Order {
    var appetizer: Appetizer? = nil
    var meal: Meal
    var dessert: Dessert? = nil
    var drink: Drink
    
    func getTotal() -> Double {
        let appetizerPrice = (appetizer != nil) ? appetizer!.price : 0
        let dessertPrice = (dessert != nil) ? dessert!.price : 0

        return round((meal.price + drink.price + appetizerPrice + dessertPrice) * 100) / 100
    }
}

struct Appetizer {
    var name: String
    var price: Double
}

struct Meal {
    var entree: Entree
    var side: Side
    var price: Double {
        entree.price + side.price
    }
}

struct Entree {
    var name: String
    var price: Double
}

struct Side {
    var name: String
    var price: Double
}

struct Drink {
    var name: String
    var price: Double
}

struct Dessert {
    var name: String
    var price: Double
}

// MARK: Assignment 2
var kitchenOrders: [Order] = []

// MARK: Menu Items
let appetizers: [Appetizer] = [
    Appetizer(name: "Steakhouse Wings", price: 9.99),
    Appetizer(name: "Chicken Bites", price: 6.49),
    Appetizer(name: "Spicy Fried Shrimp", price: 11.79),
    Appetizer(name: "Fried Pickles", price: 9.99)
]

let drinks: [Drink] = [
    Drink(name: "Coke", price: 3.29),
    Drink(name: "Sprite", price: 3.29),
    Drink(name: "Sweet Tea", price: 3.29),
    Drink(name: "Lemonade", price: 3.79),
    Drink(name: "Strawberry Lemonade", price: 3.89),
    Drink(name: "Water", price: 0.00)
]

let desserts: [Dessert] = [
    Dessert(name: "Triple Chocolate Cake", price: 8.29),
    Dessert(name: "Strawberry Cheese Cake", price: 9.29),
    Dessert(name: "Fried Oreo's", price: 6.99),
    Dessert(name: "Strawberry Short Cake", price: 7.29),
    Dessert(name: "Molten Lava Cake", price: 9.99),
    Dessert(name: "Cookies & Ice Cream", price: 4.99)
]

let entrees: [Entree] = [
    Entree(name: "Ribeye", price: 28.99),
    Entree(name: "Sirloin", price: 21.99),
    Entree(name: "T-Bone", price: 26.99),
    Entree(name: "New York Strip", price: 22.99),
    Entree(name: "Filet", price: 23.99),
    Entree(name: "28 oz. Ribeye", price: 37.99)
]

let sides: [Side] = [
    Side(name: "Baked Potato", price: 0.00),
    Side(name: "Brocoli", price: 0.00),
    Side(name: "Seasoned Fries", price: 0.00),
    Side(name: "Seasoned Rice", price: 0.00),
    Side(name: "Mac & Cheese", price: 2.79),
    Side(name: "Baked Sweet Potato", price: 2.79),
]

// MARK: Assignment 4
var tableOneOrders: [Order] = [
    Order(appetizer: nil,
          meal: Meal(entree: entrees[1], side: sides[0]),
          dessert: desserts[1],
          drink: drinks[1]),
    
    Order(appetizer: appetizers[3],
          meal: Meal(entree: entrees[1], side: sides[0]),
          dessert: desserts[1],
          drink: drinks[1]),
    
    Order(appetizer: appetizers[2],
          meal: Meal(entree: entrees[1], side: sides[0]),
          dessert: desserts[1],
          drink: drinks[1]),
    
    Order(appetizer: appetizers[0],
          meal: Meal(entree: entrees[1], side: sides[0]),
          dessert: desserts[1],
          drink: drinks[1]),
    
    Order(appetizer: nil,
          meal: Meal(entree: entrees[3], side: sides[3]),
          dessert: nil,
          drink: drinks[2]),
    
    Order(appetizer: appetizers[3],
          meal: Meal(entree: entrees[5], side: sides[1]),
          dessert: desserts[3],
          drink: drinks[4]),
]

// MARK: Assignment 5
let myOrder = Order(appetizer: appetizers[0],
                     meal: Meal(entree: entrees[0], side: sides[0]),
                     dessert: desserts[0],
                     drink: drinks[0])

func take(order: Order) {
    tableOneOrders.append(order)
}

take(order: myOrder)

func sendTableOrdersToKitchen(_ orders: [Order]) {
    for order in orders {
        kitchenOrders.append(order)
    }
}

sendTableOrdersToKitchen(tableOneOrders)

// MARK: Assignment 6
func printAllOrders(_ orders: [Order]) {
    for order in orders {
        print("Appetizer: \(order.appetizer?.name ?? "No Appetizer")\nDrink: \(order.drink.name)\nEntree: \(order.meal.entree.name)\nSide: \(order.meal.side.name)\nDessert: \(order.dessert?.name ?? "No Dessert")\n\nTotal: $\(order.getTotal())")
        print("---------------------------")
    }
}

printAllOrders(kitchenOrders)

