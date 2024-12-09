import SwiftUI

struct AddPlaceView: View {
    @ObservedObject var viewModel: LocalViewModel
    @State private var name = ""
    @State private var category = ""
    @State private var location = ""
    @State private var city = ""
    @State private var pinCode = ""

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Category", text: $category)
            TextField("Location", text: $location)
            TextField("City", text: $city)
            TextField("Pin Code", text: $pinCode)
            Button("Add Place") {
                let newPlace = Place(name: name, category: category, location: location, city: city, pinCode: pinCode)
                viewModel.addPlace(newPlace: newPlace)
            }
        }
        .navigationTitle("Add Place")
    }
}
