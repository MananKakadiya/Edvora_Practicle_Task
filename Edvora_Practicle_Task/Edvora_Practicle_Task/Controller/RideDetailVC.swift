//
//  RideDetailVC.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 26/03/22.
//

import SwiftUI
import MapKit

struct RideDetailVC: View {
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
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack(spacing: 30){
                HStack{
                    Text("")
                        .frame(width: Utilities.setSize(size: 100), height: Utilities.setSize(size: 5))
                        .background(Color.black)
                        .cornerRadius(Utilities.setSize(size: 2.5))
                }
                
                Map(coordinateRegion: $region)
                    .cornerRadius(Utilities.setSize(size: 15))
                    .frame(height: Utilities.setSize(size: 250))
                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                
                rideDetailView()
                Spacer()
                
            }.padding(.leading, Utilities.setSize(size: 25))
                .padding(.trailing, Utilities.setSize(size: 25))
                .padding(.top, Utilities.setSize(size: 40))
            
        }
    }
    
    struct rideDetailView : View{
        var body: some View{
            return VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("Ride ID")
                            .font(.system(size: Utilities.setFontSize(size: 10)))
                            .fontWeight(Font.Weight.medium)
                            .foregroundColor(.gray).opacity(0.6)
                        
                        Text("001")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.regular)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 1), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 0), trailing: Utilities.setSize(size: 0)))
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("Origin Station")
                            .font(.system(size: Utilities.setFontSize(size: 10)))
                            .fontWeight(Font.Weight.medium)
                            .foregroundColor(.gray).opacity(0.6)
                        
                        
                        Text("20")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.regular)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 1), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 0), trailing: Utilities.setSize(size: 0)))
                    }
                }
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        Text("Date")
                            .font(.system(size: Utilities.setFontSize(size: 10)))
                            .fontWeight(Font.Weight.medium)
                            .foregroundColor(.gray).opacity(0.6)
                        
                        
                        Text("16th Feb")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.regular)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 1), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 0), trailing: Utilities.setSize(size: 0)))
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("Distance")
                            .font(.system(size: Utilities.setFontSize(size: 10)))
                            .fontWeight(Font.Weight.medium)
                            .foregroundColor(.gray).opacity(0.6)
                        Text("100 Km")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.regular)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 1), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 0), trailing: Utilities.setSize(size: 0)))
                    }
                    
                }
                Divider()
                
                HStack{
                    VStack(alignment: .leading){
                        Text("State")
                            .font(.system(size: Utilities.setFontSize(size: 10)))
                            .fontWeight(Font.Weight.medium)
                            .foregroundColor(.gray).opacity(0.6)
                        
                        Text("Maharashtra")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.regular)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 1), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 0), trailing: Utilities.setSize(size: 0)))
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("City")
                            .font(.system(size: Utilities.setFontSize(size: 10)))
                            .fontWeight(Font.Weight.medium)
                            .foregroundColor(.gray).opacity(0.6)
                        Text("Panvel")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.regular)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 1), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 0), trailing: Utilities.setSize(size: 0)))
                    }
                }
                Divider()
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Station Path")
                            .font(.system(size: Utilities.setFontSize(size: 10)))
                            .fontWeight(Font.Weight.medium)
                            .foregroundColor(.gray).opacity(0.6)
                        
                        Text("20, 39, 40, 42, 54, 63, 72, 88, 98")
                            .font(.system(size: Utilities.setFontSize(size: 14)))
                            .fontWeight(Font.Weight.regular)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 1), leading: Utilities.setSize(size: 0), bottom: Utilities.setSize(size: 0), trailing: Utilities.setSize(size: 0)))
                    }
                    Spacer()
                    
                }
                
                
            }.padding(.leading, Utilities.setSize(size: 15))
                .padding(.trailing, Utilities.setSize(size: 15))
                .padding(.top, Utilities.setSize(size: 15))
                .padding(.bottom, Utilities.setSize(size: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: Utilities.setSize(size: 15))
                        .stroke(Color.black, lineWidth: Utilities.setSize(size: 0.5)).opacity(0.5)
                )
        }
    }
}

struct RideDetailVC_Previews: PreviewProvider {
    static var previews: some View {
        RideDetailVC()
    }
}
