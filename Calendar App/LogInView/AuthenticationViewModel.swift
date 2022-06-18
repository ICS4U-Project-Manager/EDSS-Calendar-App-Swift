//
//  AuthenticationViewModel.swift
//  Ellifit
//
//  Created by Rudrank Riyam on 05/05/21.
//

import Foundation
import Firebase
import GoogleSignIn

weak var myVC : UIViewController?
var fire = false

class AuthenticationViewModel: ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @objc func buttonClicked(){
        
        let viewModel = AuthenticationViewModel()
        switch viewModel.state {
        case .signedIn:
            print("worked")
        case .signedOut: print("no test")
        }
    }
    
    @Published var state: SignInState = .signedOut
    
    func signIn() {
        // 1
        
        print ("im here!")
        print("\(fire)")
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            print("worked3")
            GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
                self?.authenticateUser(for: user, with: error)
                
            }
        } else {
            print("worked4")
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // 3
            print("worked5")
            let configuration = GIDConfiguration(clientID: clientID)
            print("vbnm")
            // 4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { print("worked6")
                return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else {
                print("worked7")
                return }
            
            // 5
            print("vbnm2")
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [weak self] user, error in
                print("vbnm6")
                self?.authenticateUser(for: user, with: error)
                print("vbnm9")
            }
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        print("vbnm1")
        // 1
        if let error = error {
            print("vbnm2")
            print(error.localizedDescription)
            return
        }
        
        // 2
        print("vbnm3")
        guard let authentication = user?.authentication, let idToken = authentication.idToken else
        {print ("workde9.0")
            return }
        print("vbnm4")
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        print("vbnm5")
        // 3
        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
            print("vbnm6")
            if let error = error {print("vbnm7")
                print(error.localizedDescription)
            } else {print("vbnm8")
                
                print("signed in")
                state = .signedIn
                print ("workde2.0")
                self.buttonClicked()
                
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

