//
//  WelcomePage.swift
//  LoginSignup
//
//  Created by Tringapps on 15/03/22.
//

import SwiftUI

struct WelcomePage: View {
    
    @State var firstnameGreet = ""
    @State var lastnameGreet = ""
    var body: some View {
        
            VStack{
                Text("Welcome..\(firstnameGreet) \(lastnameGreet)")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .onAppear(perform: {
                        self.firstnameGreet = LocalStorage.myFirstname
                        self.lastnameGreet = LocalStorage.myLastname
                        
                    })
        }
        
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
