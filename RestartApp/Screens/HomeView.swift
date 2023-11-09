//
//  HomeView.swift
//  RestartApp
//
//  Created by naswakhansa on 22/10/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = false
    @State private var isAnimating : Bool = false
    var body: some View {
        VStack(spacing : 20) {
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y:isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),value: isAnimating
                        )
                        
            }
            
            Text("Then time that leads to mastery is dependent on the instensity or our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            Button(action : {
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
            .onAppear(
                perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute:{
                        isAnimating = true
                    })
                })
    }
}

#Preview {
    HomeView()
}
