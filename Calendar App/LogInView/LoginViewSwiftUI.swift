//
//  LoginViewSwiftUI.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-05-31.
//

import SwiftUI

struct LoginViewSwiftUI: View {
    @State private var isShowingDetailView = false
    var type = SigninViewController()
      var body: some View {
          VStack{
              GoogleSignInButton()
                  .frame(width: 230, height: 50)
                  .background(Color("Dark purple"))
                  .padding()
                  .onTapGesture {
                      AuthenticationViewModel().signIn()
                      type.showscreen()
            }
        }
          .background(Color("Dark purple"))
          .onAppear(){
              type.showscreen()
          }
          
    }
}


struct LoginViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewSwiftUI()
    }
}
