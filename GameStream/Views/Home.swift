//
//  Home.swift
//  GameStream
//
//  Created by David Baena Sierra on 4/08/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var selectedTag: Int = 2
    
    var body: some View {
        
        
        
        TabView(selection: $selectedTag){
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("perfil")
            }.tag(0)
            
            GamesView().tabItem {
                Image(systemName: "gamecontroller")
                Text("juegos")
                    .foregroundColor(Color.red)
            }.tag(1)
            
            HomePage().tabItem {
                Image(systemName: "house")
                Text("inicio")
            }.tag(2)
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "star")
                Text("favoritos")
            }.tag(3)
        }.accentColor(.white)

}
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabColor"))
        
        UITabBar.appearance().isTranslucent = true
        
        print("cargando vistas")
    }
    
    
}


struct HomePage: View {
    
    
    
    var body: some View{
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            VStack {
                
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11.0)
                
                
                
                ScrollView(showsIndicators: false){
                    SubModuleHome()}
                
                
                
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
    
    }

struct SubModuleHome: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    @State var findText = ""
    
    var body: some View{
        
        
        
        VStack {
            
            HStack {
                
                
//                Button(action: "", label: {
//                    Image(systemName:"magnifyingglass").foregroundColor(
//                            findText.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
//                })
                
                ZStack(alignment: .leading) {
                    
                    if findText.isEmpty {
                        
                        Text("Buscar un video").foregroundColor(Color( red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    
                    TextField("", text: $findText).foregroundColor(.white)
                    
                }

            }.padding([.top, .leading, .bottom], 11).background(Color(red: 36/255, green: 56/255, blue: 91/255, opacity: 1.0)).clipShape(Capsule())
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white).bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }, label: {
                    
                    VStack(spacing: 0){
                        
                        Image("The Witcher 3").resizable().scaledToFill()
                        
                        Text("The Witcher 3: Wild Hunt")
                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            .background(Color("Blue-Gray"))
                        
                        
                    }
                    
                })
                
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
                
            }.frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
                .padding(.vertical)
            
            
            Text("CATEGORIAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white).bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    Button(action: {}, label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                                
                            
                        }
                    })
                    
                    Button(action: {}, label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("RPG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                                
                            
                        }
                    })
                    
                    Button(action: {}, label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            Image("OpenWorld")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                                
                            
                        }
                    })
                }
            }
            
            
            Text("RECOMENDADOS  PARA TI")
                .font(.title3)
                .foregroundColor(.white).bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading).padding(12)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    Button(action: {
                        url = urlVideos[1]
                        isPlayerActive = true
                    }, label: {
                        Image("Abzu").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[1]
                        isPlayerActive = true
                    }, label: {
                        Image("Crash Bandicoot").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        url = urlVideos[1]
                        isPlayerActive = true
                    }, label: {
                        Image("DEATH STRANDING").resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    })
                    
                    
                }
            }
                
            
        }
        
        NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .frame(width: 400, height: 300),
                       isActive: $isPlayerActive,
                       label: {EmptyView()})
        
        
    }
    
//    func findVideo() {
//        print("estas buscando \(findText)")
//    }

}
    
    

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
