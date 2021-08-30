//
//  ContentView.swift
//  StoreKit
//
//  Created by soyeon on 2021/08/30.
//

import SwiftUI
import StoreKit

// Fetch Products
// Purchase Products
// Update UI + Fetch Product State

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "applelogo")
                .resizable()
                .frame(width: 70, height: 70)
            
            Text("Apple Store")
                .bold()
                .font(.system(size: 32))
            
            Image("appleWatch")
                .resizable()
                .aspectRatio(nil, contentMode: .fit)
            
            Button(action: {
                
            }) {
                Text("Buy Now")
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 220, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
