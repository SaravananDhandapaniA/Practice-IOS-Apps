//
//  ProfileView.swift
//  profilePic
//
//  Created by Tringapps on 16/03/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var aboutMe : String = ""
    @State var ChangeProfile = false
    @State var openCamera = false
    @State var imageSelected = UIImage()
    
    
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
              TextField("About Me",text:$aboutMe)
                .foregroundColor(.white)
                .background(.blue)
            Spacer()
            
        }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
