//
//  PersonItemView.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 14/07/2023.
//

import SwiftUI

struct PersonItemView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: .zero){
//            Rectangle()
//                .fill(.blue)
//                .frame(height: 130)
            
            
            AsyncImage(url: .init(string: user.avatar)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 130)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            
            
            
            VStack(alignment: .leading) {
                PillView(id: user.id)
                Text("\(user.firstName) \(user.lastName)")
                    .font(
                        .system(.body, design: .rounded)
                    )
                    .foregroundStyle(Theme.text)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Theme.detail)
        }
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

//#Preview {
//    static var previewUser: User {
//        let users = try! StaticJsonMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
//        
//        return users.data.first!
//    }
//    
//    return PersonItemView(user: previewUser)
//}
