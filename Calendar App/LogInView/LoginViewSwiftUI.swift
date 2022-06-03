//
//  LoginViewSwiftUI.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-05-31.
//

import SwiftUI

struct LoginViewSwiftUI: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var isShowingDetailView = false
      var body: some View {

              GoogleSignInButton()
                  .padding()
                  .onTapGesture {
                      viewModel.signIn()
        }
    }
}


struct LoginViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewSwiftUI()
    }
}
