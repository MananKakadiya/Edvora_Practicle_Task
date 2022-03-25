//
//  NearestRideVC.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 25/03/22.
//

import SwiftUI
import MapKit

struct NearestRideVC: View {
    @State var isOpenRideDetailView : Bool = false
    
    var body: some View {
        RideListView()
    }
    
}

struct NearestRideVC_Previews: PreviewProvider {
    static var previews: some View {
        NearestRideVC()
    }
}
