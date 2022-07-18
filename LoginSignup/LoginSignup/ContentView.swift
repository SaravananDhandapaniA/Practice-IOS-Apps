//
//  ContentView.swift
//  LoginSignup
//
//  Created by Tringapps on 13/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShow = false
    
    var body: some View {
        NavigationView{
            VStack{
        Text("Welcome to My App")
            .font(.largeTitle)
            .bold()
            .padding()
                
                HStack{
                NavigationLink(
                    destination: LoginPage(),
                    label: {
                        Text("Login")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    })
                    .padding(.trailing,50)
                    
                    NavigationLink(
                        destination: SignupPage(isShow: $isShow),
                        isActive: self.$isShow,
                        label: {
                            Text("Signup")
                                .font(.headline)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                        })
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
