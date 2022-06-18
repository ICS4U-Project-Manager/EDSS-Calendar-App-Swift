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
                  .onTapGesture {
                      AuthenticationViewModel().signIn()
                      type.showscreen()
                      
            }
        }
          .background(Color("Clear"))
          .onAppear(){
              AuthenticationViewModel().signOut()
              type.showscreen()
          }
          
    }
}


struct LoginViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewSwiftUI()
    }
}
