///
//  ContentView.swift
//  ChemAware
//
//  Created by Jerry on 2021/10/27.
//

import SwiftUI
// global variables

public var compound_Name = "Phenoxyethanol"
public var ghs_classification = readGHS()
public var health_hazard = readHazard()

// read json file
func readJSONFile() -> Data? {
    do {
        if let filePath = Bundle.main.path(forResource: "data", ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            return data
        }
    } catch {
        print("error: \(error)")
    }
    return nil
}

// structure of the chemical compounds
struct chemical: Decodable {
    let cid: Int
    let ghs_classification: String
    let health_hazard: String
}

// similar to the data.json format
struct Compound: Decodable {
    let Phenoxyethanol: [chemical]
}

// passe json file
func parseJSON(jsonData: Data) -> Compound? {
    do {
        let decodedData = try JSONDecoder().decode(Compound.self, from: jsonData)
        return decodedData
    } catch {
        print("error: \(error)")
    }
    return nil
}
// read and return data to the user interface
func readGHS()-> String{
    let jsonData = readJSONFile()
    if let data = jsonData {
    if let exampleChemical = parseJSON(jsonData: data) {
        let ghs = exampleChemical.Phenoxyethanol.first?.ghs_classification ?? ""
        return ghs
        }
    }
    return ""
}
// read and return data to the user interface
func readHazard()-> String{
    let jsonData = readJSONFile()
    if let data = jsonData {
    if let exampleChemical = parseJSON(jsonData: data) {
        let health_hazard = exampleChemical.Phenoxyethanol.first?.health_hazard ?? ""
        return health_hazard
        }
    }
    return ""
}

// home screen
struct ContentView: View {
    @State private var isSecondViewOpen = false
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Text("Chem-Aware")
                    .font(.custom("Helvetica Neue", size: 24))
                    .padding()
                        .foregroundColor(Color.white)
                        .background(Color.init(red: 254/255, green: 44/255, blue: 85/255))
                        .cornerRadius(20)
                        .shadow(radius: 5, x: 1, y: 1)
                    .font(.title)
                    .frame(maxWidth: 300)
                    .padding()

                VStack(alignment: .center){
                    TextField("enter any chemical compound here"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(""))
                        .font(.custom("Helvetica Neue", size: 18))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)
                        .padding()
            
                    NavigationLink(destination: SecondView(), isActive: $isSecondViewOpen){
                        Button{
                            self.isSecondViewOpen = true
                        }
                    label: {
                        Text("Search")
                            .font(.custom("Helvetica Neue", size: 24))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 200)
                    }
                    .buttonStyle(.bordered)
                    .tint(.red)
                    }
                }
            }.frame(maxWidth: .infinity,  maxHeight: .infinity).background(
                Color.init(red: 173/255, green: 216/255, blue: 230/255)
                .ignoresSafeArea()
            )
            }
    }
    }
// result screen
struct SecondView: View {
    var body: some View {
       // NavigationView{
            VStack(alignment: .center){
                Text(compound_Name)
                    .font(.custom("Helvetica Neue", size: 30))
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: 250)
                    .padding()
                    .background(Color.orange)
                            .cornerRadius(20)
                            .shadow(radius: 5, x: 1, y: 1)
               // NavigationLink(destination: GHSView()){
                Text(ghs_classification)
                    .font(.custom("Helvetica Neue", size: 20))
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                               .frame(maxWidth: 300)
                               .padding()
                //}
                    Text(health_hazard)
                    .font(.custom("Helvetica Neue", size: 20))
                    .font(.body)
                    .frame(maxWidth: 350)
                    .truncationMode(.head)
            //    }
                    
                } .frame(maxWidth: .infinity,  maxHeight: .infinity).background(
                    Color.init(red: 173/255, green: 216/255, blue: 230/255)
                    .ignoresSafeArea()
                )
            }
        }

// GHS Explanation Screen
/*
struct GHSView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("GHS Classification")
                .font(.custom("Helvetica Neue", size: 30))
                   .font(.title)
                   .fontWeight(.medium)
                   .foregroundColor(.init(red: 79/255, green: 91/255, blue: 102/255))
                   .frame(maxWidth: 250)
                   .padding()
                           .background(Color(UIColor.secondarySystemBackground))
                           .cornerRadius(20)
                           .shadow(radius: 5, x: 1, y: 1)
             
               Text("GHS, the Globally Harmonized System of Classification and Labeling of Chemicals, was developed by the United Nations as a way to bring into agreement the chemical regulations and standards of different countries. GHS includes criteria for the classification of health, physical and environmental hazards, as well as specifying what information should be included on labels of hazardous chemicals as well as safety data sheets. This page summarizes the relationship of GHS hazard statements, pictograms, signal words, hazard classes, categories, and precautionary statements.")
                   .font(.custom("Helvetica Neue", size: 20))
                   .font(.headline)
                   .fontWeight(.bold)
                   .foregroundColor(Color.orange)
                   .multilineTextAlignment(.center)
                              .frame(maxWidth: 300)
                              .padding()
               
               Text(health_hazard)
                   .font(.custom("Helvetica Neue", size: 20))
                   .font(.body)
                   .frame(maxWidth: 400)
                          }
                   }
                       }
*/
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
