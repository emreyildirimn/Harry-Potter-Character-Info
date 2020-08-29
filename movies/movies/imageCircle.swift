//
//  imageCircle.swift
//  movies
//
//  Created by mac on 28.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI
import PlaygroundSupport
 
struct CircleImage: View {
    var body: some View {
        Image(uiImage: UIImage(named: "img.jpg")!)
            .frame(width: 150, height: 150, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle()
            .stroke(Color.gray,lineWidth: 1))
            .shadow(radius: 10)
    }
}
 
struct CustomView:View {
    var body: some View {
        VStack {
            CircleImage()
            VStack(alignment: .center) {
                Text("New York").font(.headline)
                .padding(.top, 10)
                Text("Bla Bla Bla").font(.subheadline)
                }.padding(.top, 10)
            }
            .padding(.top, -200)
    }
}
 
PlaygroundPage.current.liveView = UIHostingController(rootView: CustomView())
