//
//  ContentView.swift
//  EmojiWidget
//
//  Created by soyeon on 2021/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.soyeon.EmojiWidget"))
    var emojiData: Data = Data()
    
    let emojis = [
        Emoji(icon: "💖", name: "Heart", description: "Love You"),
        Emoji(icon: "🙀", name: "Cat", description: "Surprising Cat"),
        Emoji(icon: "👋", name: "Lucky", description: "Hope Your Luck")
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            ForEach(emojis) { emoji in
                EmojiView(emoji: emoji)
                    .onTapGesture {
                        save(emoji)
                    }
            }
        }
    }
    
    func save(_ emoji: Emoji) {
        guard let emojiData = try? JSONEncoder().encode(emoji) else { return }
        self.emojiData = emojiData
        print("save \(emoji)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
