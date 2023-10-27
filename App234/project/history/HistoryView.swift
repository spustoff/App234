//
//  HistoryView.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct HistoryView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("History")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Image("empty")
                    
                    Text("No history")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .multilineTextAlignment(.center)
                    
                    Text("Every day, events from the 'today'\ntab will be saved here")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    HistoryView()
}
