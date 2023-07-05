//
//  AccountPhoto.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import SwiftUI

struct AccountButton: View {
    let buttonSize: CGFloat = 44
    var body: some View {
        Button {
            
        } label: {
            Image(Constants.Image.accountPhoto)
        }
        .frame(width: buttonSize, height: buttonSize)
    }
}

struct AccountPhoto_Previews: PreviewProvider {
    static var previews: some View {
        AccountButton()
    }
}
