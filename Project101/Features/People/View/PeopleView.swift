//
//  PeopleView.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 14/07/2023.
//

import SwiftUI

struct PeopleView: View {
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var users: [User] = []
    
    @State private var shouldShowCreate = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 16){
                        ForEach(users, id: \.id){ item in
                            
                            NavigationLink{
                                DetailView()
                            } label: {
                                PersonItemView(user: item)
                            }
                           
                        }
                    }
                    .padding()
                   
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    create
                }
            }
            .onAppear{
                do {
                    let res = try StaticJsonMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
                    users = res.data
                    
                } catch {
                    print(error)
                }
            }
            .sheet(isPresented: $shouldShowCreate, content: {
                CreateView()
            })
        }
    }
}

#Preview {
    PeopleView()
}

private extension PeopleView {
    
    var background: some View {
        Theme.background.ignoresSafeArea(edges: .top)
    }
    
    var create: some View {
        
        Button{
            shouldShowCreate.toggle()
        } label: {
            Symbols.plus
                .font(
                    .system(.headline, design: .rounded)
                    .bold()
                )
        }
        
    }
}
