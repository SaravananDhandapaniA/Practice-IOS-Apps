//
//  ProfilePage.swift
//  LoginSignup
//
//  Created by Tringapps on 16/03/22.
//

import SwiftUI

//var lighGray1 = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct ProfilePage: View {
    
    @ObservedObject var signupVM = SignupViewModel()
    
    @State var address = "Enter your address"
    @State var aboutMe : String = ""
    @State var selectedStatus : String = "Status"
    @State var isExpand = false
     @State var ChangeProfile = false
     @State var openCamera = false
     @State var imageSelected = UIImage()
    @Binding var isShow         : Bool
     
     
     var body: some View {
         NavigationView{
         VStack {
             ZStack(alignment: .bottomTrailing){
             Button(action: {
                 ChangeProfile = true
                 openCamera = true
                 
             },label: {
                 if ChangeProfile {
                     Image(uiImage: imageSelected)
                     .resizable()
                     .frame(width: 120, height: 120)
                     .clipShape(Circle())
                     
                 }else{
                     Image("profileIcon3")
                     .resizable()
                     .frame(width: 120, height: 120)
                     .clipShape(Circle())
                 }
                    
         })
             Image(systemName: "plus")
                 .frame(width: 30, height: 30)
                 .foregroundColor(.white)
                 .background(.gray)
                 .clipShape(Circle())
             
         }
         .sheet(isPresented: $openCamera){
             ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
         }
             AboutMeTextField(aboutMe: $aboutMe)
             StatusDropDown(selectedStatus: $selectedStatus, isExpand: $isExpand)
             
             Button("Register"){
                 self.signupVM.email = LocalStorage.myEmail
                 self.signupVM.password=LocalStorage.myPassword
                 self.signupVM.firstname=LocalStorage.myFirstname
                 self.signupVM.lastname=LocalStorage.myLastname
                 LocalStorage.myStatus = self.selectedStatus
                 print("firstname: \(signupVM.firstname)")
                 print("lastname: \(signupVM.lastname)")
                 print("email: \(signupVM.email)")
                 print("password: \(signupVM.password)")
                 print("Status: \(LocalStorage.myStatus)")
                 self.signupVM.signUp()
                 self.isShow.toggle()
             }
             .font(.headline)
             .foregroundColor(.white)
             .padding()
             .frame(width: 220, height: 60)
             .background(Color.green)
             .cornerRadius(35.0)
            
             Spacer()
             
         }
             
         }
     }
}

//struct ProfilePage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePage()
//    }
//}

struct AboutMeTextField: View {
    
    @Binding var aboutMe : String
    
    var body: some View {
        TextField("About Me", text: $aboutMe)
            .padding()
            .foregroundColor(.gray)
            .background(textFieldColor.ourColor)
            .cornerRadius(5.0)
            .padding(.bottom,5)
            .padding(.top,15)
            .padding()
    }
}

struct StatusDropDown: View {
    @Binding var selectedStatus : String
    @Binding var isExpand : Bool
    var body: some View {
        DisclosureGroup("\(selectedStatus)", isExpanded: $isExpand){
            VStack{
                Text("Sinlge")
                    .padding()
                    .onTapGesture {
                        self.selectedStatus = "Single"
                        withAnimation{
                            self.isExpand.toggle()
                        }
                    }
                Text("Married")
                    .padding()
                    .onTapGesture {
                        self.selectedStatus = "Married"
                        withAnimation{
                            self.isExpand.toggle()
                        }
                    }
            }
        }
        .accentColor(.blue)
//        .font(.title2)
        .foregroundColor(.gray)
        .padding()
        .background(textFieldColor.ourColor)
        .cornerRadius(5.0)
        .padding()
        .border(.white)
    }
}
