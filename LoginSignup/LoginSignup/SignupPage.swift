//
//  SignupPage.swift
//  LoginSignup
//
//  Created by Tringapps on 13/03/22.
//

import SwiftUI

//var lighGray = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
//var textFieldColor1  = ColorPallet()

struct SignupPage: View {
    
    @ObservedObject var signupVM = SignupViewModel()

        @State var age              : String = ""
        @Binding var isShow : Bool
        @State var isProfilePage = false
        
        
        var body: some View {
            ScrollView{
            VStack{
//                Spacer()
                CreateAccountText()
                FirstNameTextField(field : $signupVM.firstname)
                LastNameTextField(field: $signupVM.lastname)
                AgeTextField(age: $age)
                EmailTextField(prompt: signupVM.emailPrompt , field: $signupVM.email)
                PhoneTextField(prompt: signupVM.phonePrompt, field: $signupVM.phoneNum)
                PasswordTextField(prompt: signupVM.passwordPrompt, field: $signupVM.password,isSecure: true)
                ConfrimPasswordTextField(prompt: signupVM.confirmPwPrompt, field: $signupVM.confirmPw , isSecure: true)
                
                Button("Next"){
                    if(signupVM.isSignUpComplete)
                    {
                    LocalStorage.myEmail = self.signupVM.email
                    LocalStorage.myPassword = self.signupVM.password
                    LocalStorage.myFirstname = self.signupVM.firstname
                    LocalStorage.myLastname = self.signupVM.lastname
                    self.signupVM.signUp()
                    self.isProfilePage.toggle()
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(35.0)
                .opacity(signupVM.isSignUpComplete ? 1 : 0.6)
                .disabled(!signupVM.isSignUpComplete)
                
                NavigationLink(destination: ProfilePage(isShow: $isShow), isActive: $isProfilePage){}
                
            }
            Spacer()
            .padding()
            }
        }
        
    }

    struct CreateAccountText: View {
        var body: some View {
            Text("Create Your Account")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom,5)
        }
    }

    struct FirstNameTextField: View {
       
        @Binding var field: String
        var body: some View {
            TextField("First Name", text: $field)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,5)
        }
    }

    struct LastNameTextField: View {
        @Binding var field: String
        
        var body: some View {
            TextField("Last Name",text: $field)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,5)
        }
    }

    struct AgeTextField: View {
        @Binding var age : String
        var body: some View {
            TextField("Age", text: $age)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,5)
        }
    }

    struct EmailTextField: View {
        var prompt: String
        @Binding var field: String
        var body: some View {
            TextField("Email Id ",text: $field)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,5)
             Text(prompt)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
    }

    struct PhoneTextField: View {
        var prompt: String
        @Binding var field: String
        var body: some View {
            TextField("Phone Number",text: $field)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,5)
            Text(prompt)
               .fixedSize(horizontal: false, vertical: true)
               .font(.caption)
        }
    }

    struct PasswordTextField: View {
        var prompt: String
        @Binding var field: String
        var isSecure:Bool = false
        var body: some View {
            SecureField("Password",text: $field)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,5)
            Text(prompt)
               .fixedSize(horizontal: false, vertical: true)
               .font(.caption)
        }
    }

    struct ConfrimPasswordTextField: View {
        var prompt: String
        @Binding var field: String
        var isSecure:Bool = false
        var body: some View {
            SecureField("Confrim Password",text: $field)
                .padding()
                .foregroundColor(.gray)
                .background(textFieldColor.ourColor)
                .cornerRadius(5.0)
                .padding(.bottom,5)
            Text(prompt)
               .fixedSize(horizontal: false, vertical: true)
               .font(.caption)
        }
    }

    struct CreateButtonContent: View {
        var body: some View {
            Text("Create")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.green)
                .cornerRadius(35.0)
            
        }
        
    }



//struct SignupPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SignupPage()
//    }
//}
