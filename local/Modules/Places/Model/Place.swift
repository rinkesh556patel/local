import Foundation

struct Place: Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var location: String
    var city: String
    var pinCode: String
}

struct Filter {
    var category: String
    var location: String?
}
