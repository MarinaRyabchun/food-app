//
//  View+Extension.swift
//  food-app
//
//  Created by Марина Рябчун on 07.07.2023.
//

import SwiftUI

extension View {
    func withoutAnimation(_ work: @escaping () -> Void) {
        UIView.setAnimationsEnabled(false) //<== Disable animation for whole app
        work()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.setAnimationsEnabled(true) //<== Again enable animation for whole app
        }
    }
}
