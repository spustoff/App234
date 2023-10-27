//
//  TodayView.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct TodayView: View {
    
    @StateObject var viewModel = TodayViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Today")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                
                VStack(alignment: .center, spacing: 3, content: {
                    
                    Text("14 days")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Until the next quote and affirmation")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                
                if viewModel.affirmations.isEmpty && viewModel.quotes.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Image("empty")
                        
                        Text("No motivation for today")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .multilineTextAlignment(.center)
                        
                        Text("Add your first quote or affirmation by clicking the plus button below")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.affirmations, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text("Affirmation")
                                        .foregroundColor(.purple)
                                        .font(.system(size: 17, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        
                                        Rectangle()
                                            .fill(Color.purple)
                                            .frame(width: 6, height: 14)
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                            .multilineTextAlignment(.leading)
                                    }
                                    
                                    Image("aff_image")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 200)
                                        .cornerRadius(10)
                                    
                                    NavigationLink(destination: {
                                        
                                        TodayEarnings()
                                            .navigationBarBackButtonHidden()
                                        
                                    }, label: {
                                        
                                        Text("Add earnings")
                                            .foregroundColor(.green)
                                            .font(.system(size: 15, weight: .medium))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 45)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.2)))
                                    })
                                })
                                .padding()
                                .background(Color.white)
                            }
                            
                            ForEach(viewModel.quotes, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text("Quote")
                                        .foregroundColor(.purple)
                                        .font(.system(size: 17, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        
                                        Rectangle()
                                            .fill(Color.green)
                                            .frame(width: 6, height: 14)
                                        
                                        Text(index.quote ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                            .multilineTextAlignment(.leading)
                                    }
                                    
                                    HStack {
                                        
                                        Circle()
                                            .fill(.gray.opacity(0.15))
                                            .frame(width: 33, height: 33)
                                            .overlay (
                                            
                                                Image(systemName: "camera")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                            )
                                        
                                        VStack(alignment: .leading, spacing: 2, content: {
                                            
                                            Text(index.name ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .medium))
                                                .multilineTextAlignment(.leading)
                                            
                                            Text(index.caption ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                                .multilineTextAlignment(.leading)
                                        })
                                    }
                                    
                                    NavigationLink(destination: {
                                        
                                        TodayEarnings()
                                            .navigationBarBackButtonHidden()
                                        
                                    }, label: {
                                        
                                        Text("Add earnings")
                                            .foregroundColor(.green)
                                            .font(.system(size: 15, weight: .medium))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 45)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.2)))
                                    })
                                })
                                .padding()
                                .background(Color.white)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchProperties()
        }
    }
}

#Preview {
    TodayView()
}
