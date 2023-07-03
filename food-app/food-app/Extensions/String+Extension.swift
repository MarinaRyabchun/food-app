//
//  String+Extension.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import Foundation

extension String {
    
    func splitWords() -> String {
        let words = self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        var result = ""
        
        for (index, word) in words.enumerated() {
            if index == 0 {
                result += word
            } else if word.count <= 3 {
                result += "\n" + word
            } else {
                result += " " + word
            }
        }
        
        return result
    }
}

