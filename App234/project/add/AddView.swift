//
//  AddView.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct AddView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                
                NavigationLink(destination: {
                    
                    QuoteView()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 3, content: {
                        
                        Image("quote")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        
                        Text("Quote")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                })
                
                NavigationLink(destination: {
                    
                    AffirmationView()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 3, content: {
                        
                        Image("affirmation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        
                        Text("Affirmation")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    AddView()
}
