//
//  DishesView.swift
//  RecipeApp
//
//  Created by Tringapps on 21/03/22.
//

import SwiftUI

struct DishesView: View {
    var body: some View {
        HStack(){
            VStack {
                HStack(){
                    Image("icon-toasts")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Toasts")
                }
                Divider()
                HStack(){
                    Image("icon-tacos")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Tacos")
                }
                Divider()
                HStack(){
                    Image("icon-salad")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("Salads")
                }
                Divider()
                HStack(){
                    Image("icon-streetfood")
                        .resizable()
                        .modifier(IconModifier())
                    Spacer()
                    Text("StreetFood")
                }
            }
            
            VStack {
                HStack {
                    Divider()
                }
                
                Image(systemName: "heart.circle")
                    .font(Font.title.weight(.black))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            }
            
            VStack {
                HStack(){
                    Text("Guacamole")
                    Spacer()
                    Image("iconguacamole")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack(){
                    Text("Sandwitch")
                    Spacer()
                    Image("icon-sandwich")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack(){
                    Text("Soup")
                    Spacer()
                    Image("icon-soup")
                        .resizable()
                        .modifier(IconModifier())
                }
                Divider()
                HStack(){
                    Text("Smoothie")
                    Spacer()
                    Image("icon-smoothie")
                        .resizable()
                        .modifier(IconModifier())
                }
            }
        }
        .font(.system(.callout , design:.serif))
        .foregroundColor(Color.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct IconModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 42, height: 42, alignment: .center)
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
            .previewLayout(.fixed(width: 414, height: 280))
    }
}
