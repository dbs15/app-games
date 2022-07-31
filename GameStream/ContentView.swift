//
//  ContentView.swift
//  GameStream
//
//  Created by David on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 17/255, green: 28/255, blue: 52/255, opacity: 1.0).ignoresSafeArea()
            
            VStack{
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                HomeAndResgister()
                
            }
        }
    }
}

struct HomeAndResgister: View {
    var body: some View{
        
        VStack {
            
            HStack {
                Text("INICIA SESIÓN")
                Text("REGISTRATE")
            }.foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla1").resizable()
        ContentView()
    }
}
