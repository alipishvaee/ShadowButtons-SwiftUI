//
//  ContentView.swift
//  ShadowButtons-SwiftUI
//
//  Created by Ali Pishvaee on 5/15/20.
//  Copyright © 2020 AliPishvaee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        ZStack {
        //            Color.gray.opacity(0.09).edgesIgnoringSafeArea(.all)
        VStack {
            Button(action: handleFirstButton, label: {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .frame(width: 30, height: 60).accentColor(.red)
            })
                .frame(width: 200, height: 200, alignment: .center)
                .background(Color.init(white: 0.96))
                .clipShape(Circle())
                .shadow(color: Color(.sRGB, red: 0.0516852513, green: 0.2103428841, blue: 0.3877539635, opacity: 0.1618150685), radius: 26, x: 28, y: 28)
                .shadow(color: .white, radius: 16, x: -23, y: -23)
                .padding(.bottom, 20)
            
            Button(action: handleFirstButton, label: {
                Circle()
                    .foregroundColor(Color.init(white: 0.96))
                    .frame(width: 200, height: 200, alignment: .center)
                    .overlay(
                        Circle()
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 2)
                            .offset(x: 4, y: 5)
                            .mask(Circle().fill(LinearGradient(Color.white, Color.clear)))
                )
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 8)
                            .blur(radius: 2)
                            .offset(x: -4, y: -4)
                            .mask(Circle().fill(LinearGradient(Color.clear, Color.white)))
                )
            })
            
        }
    }
    
        func handleFirstButton() {
    
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

//struct ContentView: View {
//    var body: some View {
//        ZStack {
//            Button(action: {
//                print("Button tapped")
//            }) {
//                Image(systemName: "heart.fill")
//                    .foregroundColor(.gray)
//            }
//            .buttonStyle(SimpleButtonStyle())
//
////            Color.offWhite
////            RoundedRectangle(cornerRadius: 25)
////            .fill(Color.offWhite)
////            .frame(width: 300, height: 300)
////            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
////            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}


struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                        )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
        )
    }
}
