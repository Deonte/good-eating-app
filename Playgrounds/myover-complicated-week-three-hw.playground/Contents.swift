import Foundation

// MARK: Assignment 7
enum DiscountType: Double, CaseIterable {
    case defaultDiscount = 0.05
    case thanksGiving = 0.10
    case christmas = 0.15
    case newYears = 0.20
    
    func printDiscount() {
        print("\(self.rawValue * 100)% discount for \(self)" )
    }
}

DiscountType.christmas.printDiscount()

protocol MenuItem {
    func getPrice() -> Double
}

typealias CalculateDiscount = (Double, DiscountType) -> Double

struct Order {
    var appetizer: MenuItem? = nil
    var meal: MenuItem
    var dessert: MenuItem? = nil
    var drink: MenuItem

    func getTotal() -> Double {
        let appetizerPrice = (appetizer != nil) ? appetizer!.getPrice() : 0
        let dessertPrice = (dessert != nil) ? dessert!.getPrice(): 0

        return round((meal.getPrice() + drink.getPrice() + appetizerPrice + dessertPrice) * 100) / 100
    }

    // MARK: Assignment 1 & 2
    func applyDiscount(for totalAmount: Double, discountPercentage: DiscountType = DiscountType.defaultDiscount) -> Double {
        return totalAmount - (totalAmount * discountPercentage.rawValue).rounded()
    }

    // MARK: Assignment 3
    func printDiscount(_ calculateDiscount: CalculateDiscount, _ total: Double, discountType: DiscountType) {
        let result = calculateDiscount(total, discountType)
        print("Your new total after the discount is $\(result).")
    }
}

struct Appetizer: MenuItem {
    var name: String
    var price: Double
    
    func getPrice() -> Double {
        price
    }
}

struct Meal: MenuItem {
    var entree: MenuItem
    var side: MenuItem
    var price: Double {
        entree.getPrice() + side.getPrice()
    }
    
    func getPrice() -> Double {
        price
    }
}

struct Entree: MenuItem {
    var name: String
    var price: Double
    
    func getPrice() -> Double {
        price
    }
}

struct Side: MenuItem {
    var name: String
    var price: Double
    
    func getPrice() -> Double {
        price
    }
}

struct Drink: MenuItem {
    var name: String
    var price: Double
    
    func getPrice() -> Double {
        price
    }
}

struct Dessert: MenuItem {
    var name: String
    var price: Double
    
    func getPrice() -> Double {
        price
    }
}


// MARK: Menu Items & Prices
let appetizers: [MenuItem] = [
    Appetizer(name: "Steakhouse Wings", price: 9.99),
    Appetizer(name: "Chicken Bites", price: 6.49),
    Appetizer(name: "Spicy Fried Shrimp", price: 11.79),
    Appetizer(name: "Fried Pickles", price: 9.99)
]

let drinks: [MenuItem] = [
    Drink(name: "Coke", price: 3.29),
    Drink(name: "Sprite", price: 3.29),
    Drink(name: "Sweet Tea", price: 3.29),
    Drink(name: "Lemonade", price: 3.79),
    Drink(name: "Strawberry Lemonade", price: 3.89),
    Drink(name: "Water", price: 0.00)
]

let desserts: [MenuItem] = [
    Dessert(name: "Triple Chocolate Cake", price: 8.29),
    Dessert(name: "Strawberry Cheese Cake", price: 9.29),
    Dessert(name: "Fried Oreo's", price: 6.99),
    Dessert(name: "Strawberry Short Cake", price: 7.29),
    Dessert(name: "Molten Lava Cake", price: 9.99),
    Dessert(name: "Cookies & Ice Cream", price: 4.99)
]

let entrees: [MenuItem] = [
    Entree(name: "Ribeye", price: 28.99),
    Entree(name: "Sirloin", price: 21.99),
    Entree(name: "T-Bone", price: 26.99),
    Entree(name: "New York Strip", price: 22.99),
    Entree(name: "Filet", price: 23.99),
    Entree(name: "28 oz. Ribeye", price: 37.99)
]

let sides: [MenuItem] = [
    Side(name: "Baked Potato", price: 0.00),
    Side(name: "Brocoli", price: 0.00),
    Side(name: "Seasoned Fries", price: 0.00),
    Side(name: "Seasoned Rice", price: 0.00),
    Side(name: "Mac & Cheese", price: 2.79),
    Side(name: "Baked Sweet Potato", price: 2.79),
]


let myOrder = Order(appetizer: appetizers[0],
                     meal: Meal(entree: entrees[0], side: sides[0]),
                     dessert: desserts[0],
                     drink: drinks[0])


//MARK: Assignment 4
let calculateChristmasDiscount: CalculateDiscount = {
    $0 - ($0 * $1.rawValue)
}
print("Your new total after discount: $\(String(format: "%.2f", calculateChristmasDiscount(myOrder.getTotal(), .christmas)))")



// MARK: Assignment 5 & 6
let allMenuItems = [appetizers, sides, drinks, entrees, desserts].flatMap { menuItems -> [MenuItem] in
    return menuItems
}

print(allMenuItems.count)

let incresedPricesBy50 = allMenuItems.map { menuItem in
    round((menuItem.getPrice() + (menuItem.getPrice()) * 0.5) * 100) / 100.0
}.sorted(by: >)


