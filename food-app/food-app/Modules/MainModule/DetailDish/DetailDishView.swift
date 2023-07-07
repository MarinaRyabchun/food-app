//
//  ProductView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct DetailDishView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel: DetailDishViewModel
    let imageSize: CGFloat = 200
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Constants.Colors.black40)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 5) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 311, height: 232)
                        .foregroundColor(Constants.Colors.background)
                    AsyncImageView(url: viewModel.dish.image_url,
                                   imageWidth: imageSize,
                                   imageHeight: imageSize)
                    HStack {
                        Button {
                            
                        } label: {
                            Image(Constants.Image.heartIcon)
                                .padding(10)
                                .background(.white, in: RoundedRectangle(cornerRadius: 8))
                                .frame(width: 40, height: 40)
                        }
                        Button {
                            withoutAnimation {
                                coordinator.dismissFullScreenCover()
                            }
                        } label: {
                            Image(Constants.Image.cancelIcon)
                                .padding(10)
                                .background(.white, in: RoundedRectangle(cornerRadius: 8))
                                .frame(width: 40, height: 40)
                        }
                    }
                    .offset(x: 103, y: -88)
                }
                Text(viewModel.dish.name ?? "Dish")
                    .font(Constants.Fonts.headline2)
                    .foregroundColor(Constants.Colors.black)
                HStack {
                    Text(String(viewModel.dish.price ?? 0) + "₽")
                        .font(Constants.Fonts.mainBody)
                        .foregroundColor(Constants.Colors.black)
                    Text(String(viewModel.dish.weight ?? 0) + "г")
                        .font(Constants.Fonts.mainBody)
                        .foregroundColor(Constants.Colors.black40)
                }
                ScrollView {
                    Text(viewModel.dish.description ?? "Dish")
                        .font(Constants.Fonts.mainBody)
                        .foregroundColor(Constants.Colors.black)
                        .frame(width: 311)
                }
                Button("Добавить в корзину") {
                    let position = Position(id: UUID().uuidString,
                                            count: 1,
                                            dish: viewModel.dish)
                    BasketViewModel.shared.addPosition(position)
                }
                .frame(width: 311, height: 48)
                .background(Constants.Colors.accent)
                .foregroundColor(Constants.Colors.white)
                .cornerRadius(10)
                .padding(.top, 10)
            }
            .padding(16)
            .background(.white, in: RoundedRectangle(cornerRadius: 15))
            .frame(width: 343, height: 446)
        }
    }
}

struct DetailDishView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDishView(viewModel:
                        DetailDishViewModel(dish: Dish.example1()))
    }
}


