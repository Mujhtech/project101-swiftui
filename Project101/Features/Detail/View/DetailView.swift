//
//  DetailView.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 14/07/2023.
//

import SwiftUI

struct DetailView: View {
    
    @State private var userInfo: UserDataResponse?
    
    var body: some View {
        ZStack {
            background
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 18) {
                    
                    avatar
                    
                    Group {
                        
                        general
                        
                        link
                        
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 18)
                    .background(Theme.detail, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    
                    
                }
                .padding()
                
            }
            
        }
        .navigationTitle("Details")
        .onAppear{
            do {
                userInfo = try StaticJsonMapper.decode(file: "SingleUserData", type: UserDataResponse.self)
              
                
            } catch {
                print(error)
            }
        }
    }
}

private extension DetailView {
    var background: some View {
        Theme.background.ignoresSafeArea(edges: .top)
    }
}

private extension DetailView {
    
    @ViewBuilder
    var avatar: some View {
        if let avatarAbsoluteString = userInfo?.data.avatar,
           let avatarUrl = URL(string: avatarAbsoluteString){
            
            AsyncImage(url: avatarUrl){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 250)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
            
        }
    }
    
    var general: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            PillView(id: userInfo?.data.id ?? 0)
            
            Group {
                
                firstName
                
                lastName
                
                email
                
            }
            
            .foregroundStyle(Theme.text)
            
            
            
           
        }
        
    }
    
    @ViewBuilder
    var link: some View {
        
        if let supportAbsoluteString = userInfo?.support.url,
           let supportUrl = URL(string: supportAbsoluteString),
            let supportText = userInfo?.support.text {
            
            Link(destination: supportUrl) {
                
                VStack(alignment: .leading, spacing: 8){
                    Text(supportText)
                        .foregroundStyle(Theme.text)
                        .font(
                            .system(.body, design: .rounded)
                            .weight(.semibold)
                        )
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    Text(supportAbsoluteString)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                
                Symbols.link
                    .font(.system(.title, design: .rounded))
                
                
            }
        }
        
        
        
        
    }
    
    @ViewBuilder
    var firstName: some View {
        
        Text("First Name")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data.firstName ?? "")
            .font(
                .system(.subheadline, design: .rounded)
            )
        
        Divider()
        
    }
    
    
    @ViewBuilder
    var lastName: some View {
        
        Text("Last Name")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data.lastName ?? "")
            .font(
                .system(.subheadline, design: .rounded)
            )
        
        Divider()
        
    }
    
    
    @ViewBuilder
    var email: some View {
        
        Text("Email Name")
            .font(
                .system(.body, design: .rounded)
                .weight(.semibold)
            )
        
        Text(userInfo?.data.email ?? "")
            .font(
                .system(.subheadline, design: .rounded)
            )
        
    }
}

#Preview {
    NavigationView {
        DetailView()
    }
}
