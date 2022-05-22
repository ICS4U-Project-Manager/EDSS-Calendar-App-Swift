//
//  ContentView.swift
//  Screens
//
//  Created by Kyle Stirbet on 2022-05-16.
//

import SwiftUI

struct HomeViewSwiftUI: View {
    @ObservedObject public var viewModel = Announcements()
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
            ScrollView {
                VStack(alignment: .center, spacing: 5) {
                    if Announcements().Nothing == false {
                        NavigationLink(
                            destination: HomeViewSwiftUI(),
                            label: {
                                Title()
                                
                            }
                        )
                    }
                    else if Announcements().Nothing == true {
                        Text("Come Back Some Time Else. Nothing Yet.")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Dark green"))
                            .font(.largeTitle)
                            .frame(alignment: .center)
                    }
                    
                }
            }
            .background(Color("Off white"))
            .cornerRadius(25)
            .frame(width: 365, height: 175, alignment: .center)
            .position(x: 187, y: -80)
            
            Text("Clubs & Groups")
                .fontWeight(.black)
                .foregroundColor(Color("Off white"))
                .font(.title2)
                .position(x: 100, y: -60)
            
            
            ScrollView {
                VStack(alignment: .center, spacing: 5) {
                    if Announcements().Nothing == false {
                        NavigationLink(
                            destination: HomeViewSwiftUI(),
                            label: {
                                Title()
                                
                            }
                        )
                    }
                    else{
                        Text("Come Back Some Time Else. Nothing Yet.")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Dark green"))
                            .font(.largeTitle)
                            .frame(alignment: .center)
                    }
                }
            }
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
        .onAppear(){self.viewModel.fetchAnnouncements()}
        .background(Color("Dark green"))
    }
}




struct Center: View {
    @ObservedObject public var viewModel = Announcements()
    var body: some View {
        VStack {
            List(viewModel.books) { book in
                Text(book.body!)
                    .foregroundColor(Color("Dark green"))
                    .font(.title2)
                    .frame(alignment: .top)
            }
            Spacer()
            Spacer()
            
            Rectangle()
                .frame(width: 350, height: 5)
            
            Spacer()
        }
    }
}

struct Title: View {
    @ObservedObject public var viewModel = Announcements()
    var body: some View {
        List(viewModel.books) { book in
            Text(book.Title!)
                .fontWeight(.bold)
                .foregroundColor(Color("Dark green"))
                .font(.largeTitle)
                .frame(alignment: .center)
        }
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

