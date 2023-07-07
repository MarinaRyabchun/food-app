//
//  AccountView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//


import SwiftUI

struct AccountView: View {
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    NavigationLink {
                        
                    } label: {
                        Text("Избранное")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Заказы")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Настройки")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Профиль")
                    }
                }
                .font(Constants.Fonts.headline1)
                .listStyle(.plain)
                .padding()
                Spacer()
                Button("Выйти") {
                    
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
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
