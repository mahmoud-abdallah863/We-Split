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
    @State var checkAmout: String = ""
    @State var numberOfPeople: String = ""
    @State var tipPercentIndex: Int = 1
    
    let tipPercentages = [0, 10, 15, 20, 25, 30, 35]
    
    var amountPerPerson: Double {
        // Converting string to double will return optional Double?
        let orderAmount = Double(checkAmout) ?? -1
        let peopleCount = Double(numberOfPeople) ?? -1
        let tipPercentage = Double(tipPercentages[tipPercentIndex])
         
        if orderAmount == -1 || peopleCount == -1 {
            return 0
        }
        
        return (orderAmount + orderAmount*tipPercentage/100) / peopleCount
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                
                // Adding a header to a section require a Text view, cannot be a string
                Section(header: Text("Check details")) {
                    // 2-Way data binding
                    // We need to tell textField where to get the data from,
                    // and we also need to change the name variable when the textField change
                    // it's value
                    TextField("Check Amout", text: $checkAmout)
                        .keyboardType(.numberPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                }
                
                Section(header: Text("How much tip you want to learve?")) {
                    Picker("Tip percent", selection: $tipPercentIndex) {
                        ForEach(0 ..< self.tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                        // Changing the style of the picker
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(self.amountPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Details")) {
                    Text("Original amount: $\((checkAmout.isEmpty) ? "0" : checkAmout)")
                    
                    let tipAmount: Double = (Double(checkAmout) ?? 0) * Double(tipPercentages[tipPercentIndex]) / 100
                    Text("Tip amount: $\(tipAmount, specifier: "%.2f")")
                }
            }
            
//             displayMode: .inline -> Will decrease the text size and center it horizontaly
            .navigationBarTitle("We Split", displayMode: .large)
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
