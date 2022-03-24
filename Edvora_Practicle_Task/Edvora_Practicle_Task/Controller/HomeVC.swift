//
//  HomeVC.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//

import SwiftUI

struct HomeVC: View {
    var body: some View {
        VStack{
            NavigationBar()
            Rides()
            Spacer()
        }
    }
    
    
    struct NavigationBar: View {
        var body: some View{
            return HStack(spacing: 0){
                Text("Edvora").fontWeight(Font.Weight.heavy).font(Font.system(size: Utilities.setFontSize(size: 30)))
                Spacer()
                Image("edvora")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            }.padding(EdgeInsets(top: Utilities.setSize(size: 10), leading: Utilities.setSize(size: 20), bottom: Utilities.setSize(size: 10), trailing: Utilities.setSize(size: 20)))
        }
    }
    
    
    struct Rides: View{
        @State var index = 1
        @State var callFirstTime = true
        var width =  UIScreen.main.bounds.width
        var body: some View {
            return VStack(spacing:Utilities.setSize(size: 10)){
                AppBar(index: $index, callFirstTime: $callFirstTime)
                if index == 1 {
                    NearestRideVC()
                }
                if index == 2 {
                    UpComingRideVC()
                }
                if index == 3 {
                    PastRideVC()
                }
            }
        }
    }
    
    struct AppBar: View{
        @Binding var index : Int
        @Binding var callFirstTime : Bool
        var width =  UIScreen.main.bounds.width
        var body: some View {
            return VStack(alignment: .leading){
                HStack(spacing: Utilities.setSize(size: 25)){
                    Button(action: {
                        if self.index != 1 {
                            self.index = 1
                            self.callFirstTime = false
                        }
                    }) {
                        VStack(alignment: .leading, spacing: 0){
                            Text("Nearest")
                                .foregroundColor(self.index == 1 ? .black : Color.gray)
                                .fontWeight(Font.Weight.bold)
                                .padding(EdgeInsets(top: Utilities.setSize(size: 5), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 5), trailing: Utilities.setSize(size: 5)))
                            Capsule()
                                .fill(self.index == 1 ? Color.blue : Color.clear)
                                .frame(width: Utilities.setSize(size: 35), height: Utilities.setSize(size: 2))
//                                .padding(.leading, Utilities.setSize(size: 15))
                        }
                    }
                    Button(action: {
                        if self.index != 2 {
                            self.index = 2
                            self.callFirstTime = false
                        }
                    }) {
                        VStack(alignment: .leading, spacing: 0){
                            Text("Upcoming")
                                .foregroundColor(self.index == 2 ? .black : Color.gray)
                                .fontWeight(Font.Weight.bold)
                                .padding(EdgeInsets(top: Utilities.setSize(size: 5), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 5), trailing: Utilities.setSize(size: 5)))
                            Capsule()
                                .fill(self.index == 2 ? Color.blue : Color.clear)
                                .frame(width: Utilities.setSize(size: 40), height: Utilities.setSize(size: 2))
//                                .padding(.leading, Utilities.setSize(size: 15))
                        }
                    }
                    Button(action: {
                        if self.index != 3 {
                            self.index = 3
                            self.callFirstTime = false
                        }
                    }) {
                        VStack(alignment: .leading, spacing: 0){
                            Text("Past")
                                .foregroundColor(self.index == 3 ? .black : Color.gray)
                                .fontWeight(Font.Weight.bold)
                                .padding(EdgeInsets(top: Utilities.setSize(size: 5), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 5), trailing: Utilities.setSize(size: 5)))
                            Capsule()
                                .fill(self.index == 3 ? Color.blue : Color.clear)
                                .frame(width: Utilities.setSize(size: 25), height: Utilities.setSize(size: 2))
//                                .padding(.leading, Utilities.setSize(size: 15))
                        }
                    }
                    Spacer()
                }
                
            }
            .padding(.leading, Utilities.setSize(size: 15))
            .padding(.trailing, Utilities.setSize(size: 15))
        }
    }
}














struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
    }
}
