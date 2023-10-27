//
//  AffirmationView.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct AffirmationView: View {
    
    @StateObject var viewmodel = TodayViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add an affirmation")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack(spacing: 6) {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                
                Image("aff_image")
                
                VStack(alignment: .leading, spacing: 6, content: {
                    
                    Text("Affirmations")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .medium))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Write the text of the affirmation here...")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewmodel.affirmation_text.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewmodel.affirmation_text)
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    viewmodel.affirmations.append(viewmodel.affirmation_text)
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding([.horizontal, .bottom])
                })
                .opacity(viewmodel.affirmation_text.isEmpty ? 0.5 : 1)
                .disabled(viewmodel.affirmation_text.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AffirmationView()
}
