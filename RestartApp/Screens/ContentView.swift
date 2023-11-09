//
//  ContentView.swift
//  RestartApp
//
//  Created by naswakhansa on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnBoardingView()
            }
            else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
