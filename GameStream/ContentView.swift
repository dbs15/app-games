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
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                
                HomeAndResgisterView()
                
            }
        }
    }
}

struct HomeAndResgisterView: View {
    
    @State var loginType = true
    
    var body: some View{
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Button("INICIA SESIÓN") {
                    loginType = true
                    print("inicio de sesion")
                }
                .foregroundColor(loginType ? .white : .gray)
                
                Spacer()
                
                Button("REGISTRATE") {
                    loginType = false
                    print("REGISTRATE")
                }
                .foregroundColor(loginType ? .gray : .white)
                
                Spacer()
                
                
            }
            
            Spacer(minLength: 42)
            
            if loginType == true {
                LoginView()
            }else{
                RegisterView()
            }
        }
    }
}

struct LoginView:View {
    
    
    var body: some View{
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo Electrónico").foregroundColor(Color("Dark-Cian"))
            }.padding(.horizontal, 77.0)
        }
    }
}

struct RegisterView:View {
    var body: some View{
        Text("soy la vista de registro")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla1").resizable()
        ContentView()
    }
}
