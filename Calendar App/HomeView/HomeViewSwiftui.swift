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
                    .font(.system(size: 60))
                    .font(.title)
                    .foregroundColor(Color("Off white"))
                
                
                Rectangle()
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
                Text(user.Title)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .font(.title)
                }
                    .frame(width: 365, height: 175)
                    .background(Color("Off white"))
                    .cornerRadius(25)
                    .foregroundColor(Color("Dark green"))
                    .position(x: 187, y: -80)
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
                
                
                Text("Come Back Some Time Else. Nothing Yet.")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Dark green"))
                    .font(.largeTitle)
                    .frame(alignment: .center)
                    .background(Color("Off white"))
                    .cornerRadius(25)
                    .frame(width: 365, height: 175, alignment: .center)
                    .position(x: 187, y: -45)
                
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

