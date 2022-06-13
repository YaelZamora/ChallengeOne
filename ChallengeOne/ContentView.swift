//
//  ContentView.swift
//  ChallengeOne
//
//  Created by iOS UNAM 18 on 09/06/22.
//

import SwiftUI

struct ContentView: View {
    
    let grados = ["Celsius-Fahrenheit", "Fahrenheit-Celsius", "Celsius-Kelvin", "Kelvin-Celsius", "Fahrenheit-Kelvin", "Kelvin-Fahrenheit"]
    @State private var gradoSeleccionado = "Celsius-Fahrenheit"
    @State private var gradosVar = 0.0
    @FocusState private var gradosIsFocused: Bool
    
    var resultadoCF: Double{
        let gradoPrevio = gradosVar * 1.8
        let gradoFinal = gradoPrevio + 32
        return gradoFinal
    }
    
    var resultadoFC: Double{
        let gradoPrevio = gradosVar - 32
        let gradoFinal = gradoPrevio * 0.55
        return gradoFinal
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Grados", value: $gradosVar, format: .number).keyboardType(.decimalPad).focused($gradosIsFocused)
                    Picker("Selecciona la convesión", selection: $gradoSeleccionado) {
                        ForEach(grados, id: \.self){
                            Text($0)
                        }
                    }
                    Text(resultadoCF, format: .number)
                } header: {
                    Text("Conversión de grados")
                }
            }
        }
        .navigationTitle("ChallengeOne")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
