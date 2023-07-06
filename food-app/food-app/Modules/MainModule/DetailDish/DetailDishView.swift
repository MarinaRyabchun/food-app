//
//  ProductView.swift
//  food-app
//
//  Created by Марина Рябчун on 03.07.2023.
//

import SwiftUI

struct DetailDishView: View {
    @StateObject var viewModel: DetailDishViewModel
    let imageSize: CGFloat = 200
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 311, height: 232)
                .foregroundColor(Constants.Colors.background)
                AsyncImageView(url: viewModel.dish.image_url, imageWidth: imageSize, imageHeight: imageSize)
                HStack {
                    Button {
                        
                    } label: {
                        Image(Constants.Image.heartIcon)
                            .padding(10)
                            .background(.white, in: RoundedRectangle(cornerRadius: 8))
                            .frame(width: 40, height: 40)
                    }
                    Button {
                        
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

struct DetailDishView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDishView(viewModel:
                        DetailDishViewModel(dish: Dish(id: 1,
                           name: "Рис с овощами и зеленью",
                           price: 799,
                           weight: 560,
                           description: "В китайской кухне рис с овощами готовят с добавлением грибов, бамбуковых побегов, моркови, лука и гороха. Эти ингредиенты быстро обжариваются на сковороде с соевым соусом и специями.",
                           image_url: "https://lh3.googleusercontent.com/fife/APg5EOb3-gGunBAb_3E7L5qZLGIx0Wm8kh4UjNn2yow-7Kvf50D7eFb9Iw5g_7W7TQLGKF29-G6VNa7dHS_zEWY8VaSMh9EqUql8UEFISB_WWgiO8nf_mt0YtUhsWFB5uzw-Bfi_eS9Cs-0vLUMiqaqTGgGFDvVhUvak4AypPMEbt2-3mEkxeZNcClEy29x8gEmUU6e9G8s5GDyCxR404OIsgnGHqtIaGIGD7afRoz7PtgtmZdlXC5v7dHujDNh5l28v249qxjpa1rqxoorBb-ywkRsu1bzqDEHGbRDnFNLXHwEGlHoLS1krz9KcD3opkmQckg7-m7PXzEhnQlayqMPiNGP-WpnFYrthFVfJ0TY4zsYFx1azSJZTLa59Xuqr32eagNn9xF6mCPpGqRbunBKrbD-oWidQ_iAXZRRrgjZrv280Joe8z73AluN0A-mXcqRkpVwQo1n3szZ00wX7sD44PriRwHGUfEenTC5IyLVv3MBsYMNXJ9ALa6FZgTrnUhO_ePGoPftELYGNp4yn-xkzfM_GvnQR8A6od0bR8AqqpNketd0kBavJTkaJXBwsfvxinTdLfOTfWsZAhF97XYNEA_9SmTgnnOjt3N8YUxmUeWcor174r7bNdDuDQqq7vWRgFZNorh5v6LANRk0CVsq6B9tVxP2R1zTCc1yXgpu4kNGJsEvNyxMRy-yM3cBvhu01ZUFSalvwAqcS2M9_eBoPCu00KVtcEvyFPoqm_QNHBEkDLjUdtJC7BGcmv7SPa-rV6oH_3zeIYstyKLrgN-Dzewe816A6J7IN4YxSvCIOWbNV9Q6O3hxua_ZrGSk6ijSoBKE0XHUC04cr1O6BzRxL9lwVUhzvBzYfzmBzMPb84Pq-WwBtfCxN2j34NReGu5iABuA1iDNgz0r8WE2Dvvz0XsD6Uc8neX57A7_19J6vyJEhuARJREXGs4tFWHMmjqg-xwYOOPJhxF1BkCaQrUEKtFYBq1pT2N7_h9fMV8JOLP92grJFHRP6TmNrEjPAf9HjfYRFouBAqFMRy614VrJu5hyweBcy-4WbJNYqrvKZH_bXIQyZ6qlv4omHhGTSMMT9cAYTyiMm12bEH5ccThAygPaXlfx6ydA3towLnMpoq0ieByM2-Nql2uh4xPxgAHcmzipRgEqlYDflDKNSfeTVFKKQ4vtTWa43wR505BTjdO3mk5CVoK4sOzwcF1mQA2joVXdW63wbUWtw4wtfa3e9EP1TV01b5M02KKPcr2yxZpNQCo8-Igp6M8t_vqWSKlkq-Z7NaRswW-xQyuFWjCufwgpd1m8i5Z4tnL72DhelmIiI2cXufJb70_eobyMV5VsMUab1nLKWoKwggolnEjl2A1PLrv6T0aRTYmjt3JqFDEV58aIjZhhyrcX6h6Bb_AJzc-OFvFPw1uAuswJaimihZUfYoVuwtNRI27BD7KGnXzMHKthOM4fArK3ICIt61g91DNHAu9qhpWxsj0FrcmujdWE2vJpBf7XoOcgxiRlRKpljQ2c3M6ULTdS1nuypZleouOtwIHOUoxGtT5HJeC8ZcsgI3przMt97iGmSv5Us7xL0j42wVNZbQnyQ6EsIyIG1ZOo2ah9CyA7RqixQUevdzbPhSnJk2w6weuuRCDkdC4H97doLyAV_=w1366-h617",
                           tegs: [
                     "Все меню", "С рисом", "Салаты"
                                  ])))
    }
}


