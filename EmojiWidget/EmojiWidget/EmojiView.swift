//
//  EmojiView.swift
//  EmojiWidget
//
//  Created by soyeon on 2021/08/20.
//

import SwiftUI

struct EmojiView: View {
    let emoji: Emoji
    
    var body: some View {
        Text(emoji.icon)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
    }
}

