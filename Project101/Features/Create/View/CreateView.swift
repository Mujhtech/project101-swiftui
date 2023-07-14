//
//  CreateView.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 14/07/2023.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                
                firstname
                
                lastname
                
                job
                
                Section {
                    button
                }
            }
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    done
                }
            }
        }
    }
}

private extension CreateView {
    
    var done: some View {
        
        Button("Done") {
            dismiss()
        }
        
    }
    
    var  firstname: some View {
        TextField("First name", text: .constant(""))
    }
    
    var  lastname: some View {
        TextField("Last name", text: .constant(""))
    }
    
    var  job: some View {
        TextField("Jbo", text: .constant(""))
    }
    
    var button: some View {
        Button("Submit") {
            
        }
    }
}

#Preview {
    CreateView()
}
