//
//  ContentView.swift
//  Screens
//
//  Created by Kyle Stirbet on 2022-05-16.
//

import SwiftUI

struct HomeViewSwiftUI: View {
    @ObservedObject private var viewModel = userViewModel()
    var body: some View {
        VStack {
            ForEach(viewModel.users) { user in
                
                Text("Today")
                    .fontWeight(.bold)
                    .position(x: 100, y: 15)
                    .font(.system(size: 70))
                    .foregroundColor(Color("Off white"))
                
                Rectangle()
                    .background(Color.red)
                    .frame(width: 350, height: 5)
                    .position(x: 187, y: -35)
                
                Text("Announcements")
                    .fontWeight(.black)
                    .foregroundColor(Color("Off white"))
                    .font(.title2)
                    .position(x: 100, y: -95)
                
                VStack{
                    Text(user.Title)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .font(.title)
                    Text(user.Lines)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .font(.title)
                }
                .background(
                    Image("Text Boxes")
                        .resizable()
                        .frame(width: 311, height: 136))
                .frame(width: 311, height: 136)
                .foregroundColor(Color("Dark green"))
                .position(x: 187, y: -100)
                .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                    .onEnded { value in
                        print(value.translation)
                        switch(value.translation.width, value.translation.height) {
                        case (-100...100, ...0):  print("up swipe"); viewModel.num += 1; print (viewModel.num); self.viewModel.fetchData()
                        case (-100...100, 0...):  print("down swipe"); viewModel.num -= 1; print (viewModel.num); self.viewModel.fetchData()
                        default:  print("no clue")
                        }
                    }
                )
                
                Text("Clubs & Groups")
                    .fontWeight(.black)
                    .foregroundColor(Color("Off white"))
                    .font(.title2)
                    .position(x: 100, y: -60)
                
                Text("nothing to see here")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .font(.title)
                    .background(
                        Image("Text Boxes")
                            .resizable()
                            .frame(width: 311, height: 136))
                    .frame(width: 311, height: 136)
                    .foregroundColor(Color("Dark green"))
                    .position(x: 187, y: -80)
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
                .position(x: 187, y:-15)
                
                
            }
        }
        .onAppear(){self.viewModel.fetchData()
            viewModel.num = 0
        }
        .background(Color("Dark green"))
    }
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
