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
    
    func popUp<Content: View>(show: Binding<Bool>,@ViewBuilder content: @escaping () -> Content) -> some View {
        
        return self
            .overlay {
                if show.wrappedValue {
                    GeometryReader { proxy in
                        
                        Color.black
                            .opacity(0.4)
                            .ignoresSafeArea(.all)
                        
                        
                        let size = proxy.size
                        
                        NavigationView {
                            content()
                        }
                        .frame(width: 343, height: 446)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
    }
}
