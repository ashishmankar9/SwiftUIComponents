//
//  ContentView.swift
//  Shared
//
//  Created by Ashish Mankar on 12/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BottomSheetView(transperancy: 0.2,cornerRadius: 40)
        }
    }
}

struct AddYourComponents: View {
    var body: some View {
        VStack{
            Text("Hello").bold().font(.title).padding()
            Text("We are glat to find here.").bold().font(.subheadline).padding()
            Button(action: {}, label: {
                Text("Awesome")
            }).padding()
        }
    }
}

struct BottomSheetView: View {
    var transperancy:Double = 0
    var cornerRadius:CGFloat = 0
    @State var dismissFlag = false
    var body: some View {
        ZStack(alignment:.bottom){
            Color(.black)
                .opacity(transperancy)
                .edgesIgnoringSafeArea(dismissFlag ? .all : .top)
                .onTapGesture {
                    withAnimation {
                        dismissFlag.toggle()
                    }
                }
            VStack(alignment:.leading){
                VStack{
                    AddYourComponents()
                }
                .frame(maxWidth:.infinity)
                .background(Color.white)
                .cornerRadius(cornerRadius, corners: [.topLeft,.topRight])
                .offset(y:dismissFlag ? UIScreen.main.bounds.height : 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
