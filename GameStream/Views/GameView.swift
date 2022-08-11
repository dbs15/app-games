//
//  GameView.swift
//  GameStream
//
//  Created by David Baena Sierra on 8/08/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url: String
    var title: String
    var studio: String
    var qualification: String
    var pubYear: String
    var description: String
    var tags: [String]
    var imgsUrl: [String]
    
    var body: some View {

        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack {
                
                video(url: url).frame(height:300)
                
                ScrollView{
                    
                    videoInfo(url: url, title: title, studio: studio, qualification: qualification, pubYear: pubYear, description: description, tags: tags)
                    
                    gallery(imgsUrl : imgsUrl)
                    
                    comments()
                    
                    
                    
                    
                }.frame(maxWidth: .infinity)
                
                
            }
        }
    }
}

struct video:View {
    
    var url:String
    
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
}
}

struct videoInfo: View{
   
    var url: String
    var title: String
    var studio: String
    var qualification: String
    var pubYear: String
    var description: String
    var tags: [String]
    
    var body: some View{
        
        VStack(alignment:  .leading){
            
            Text("\(title)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(qualification)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(pubYear)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                
                
                
                    }
            
            Text("\(description)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
            
            HStack{
                
                ForEach(tags, id: \.self){
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 5)
                        .padding(.leading)
                }
                
            }
            
                
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct gallery: View {
    
    var imgsUrl: [String]
    
    let formGrid = [GridItem(.flexible())]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formGrid, spacing: 8){
                    
                    ForEach (imgsUrl, id:\.self){
                        imgUrl in
                        
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        
                    }
                }
                
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
}

struct comments: View{
    var body: some View{
        
        VStack(alignment: .leading) {
            
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .font(.title)
            .padding(.leading)
            
            VStack{
                
                HStack{
                    Image("foto-app")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80, alignment: .leading)
                    VStack{
                        Text("Antonella Henao").foregroundColor(.white).font(.subheadline).padding(.bottom)
                        Text("Hace 7 dias").foregroundColor(.white).font(.subheadline).padding(.bottom)
                        
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                    .foregroundColor(.white).font(.subheadline).padding([.top, .leading, .bottom, .trailing],8).frame(alignment: .leading)
                
                
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
            VStack{
                
                HStack{
                    Image("foto-app")
                        .resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80, alignment: .leading)
                    VStack{
                        Text("Antonella Henao").foregroundColor(.white).font(.subheadline).padding(.bottom)
                        Text("Hace 7 dias").foregroundColor(.white).font(.subheadline).padding(.bottom)
                        
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.top)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                    .foregroundColor(.white).font(.subheadline).padding([.top, .leading, .bottom, .trailing],8).frame(alignment: .leading)
                
                
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(
            url: "ejemplo",
            title:"Sonic The Hedgehog",
            studio: "Sega",
            qualification: "E+",
            pubYear: "1991",
            description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            tags:["plataformas","mascota"],
            imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
        ])
    }
}
