//
//  ContentView.swift
//  Screens
//
//  Created by Kyle Stirbet on 2022-05-16.
//

import SwiftUI

struct HomeViewSwiftUI: View {
    @ObservedObject private var viewModel = userViewModel()
    var num2 = 0
    var body: some View {
        VStack {
            ForEach(viewModel.users) { user in
                
                Text("Today")
                    .fontWeight(.bold)
                    .position(x: 110, y: 50)
                    .font(.system(size: 70))
                    .foregroundColor(Color("Off white"))
                
                Rectangle()
                    .frame(width: 350, height: 5)
                    .foregroundColor(Color("Off white"))
                    .position(x: 187, y: 7)
                
                Text("Announcements")
                    .fontWeight(.black)
                    .font(.system(size: 20))
                    .foregroundColor(Color("Off white"))
                    .font(.title2)
                    .position(x: 115, y: -60)
                
                ScrollView {
                    VStack{
                        ForEach(0..<100) {_ in
                            Text("")
                            
                            Text(user.Title)
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .font(.title)
                            
                            Text(user.Lines)
                                .fontWeight(.light)
                                .font(.system(size: 12))
                                .font(.body)
                                .frame(width: 300)

 
                            
                            }
                        }
                    }
                    .background(
                        Image("Text Boxes")
                            .resizable()
                            .frame(width: 311, height: 136))
                    .frame(width: 311, height: 136)
                    .foregroundColor(Color("Dark green"))
                    .position(x: 187, y: -60)
                    
                    Text("Clubs & Groups")
                        .fontWeight(.black)
                        .font(.system(size: 20))
                        .foregroundColor(Color("Off white"))
                        .font(.title2)
                        .position(x: 115, y: -60)
                    
                    
                    VStack{
                        Text("user.Title")
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .font(.title)
                        Text("user.Lines")
                            .fontWeight(.light)
                            .font(.system(size: 12))
                            .font(.body)
                            .frame(width: 300)
                    }
                    .background(
                        Image("Text Boxes")
                            .resizable()
                            .frame(width: 311, height: 136))
                    .frame(width: 311, height: 136)
                    .foregroundColor(Color("Dark green"))
                    .position(x: 180, y: -60)
                    .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                        .onEnded { value in
                            print(value.translation)
                            switch(value.translation.width, value.translation.height) {
                            case (-100...100, ...0):  print("up swipe")
                            case (-100...100, 0...):  print("down swipe")
                            default:  print("no clue")
                            }
                        }
                    )
                    
                    Link("🔗EDSS Instagram",
                         destination: URL(string: "https://www.instagram.com/elmira_lancers/")!)
                    .frame(width: 250, height: 25)
                    .background(Color("Off white"))
                    .cornerRadius(20)
                    .foregroundColor(Color("Dark green"))
                    .position(x: 187, y: -40)
                    
                }
            }
            .onAppear(){self.viewModel.fetchData()
                viewModel.num = 0
            }
            .background(Color("Dark green"))
        }

    struct HomeViewSwiftUI_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                HomeViewSwiftUI()
                    .previewDevice("iPhone SE (3rd generation)")
                    .previewInterfaceOrientation(.portrait)
            }
        }
    }
}
