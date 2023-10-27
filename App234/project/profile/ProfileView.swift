//
//  ProfileView.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    @StateObject var viewModel = TodayViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("Rate us")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                })
                
//                Button(action: {
//                    
//                    guard let url = URL(string: "https") else { return }
//                    
//                    UIApplication.shared.open(url)
//                    
//                }, label: {
//                    
//                    HStack {
//                        
//                        Image(systemName: "doc.fill")
//                            .foregroundColor(Color("primary"))
//                            .font(.system(size: 14, weight: .regular))
//                        
//                        Text("Usage Policy")
//                            .foregroundColor(.black)
//                            .font(.system(size: 15, weight: .medium))
//                        
//                        Spacer()
//                        
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(.gray)
//                            .font(.system(size: 12, weight: .regular))
//                    }
//                    .padding()
//                    .padding(.horizontal)
//                    .background(Color.white)
//                })
                
                Button(action: {
                    
                    viewModel.affirmations.removeAll()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("Reset Progress")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
