//
//  ContentView.swift
//  LoginPage
//
//  Created by Tringapps on 02/03/22.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        
        Home()
    }
}

struct Home: View {
    
    @State var isShow = false
    
    var body: some View{
        NavigationView{
            ZStack{
        NavigationLink(
            destination: SignUp(isShow : self.$isShow),
            isActive: self.$isShow,
            label: {
                Text("")
            }).hidden()
                
                Login(isShow : self.$isShow)
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct SignupButtonContent: View {
//    @Binding var showAlertSignup :Bool
//
//    var body: some View {
//        Text("SIGNUP")
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .frame(width: 220, height: 60)
//            .background(Color.black)
//            .cornerRadius(35.0)
//            .padding(.top,20)
//            .alert(isPresented: $showAlertSignup){
//                Alert(title: Text("SIGN UP"), message: Text("Work in progress"), dismissButton: .default(Text("OK")))
//            }
//
//    }
//}
