//
//  AuthenticationViewModel.swift
//  Ellifit
//
//  Created by Rudrank Riyam on 05/05/21.
//

import Foundation
import Firebase
import GoogleSignIn

var fire = false

class AuthenticationViewModel: ObservableObject {
    
  enum SignInState {
    case signedIn
    case signedOut
      
  }
  
  @Published var state: SignInState = .signedOut
  
  func signIn() {
    // 1
    if GIDSignIn.sharedInstance.hasPreviousSignIn() {
      GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
          self?.authenticateUser(for: user, with: error)
      }
    } else {
      // 2
      guard let clientID = FirebaseApp.app()?.options.clientID else { return }
      
      // 3
      let configuration = GIDConfiguration(clientID: clientID)
      
      // 4
      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
      guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
      
      // 5
      GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [weak self] user, error in
          self?.authenticateUser(for: user, with: error)
      }
    }
  }
  
  private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
    // 1
    if let error = error {
      print(error.localizedDescription)
      return
    }
    
    // 2
    guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
    
    let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
    
    // 3
    Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
          var fire = true
        state = .signedIn
      }
    }
  }
  
  func signOut() {
    // 1
    GIDSignIn.sharedInstance.signOut()
    
    do {
      // 2
      try Auth.auth().signOut()
      
        fire = false
      state = .signedOut
    } catch {
      print(error.localizedDescription)
    }
  }
}


