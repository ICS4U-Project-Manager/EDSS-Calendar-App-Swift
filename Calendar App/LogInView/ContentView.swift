//
//  ContentView.swift
//  Ellifit
//
//  Created by Rudrank Riyam on 02/05/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  
  var body: some View {
      Text("test")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
