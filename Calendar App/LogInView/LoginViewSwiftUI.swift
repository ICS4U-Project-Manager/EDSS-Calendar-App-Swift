//
//  LoginViewSwiftUI.swift
//  Calendar App
//
//  Created by Kyle Stirbet on 2022-05-31.
//

import SwiftUI

struct LoginViewSwiftUI: View {
    @State private var isShowingDetailView = false
      var body: some View {
          NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }
        
        Button("Tap to show detail") {
            isShowingDetailView = true
        }
    }
}


struct LoginViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewSwiftUI()
    }
}
