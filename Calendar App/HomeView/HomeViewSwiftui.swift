//
//  ContentView.swift
//  Screens
//
//  Created by Kyle Stirbet on 2022-05-16.
//

import SwiftUI

struct HomeViewSwiftUI: View {
    var body: some View {
        VStack{
            Text("Welcome!")
                .position(x: 200, y: 25)
                .font(.system(size: 30))
                .font(.title)
                .foregroundColor(Color.black)
            
            ScrollView {
                VStack(alignment: .center, spacing: 5) {
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Title()
                            
                        }
                    )
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Center()
                            
                        }
                    )
                    
                }
            }
            
            .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: 250)
            .position(x: 200, y: 250)
            
            ScrollView {
                VStack(alignment: .center, spacing: 5) {
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Title()
                            
                        }
                    )
                    
                    
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Center()
                            
                        }
                    )
                    
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Title()
                            
                        }
                    )
                    
                    
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Center()
                            
                        }
                    )
                    
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Title()
                            
                        }
                    )
                    
                    
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Center()
                            
                        }
                    )
                }
            }
                    .frame(width: 200.0, height: 250)
                    .position(x: 200, y: -250)
                    
        }
    }
}
    
    struct Center: View {
        var body: some View {
            Text("Test Test Test Test Test Test v Tesb jg ugvh g h giy fy cyt ty 6ty f7tvt f7tgiv 7tvygvtvtvyvtv t7v7tvv tvygvgvygvugvgvgvgvgvgt Test Test Test Test Test Test Test Test Test Test Test Test Test bhjvhbgcvh gvh gvh ugvj gjb f h yf  kgh kygvjg gv j")
                .foregroundColor(.black)
                .font(.title2)
                .frame(width: 350, height: 150, alignment: .top)
        }
    }
    
    struct Title: View {
        var body: some View {
            Text("Test")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .font(.largeTitle)
                .frame(width: 350, height: 150, alignment: .leading)
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

