import SwiftUI

struct PlacesView: View {
    @StateObject private var viewModel = LocalViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // City and PinCode Selector
                HStack {
                    TextField("Enter City", text: $viewModel.selectedCity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("Enter PinCode", text: $viewModel.selectedPinCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }

                // Category Filter
                Picker("Category", selection: $viewModel.selectedFilters.category) {
                    Text("All").tag("")
                    Text("Cafe").tag("Cafe")
                    Text("Mexican").tag("Mexican")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Filtered Places List
                List(viewModel.filteredPlaces) { place in
                    VStack(alignment: .leading) {
                        Text(place.name).font(.headline)
                        Text(place.category).font(.subheadline)
                        Text(place.location).font(.caption)
                    }
                }
                .onAppear {
                    viewModel.applyFilters()
                }

                // Navigation to Add Place
                NavigationLink("Add Place") {
                    AddPlaceView(viewModel: viewModel)
                }
                .padding()
            }
            .navigationTitle("Local")
        }
    }
}
