//
//  CustomStepper.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import SwiftUI

public struct CustomStepper: View {

    @Binding public var count: Int

    public var body: some View {
        HStack(spacing: 15) {
            Button {
                count -= 1
            } label: {
                Image(systemName: "minus")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Constants.Colors.black)
            }
            .disabled(count == 0)
            
            Text("\(count)")
                .foregroundColor(Constants.Colors.black)
                .font(Constants.Fonts.stepperValue)
            
            Button {
                count += 1
            } label: {
                Image(systemName: "plus")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Constants.Colors.black)
            }
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .background(Constants.Colors.stepper!, in: RoundedRectangle(cornerRadius: 10))
        .frame(minWidth: 99, minHeight: 32)
    }
}


// MARK: - Preview

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        @State var value = 1
        CustomStepper(count: $value)
    }
}
