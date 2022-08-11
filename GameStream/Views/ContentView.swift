//
//  ContentView.swift
//  GameStream
//
//  Created by David on 30/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color(red: 17/255, green: 28/255, blue: 52/255, opacity: 1.0).ignoresSafeArea()
                
                VStack{
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    
                    HomeAndResgisterView()
                    
                }
            }.navigationBarHidden(true)
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
    
    @State var correo = ""
    @State var contrasena = ""
    @State var isHomeActive = false
    
    var body: some View{
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo Electrónico").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty {
                    Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty {
                    Text("escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contrasena)
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom)
                
                
                Button(action: login) {
                    Text("INICIAR SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 2.0).shadow(color: .white, radius: 4))
                }
                
                
                Text("Inicia sesión con redes sociales").foregroundColor(.gray).frame(maxWidth: .infinity , alignment: .center).padding(.top, 40)
                
                HStack{
                    Button(action: facebookLogin) {
                        Text("Facebook").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0).frame(maxWidth: .infinity,alignment: .center).background(Color(red: 35/255, green: 47/255, blue: 80/255)).clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                    
                    Button(action: twitterLogin) {
                        Text("Twitter").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0).frame(maxWidth: .infinity,alignment: .center).background(Color(red: 35/255, green: 47/255, blue: 80/255)).clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                }.padding()
                
                
                

                
            }.padding(.horizontal, 77.0)
            
            NavigationLink(destination: Home(), isActive: $isHomeActive) {
                EmptyView()
            }
        }
    }
    
    func login(){
        print("iniciando sesión")
        isHomeActive = true
    }
}



func facebookLogin(){
    print("iniciando sesión")
}

func twitterLogin(){
    print("iniciando sesión")
}

struct RegisterView:View {
    
    @State var correo = ""
    @State var contrasena = ""
    var body: some View{
        
        
        ScrollView {
            
            VStack(alignment: .center){
                VStack{
                    Text("Elige una foto de perfil")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Puedes cambiar o elegirla más adelante")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    
                    Button(action: tomarFoto) {
                        ZStack{
                            Image("foto-app").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    }.padding()
                }
                
            }
            
            
            
            VStack {
                
            VStack(alignment: .leading){
                Text("Correo Electrónico*").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty {
                    Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty {
                    Text("escribe tu contraseña*").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contrasena)
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                Text("Confirmar Contraseña*").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty {
                    Text("confirma tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contrasena)
                    
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                
                
                
            }.frame(width: 300)
                
                Button(action: register) {
                    Text("REGÍSTRATE").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"),lineWidth: 2.0).shadow(color: .white, radius: 4))
                }
                
                
                Text("Inicia sesión con redes sociales").foregroundColor(.gray).frame(maxWidth: .infinity , alignment: .center).padding(.top, 40)
                
                HStack{
                    Button(action: facebookLogin) {
                        Text("Facebook").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0).frame(maxWidth: .infinity,alignment: .center).background(Color(red: 35/255, green: 47/255, blue: 80/255)).clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                    
                    Button(action: twitterLogin) {
                        Text("Twitter").font(.subheadline).fontWeight(.bold).foregroundColor(.white).padding(.vertical, 3.0).frame(maxWidth: .infinity,alignment: .center).background(Color(red: 35/255, green: 47/255, blue: 80/255)).clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                }.padding()
                
                
                

                
            }.padding(.horizontal, 77.0)
             
        }
    }
}

func tomarFoto() {
    print("tomando la foto")
}

func register() {
    print("registrando")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla2").resizable()
        ContentView()
    }
}
