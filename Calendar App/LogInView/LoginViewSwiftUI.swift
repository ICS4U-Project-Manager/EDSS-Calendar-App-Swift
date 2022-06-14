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
                  .frame(width: 238, height: 50)
                  .background(Color("Clear"))
                  .onTapGesture {
                      AuthenticationViewModel().signIn()
                      type.showscreen()
            }
        }
          .background(Color("Clear"))
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
