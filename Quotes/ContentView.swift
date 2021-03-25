//
//  ContentView.swift
//  Quotes
//
//  Created by Jae Cho on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    
    var quotes:[Quote]
    /*
    var quotes: [Quote] = [
        Quote(quote: "Carpe diem", name: "Jae Cho"),
        Quote(quote: "Smartest person", name: "Olivia Cho"),
        Quote(quote: "Don't worry be happy", name: "James Brown"),
        Quote(quote: "Carpe diem", name: "Jae Cho"),
        Quote(quote: "Carpe diem", name: "Jae Cho")
    ]
    */
    var body: some View {
        VStack{
            CircleImage(imageName: "lilly")
                .frame(width:160, height:160)
                .padding(.top, 20)
                .padding(.bottom, 20)
            MainView(quotes: quotes)
            Spacer()
        }
        .background(Image("motivation_bg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))

    }
}

struct MainView:View{
    
    
    var quotes:[Quote]
    
    var body: some View{
        VStack{
            HStack{
                Text("Quotes Available \(quotes.count)")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.orange)
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.quotes, id: \.name){ quote in
                        VStack{
                            CircleImage(imageName: "lilly")
                            Text(#" "\#(quote.quote) " "#)
                                .font(.headline)
                            Divider()
                            
                            Text("By - James Bond")
                                .italic()
                                .font(.custom("helvetica neue", size: 14))
                        }
                        .frame(width:300, height:300)
                        .padding(.all,4)
                        .background(Color.white)
                        .cornerRadius(13)
                        .overlay(Rectangle()
                                    .fill(
                                        LinearGradient(gradient: Gradient(
                                                        colors: [.clear,.pink]),
                                                        startPoint: .center,
                                                        endPoint: .topLeading)))

                    }
                }
            }
        }
    }
}

struct CircleImage: View{
    var imageName : String
    var body: some View{
            Image(imageName)
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(radius: 10)
                .frame(width:60, height: 60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quotes: quoteData)
    }
}
