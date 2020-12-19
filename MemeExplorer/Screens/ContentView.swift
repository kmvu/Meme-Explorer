//
//  ContentView.swift
//  MemeExplorer
//
//  Created by Khang Vu on 15/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var memeData: [MemeData]
    
    var body: some View {
        NavigationView {
            List(memeData) { data in
                let memeScreen = MemeDetailsScreen(memeData: data)
                NavigationLink(destination: memeScreen) { Text(data.title) }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Meme me".capitalized)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(memeData: testData)
        }
    }
}
