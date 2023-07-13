//
//  ContentView.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 13/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding().onAppear{
            print("User response")
            
            dump(try? StaticJsonMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
            )
        }
    }
}

#Preview {
    ContentView()
}
