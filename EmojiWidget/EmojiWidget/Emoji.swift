//
//  Emoji.swift
//  EmojiWidget
//
//  Created by soyeon on 2021/08/20.
//

import Foundation

struct Emoji: Identifiable, Codable {
    let icon: String
    let name: String
    let description: String
    
    var id: String { icon }
}
