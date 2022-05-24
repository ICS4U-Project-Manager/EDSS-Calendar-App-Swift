//
//  ContentView.swift
//  Screens
//
//  Created by Kyle Stirbet on 2022-05-16.
//

import SwiftUI

struct HomeViewSwiftUI: View {
    @ObservedObject public var viewModel = SearchResultViewModel()
    var body: some View {
        VStack {
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
            

            Text("test")
                .fontWeight(.bold)
                .foregroundColor(Color("Dark green"))
                .font(.largeTitle)
                .background(Color("Off white"))
                .cornerRadius(25)
                .frame(width: 365, height: 175, alignment: .center)
                .position(x: 187, y: -80)
            
            Text("Clubs & Groups")
                .fontWeight(.black)
                .foregroundColor(Color("Off white"))
                .font(.title2)
                .position(x: 100, y: -60)
            

                Text("test2")
                .fontWeight(.bold)
                .foregroundColor(Color("Dark green"))
                .font(.largeTitle)
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
        .onAppear(){viewModel.fetchData()}
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

