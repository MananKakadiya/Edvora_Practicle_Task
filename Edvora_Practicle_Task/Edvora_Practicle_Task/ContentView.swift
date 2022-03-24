//
//  ContentView.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//

import SwiftUI

struct ContentView: View {
    let login = HomeVC()
    @State private var isActive = false
    
    
    var body: some View {
        NavigationView {
            VStack(spacing:0){
                Spacer()
                logo()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.5)) {
                            self.isActive = true
                        }
                    })
                
                NavigationLink(destination: login.navigationBarHidden(isActive),
                               isActive: $isActive,
                               label: { EmptyView() }).buttonStyle(PlainButtonStyle())
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
