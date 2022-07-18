//
//  Login.swift
//  LoginPage
//
//  Created by Tringapps on 09/03/22.
//

import SwiftUI

let lighGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct Login: View {
    
    
    @State var username: String = ""
    @State var password: String = ""
    @State var showAlertForgot : Bool = false
    @State var showAlertLogin : Bool = false
    @State var AuthenticationFail : Bool = false
    @State var AuthenticationPass : Bool = false
    @Binding var isShow : Bool
    
    
   

    var body: some View {
       
        ZStack{
//            Rectangle()
//                .fill(Color("bgColor"))
//                .frame(width: .infinity, height: .infinity)
//                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HelloText()
                NatureImage()
                UsernameTextField(username: $username)
                PasswordSecureField(password: $password)
                
                if AuthenticationFail{
                    Text("Invalid Username or password...Try Again!!")
                        .offset(y:-10)
                        .foregroundColor(Color.red)
                    
                }
                
                //Login Button
                Button(action: {
//                    if self.username  == storedUsername && self.password == storedPassword  {
//                        self.AuthenticationPass = true
//                        self.AuthenticationFail = false
//                        showAlertLogin = true
//                        username = ""
//                        password = ""
//                    } else {
//                        self.AuthenticationFail = true
//                        self.AuthenticationPass = false
//                    }
                    
                }, label: {
                    LoginButtonContent(showAlertLogin: $showAlertLogin)
                })
                
                //Forgot Password
                Button(action: {
                    showAlertForgot = true
                }, label: {
                    ForgotPassword(showAlertForgot: $showAlertForgot)
                }).padding(.top,20)
                
                
                HStack{
                Text("Already haven't an account?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                Text("Sign up")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                        .onTapGesture {
                            self.isShow.toggle()
                        }
                }
                
            }
            .padding()
        }
    }
}

//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}

struct HelloText: View {
    var body: some View {
        Text("Hello Buddy!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
    }
}

struct NatureImage: View {
    var body: some View {
        Image("HelloBuddy")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom,75)
    }
}

struct LoginButtonContent: View {
    
    @Binding var showAlertLogin : Bool
    
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(35.0)
            .alert(isPresented: $showAlertLogin){
                Alert(title: Text("Login"), message: Text("Successfully Logged In"), dismissButton: .default(Text("OK")))
            }
    }
}

struct UsernameTextField: View {
    
    @Binding var username :String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(lighGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password",text: $password)
            .padding()
            .background(lighGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
            
    }
}

struct ForgotPassword: View {
    
    @Binding var showAlertForgot : Bool
    
    var body: some View {
        Text("Forget Password?")
            .fontWeight(.bold)
            .foregroundColor(.gray)
            .alert(isPresented: $showAlertForgot){
                Alert(title: Text("Forgot Password"), message: Text("Work in progress"), dismissButton: .default(Text("OK")))
            }
    }
}
