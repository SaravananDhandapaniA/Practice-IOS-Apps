//
//  LoginPage.swift
//  LoginSignup
//
//  Created by Tringapps on 13/03/22.
//

import SwiftUI

//let lighGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
var textFieldColor = ColorPallet()

struct LoginPage: View {
    
        @State var username: String = ""
        @State var password: String = ""
        @State var showAlertForgot : Bool = false
        @State var showAlertLogin : Bool = false
        @State var AuthenticationFail : Bool = false
        @State var AuthenticationPass : Bool = false
        @State var isShow : Bool = false
        @State var isWelcome = false
    
        var body: some View {
           
            ZStack{
                ScrollView{
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
                    
                    
                    Button("Login"){
                        if(self.username == LocalStorage.myEmail && self.password == LocalStorage.myPassword)
                        {
                            self.AuthenticationPass  = true
                            self.AuthenticationFail = false
                            username = ""
                            password = ""
                        
                        }
                        else{
                            self.AuthenticationPass  = false
                            self.AuthenticationFail = true
                            }
                        self.isWelcome = true
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(35.0)
                    
                    if AuthenticationPass{
                    NavigationLink(destination: WelcomePage(), isActive: $isWelcome){}
                    }
                    
                    //Forgot Password
                    Button(action: {
                        showAlertForgot = true
                    }, label: {
                        ForgotPassword(showAlertForgot: $showAlertForgot)
                    }).padding(.top,20)
                    
                }
                .padding()
                }
            
                }
                
            }
        }
    



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

    struct UsernameTextField: View {
        
        @Binding var username :String
        
        var body: some View {
            TextField("Username", text: $username)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)

        }
        
    }

    struct PasswordSecureField: View {
        
        @Binding var password: String
        
        var body: some View {
            SecureField("Password",text: $password)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
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

//struct LoginPage_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginPage()
//    }
//}
