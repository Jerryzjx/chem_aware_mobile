//
//  ContentView.swift
//  ChemAware
//
//  Created by Jerry on 2021/10/27.
//

import SwiftUI
// Get main screen bounds

struct ContentView: View {
    @State private var isShowingResultView = false
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Text("Chem-Aware")
                    .navigationTitle("Home")
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                HStack {
                    Text("Please enter any chemical compound you would like to search below")
                        .font(.body)
                        .multilineTextAlignment(.center)
                }
                
                VStack(alignment: .leading){
                    TextField("Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(""))
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: SecondView(), isActive: $isShowingResultView){
                        Button{
                            SecondView()
                            self.isShowingResultView = true
                        }
                    label: {
                        Text("Search")
                            .frame(maxWidth: 400)
                    }
                    .buttonStyle(.bordered)
                    .tint(.teal)
                    }
                }
            }
        }
    }
}

    struct SecondView: View {
               var body: some View {
                   VStack(alignment: .leading){
                       Text("Compound Name: ")
                           .font(.title)
                           .foregroundColor(.black)
                           .frame(maxWidth: 400)
                       HStack {
                           Text("GHS Classification: ")
                               .font(.body)
                               .multilineTextAlignment(.leading)
                               .frame(maxWidth: 400)
                               }
                           Text("Health Hazard: ")
                               .font(.body)
                               .multilineTextAlignment(.leading)
                               .frame(maxWidth: 400)
                           }
                   }
               }
       


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

