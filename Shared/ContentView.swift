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
            BottomSheetView(transperancy: 0.2,cornerRadius: 40) {}
        }
    }
}

struct AddYourComponents: View {
    @Binding var dismissFlag:Bool
    var action:()->()
    var body: some View {
        VStack{
            Text("Hello").bold().font(.title).padding()
            Text("We are glat to find you here.").bold().font(.subheadline).padding()
            Button(action: {
                withAnimation {
                    dismissFlag.toggle()
                }
                action()
                debugPrint("Button Tapped")
            }, label: {
                Text("Awesome")
            }).padding()
        }
    }
}

struct BottomSheetView: View {
    var transperancy:Double = 0.5
    var cornerRadius:CGFloat = 0
    var action:()->()
    @State var dismissFlag = false
    var body: some View {
        GeometryReader(content: { geometry in
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
                        AddYourComponents(dismissFlag: $dismissFlag, action: action)
                    }
                    .frame(maxWidth:.infinity)
                    .background(Color.white)
                    .cornerRadius(cornerRadius, corners: [.topLeft,.topRight])
                    .offset(y: dismissFlag ? geometry.size.height : 0)
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
