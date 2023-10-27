//
//  TabBar.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    if index != .Add {
                        
                        VStack(alignment: .center, spacing: 6, content: {
                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                                .frame(height: 22)
                            
                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                        })
                        .frame(maxWidth: .infinity)
                        
                    } else {
                        
                        Image(index.rawValue)
                            .padding(.horizontal, 10)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    
    case Today = "Today"
    
    case Charge = "Charge"
    
    case Add = "Add"
    
    case History = "History"
    
    case Profile = "Profile"
    
}

#Preview {
    ContentView()
}
