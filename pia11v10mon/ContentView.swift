//
//  ContentView.swift
//  pia11v10mon
//
//  Created by Bill Martensson on 2022-11-14.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstname = "Torsten"
    
    @State var number = 0.0
    
    @State var starttime = Date()
    
    @State var mytimer : Timer?
    
    @AppStorage("username") var username = ""
    
    var body: some View {
        VStack {
            Image("frog")
                .resizable()
                .frame(width: 100, height: 100)
            Text("hello")
            Text("welcome \(firstname)")
            
            Text("Antal: \(number)")
                .font(.title)
            
            Button(action: {
                starttimer()
            }) {
                Text("Start")
            }
            
            
            TextField("Namn", text: $username)

            
        }
        .padding()
        .onAppear() {
            
        }
    }
    
    func starttimer() {
        if(mytimer != nil)
        {
            mytimer!.invalidate()
        }
        
        starttime = Date()
        
        mytimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            //number = number + 0.1
            let timepassed = Date().timeIntervalSince(starttime)
            
            number = timepassed
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.locale, .init(identifier: "en"))
    }
}

// Skriver ny kod som inte funkar så bra
