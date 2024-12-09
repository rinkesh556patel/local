import Foundation

class LocalViewModel: ObservableObject {
    @Published var places: [Place] = []
    @Published var filteredPlaces: [Place] = []
    @Published var selectedCity: String = ""
    @Published var selectedPinCode: String = ""
    @Published var selectedFilters: Filter = Filter(category: "")

    init() {
        loadInitialData()
    }

    func loadInitialData() {
        places = [
            Place(name: "Cafe Mocha", category: "Cafe", location: "Downtown", city: "New York", pinCode: "10001"),
            Place(name: "Taco Haven", category: "Mexican", location: "Uptown", city: "New York", pinCode: "10002")
            // Add more initial places
        ]
    }

    func applyFilters() {
        filteredPlaces = places.filter { place in
            (selectedCity.isEmpty || place.city == selectedCity) &&
            (selectedPinCode.isEmpty || place.pinCode == selectedPinCode) &&
            (selectedFilters.category.isEmpty || place.category == selectedFilters.category)
        }
    }

    func addPlace(newPlace: Place) {
        places.append(newPlace)
        applyFilters()
    }
}
