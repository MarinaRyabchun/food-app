//
//  BasketView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct BasketView: View {
    
    @EnvironmentObject var viewModel: BasketViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                ForEach($viewModel.positions) { position in
                    BasketRow(position: position, count: position.count)
                }
                Spacer()
                Button("Оплатить \(viewModel.cost) ₽") {
                    
                }
                .frame(width: 343, height: 48)
                .background(Constants.Colors.accent)
                .foregroundColor(Constants.Colors.white)
                .font(Constants.Fonts.headline2)
                .cornerRadius(10)
                .padding(.top, 10)
                
                Spacer().frame(height: 16)
            }
            .padding(.top, 8)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    GeoAndDateView()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    AccountButton()
                }
            }
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
