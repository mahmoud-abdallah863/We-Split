//
//  ContentView.swift
//  WeSplit
//
//  Created by Mahmoud Abdallah on 5/15/21.
//

import SwiftUI


struct ContentView: View {
    // If not marked as state, we can't changed it's value when the button is clicked
    // because the variable is in struct, and variables in struct cannot be changed (immutable)
    // even if we mark them as mutable
    @State var tapCount = 0
    @State var name = ""
    
    
    let countries = ["Lebanon", "Palestine", "Syria", "Egypt", "Jordan"]
    @State var selectetedCountry: String = "Lebanon"
    
    var body: some View {
        
        NavigationView {
            Form {
                // Adding a header to a section require a Text view, cannot be a string
                Section(header: Text("Form")) {
                    // 2-Way data binding
                    // We need to tel textField where to get the data from,
                    // and we also need to change the name variable when the textField change
                    // it's value
                    TextField("Enter you name", text: $name)
                    
                    // When name variable change, it will change here
                    Text("username: @\(name)")
                    
                    Button("Tap count \(tapCount)") {
                        self.tapCount += 1
                    }
                }
                
                
                Section(header: Text("Country")) {
                    Picker("Select your country", selection: $selectetedCountry) {
                        ForEach(0 ..< self.countries.count) {
                            Text(self.countries[$0])
                        }
                    }
                }
                
                
                // This is how to create a foreach loop in swift ui, and create views in it
                Section(header: Text("Looping over views")) {
                    ForEach(1 ..< 100) {
                        Text("Title no. \($0)")
                    }
                }
            }
            
//             displayMode: .inline -> Will decrease the text size and center it horizontaly
            .navigationBarTitle("Swift UI", displayMode: .large)
            // Or
//             .navigationBarTitle(Text("Swift UI"), displayMode: .inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
