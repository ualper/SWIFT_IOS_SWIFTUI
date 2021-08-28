//
//  ContentView.swift
//  convertApp
//
//  Created by Umut Ay Alper on 28.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var Fvalue : String = ""
    
    let numFormatter : NumberFormatter = {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 2
        return numFormatter
    }()
    
    func convertFtoC() -> String {
        
        if let value = Double(Fvalue) {
            let F = Measurement <UnitTemperature>(value: value, unit: .fahrenheit)
            let C = F.converted(to: .celsius)
            return numFormatter.string(from: NSNumber(value: C.value)) ?? "???"
        
        } else { return "???" }
    }
    
    // ================================================================
     
    var body: some View {
        VStack{
            TextField("value", text: $Fvalue)
                .font(.system(size: 70))
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            Text("F").font(.system(size: 50)) .foregroundColor(.red)
            Text(self.Fvalue.isEmpty ? "???" :  convertFtoC()).font(.system(size: 70))
            Text("C").font(.system(size: 50)) .foregroundColor(.red)
            Spacer()
        }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
