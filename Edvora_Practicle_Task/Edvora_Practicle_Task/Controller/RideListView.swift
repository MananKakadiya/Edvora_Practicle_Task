//
//  RideListView.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 26/03/22.
//

import SwiftUI
import MapKit

struct RideListView: View {
    @State var isOpenRideDetailView : Bool = false
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                Section(header: HStack{
                    Spacer()
                }){
                    ForEach(0..<5){items in
                        RideList()
                            .moveDisabled(true)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: Utilities.setSize(size: 10), trailing: 0))
                            .onTapGesture {
                                isOpenRideDetailView = true
//                                print(items)
                            }
                    }
                }
            }
        }.padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 20), bottom: 0, trailing: Utilities.setSize(size: 20)))
            .sheet(isPresented: $isOpenRideDetailView) {
                isOpenRideDetailView = false
            } content: {
                NavigationView {
                    RideDetailVC()
                        .navigationBarHidden(true)
                }.navigationBarHidden(true)
                
            }
    }
    
    struct RideList: View{
        @State private var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 25.7617,
                    longitude: 80.1918
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 10,
                    longitudeDelta: 10
                )
            )
        var body: some View{
            return  ZStack(alignment: .leading){
                VStack(alignment: .leading){
                   
                    ZStack(alignment: .bottomTrailing){
                    Map(coordinateRegion: $region)
                        
                        .cornerRadius(Utilities.setSize(size: 15))
                        .frame(height: Utilities.setSize(size: 300))
                        
                        Text("100 Km")
                            .font(.system(size: Utilities.setFontSize(size: 15)))
                            .fontWeight(Font.Weight.bold)
                            .foregroundColor(.white)
                            .frame(width: Utilities.setSize(size: 80), height: Utilities.setSize(size: 35))
                            .background(Color.blue)
                            .cornerRadius(Utilities.setSize(size: 15))
                            .padding()
                   }
                    
                    
                    HStack(spacing: Utilities.setSize(size: 8)){
                        Text("#")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.bold)
                            .foregroundColor(.blue)
                            .padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 15), bottom: 0, trailing: 0))
                        Text("Ride ID")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.bold)
                            .foregroundColor(.black)
                            
                        Spacer()
                        Image("calender")
                            .resizable()
                            .scaledToFill()
                            .frame(width: Utilities.setSize(size: 18), height: Utilities.setSize(size: 18))
                            .padding(.trailing, Utilities.setSize(size: 5))
                        Text("Time")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.bold)
                            .foregroundColor(.black)
                    }.padding(.bottom, Utilities.setSize(size: 8))
                        .padding(.trailing, Utilities.setSize(size: 10))
                        .frame(height: Utilities.setSize(size: 60))
                }
            }.overlay(
                RoundedRectangle(cornerRadius: Utilities.setSize(size: 15))
                    .stroke(Color.black, lineWidth: Utilities.setSize(size: 0.5)).opacity(0.5)
            )
        }
    }
}

struct RideListView_Previews: PreviewProvider {
    static var previews: some View {
        RideListView()
    }
}
