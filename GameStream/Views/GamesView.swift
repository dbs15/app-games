//
//  GamesView.swift
//  GameStream
//
//  Created by David Baena Sierra on 5/08/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var qualification: String = ""
    @State var pubYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let gridForm = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    
    
    var body: some View {
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    
                    LazyVGrid(columns: gridForm, spacing: 8){
                        
                        
                        ForEach(allVideoGames.gamesInfo, id: \.self){
                            
                            game in
                            
                            Button(action: {
                                
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                qualification = game.contentRaiting
                                pubYear = game.publicationYear
                                description = game.description
                                tags = game.tags
                                imgsUrl = game.galleryImages
                                
                                
                                
                                print("titulo \(title)")
                                
                                gameViewIsActive = true

                                
                            }, label: {
                                
                                KFImage(URL(string: game.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                    .padding(.bottom,12)
                                
                            })
                            
                        }
                    }
                    
                }
                
                
            }.padding(.horizontal, 6)
            
            
            
            
            NavigationLink(isActive: $gameViewIsActive) {
                GameView(url: url, title: title, studio: studio, qualification: qualification, pubYear: pubYear, description: description, tags: tags, imgsUrl: imgsUrl)
            } label: {
                EmptyView()
            }
            
            

            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(
                
                perform: {
                    print("Primer elemento del json es \(allVideoGames.gamesInfo[0])")
                    
                    print("Primer juego del json es \(allVideoGames.gamesInfo[0].title)")
                }
                
            )
    }
}


struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
