//
//  SignUp.swift
//  LoginPage
//
//  Created by Tringapps on 09/03/22.
//

import SwiftUI

let lighGray = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct SignUp: View {
    
    @State var firstname        : String = ""
    @State var lastname         : String = ""
    @State var dob              : String = ""
    @State var email            : String = ""
    @State var phone            : String = ""
    @State var password         : String = ""
    @State var confrim_password : String = ""
    @Binding var isShow         : Bool
    @State var firstnameStored  : String = ""
    @State var lastnameStored   : String = ""
    @State var emailStored      : String = ""
    @State var passwordStored   : String = ""
    
    
    var body: some View {
        
        VStack{
            Spacer()
            CreateAccountText()
            FirstNameTextField(firstname: $firstname)
            LastNameTextField(lastname: $lastname)
            DOBTextField(dob: $dob)
            EmailTextField(email: $email)
            PhoneTextField(phone: $phone)
            PasswordTextField(password: $password)
            ConfrimPasswordTextField(confrim_password: $confrim_password)
            
            Button(action: {
                saveData()
                getData()
                print(firstnameStored)
                print(lastnameStored)
                print(emailStored)
                print(passwordStored)
                 firstname = ""
                 lastname  = ""
                 dob = ""
                 email =  ""
                 phone = ""
                 password  = ""
                 confrim_password = ""
                self.isShow.toggle()
                
            },label: {
                CreateButtonContent()
            })
            
            
           
        }
        .padding()
        
    }
    
    func saveData(){
        UserDefaults.standard.set(self.firstname, forKey: "Firstname")
        UserDefaults.standard.set(self.lastname, forKey: "Lastname")
        UserDefaults.standard.set(self.email, forKey: "Email")
        UserDefaults.standard.set(self.password, forKey: "Password")
    }
    func getData(){
        firstnameStored = UserDefaults.standard.string(forKey: "Firstname") ?? ""
        lastnameStored = UserDefaults.standard.string(forKey: "Lastname") ?? ""
        emailStored = UserDefaults.standard.string(forKey: "Email") ?? ""
        passwordStored = UserDefaults.standard.string(forKey: "Password") ?? ""
    }
}

//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp()
//    }
//}

struct CreateAccountText: View {
    var body: some View {
        Text("Create Your Account")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,10)
    }
}

struct FirstNameTextField: View {
    @Binding var firstname : String
    
    var body: some View {
        TextField("First Name", text: $firstname)
            .padding()
            .background(lighGray)
            .cornerRadius(5.0)
            .padding(.bottom,10)
    }
}

struct LastNameTextField: View {
    @Binding var lastname : String
    
    var body: some View {
        TextField("Last Name",text: $lastname)
            .padding()
            .background(lighGray)
            .cornerRadius(5.0)
            .padding(.bottom,10)
    }
}

struct DOBTextField: View {
    @Binding var dob : String
    var body: some View {
        TextField("DOB", text: $dob)
            .padding()
            .background(lighGray)
            .cornerRadius(5.0)
            .padding(.bottom,10)
    }
}

struct EmailTextField: View {
    @Binding var email : String
    var body: some View {
        TextField("Email Id ",text: $email)
            .padding()
            .background(lighGray)
            .cornerRadius(5.0)
            .padding(.bottom,10)
    }
}

struct PhoneTextField: View {
    @Binding var phone : String
    var body: some View {
        TextField("Phone Number",text: $phone)
            .padding()
            .background(lighGray)
            .cornerRadius(5.0)
            .padding(.bottom,10)
    }
}

struct PasswordTextField: View {
    @Binding var password : String
    var body: some View {
        TextField("Password",text: $password)
            .padding()
            .background(lighGray)
            .cornerRadius(5.0)
            .padding(.bottom,10)
    }
}

struct ConfrimPasswordTextField: View {
    @Binding var confrim_password : String
    var body: some View {
        TextField("Confrim Password",text: $confrim_password)
            .padding()
            .background(lighGray)
            .cornerRadius(5.0)
            .padding(.bottom,10)
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
