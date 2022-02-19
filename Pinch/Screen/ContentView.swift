//
//  ContentView.swift
//  Pinch
//
//  Created by saeem  on 19/02/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    @State private var isAnimating: Bool = false // This will store the actual state of the animation we have created this to add animation in our app.
    @State private var  imageScale: CGFloat = 1
    // MARK: - FUNCTION
    
    // MARK: - CONTENT
    var body: some View {
        NavigationView{
            ZStack{
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity((0.2)), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0) // This implicit animation asks swiftUI to apply a one second linear animation whenever the value of the isAnimating property changes
                    .scaleEffect(imageScale)
                // MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        } else {
                            withAnimation(.spring()) {
                                imageScale = 1
                            }
                        }
                    })
                
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)){
                    isAnimating = true
                }
            })
            //: NAVIGATION
            
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
