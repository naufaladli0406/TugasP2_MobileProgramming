//
//  ContentView.swift
//  NaufalP2
//
//  Created by Naufal Adli on 03/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            MainPage()
                .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
