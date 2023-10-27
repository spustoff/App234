//
//  ChargeView.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct ChargeView: View {
    
    @StateObject var viewModel = ChargeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Charge")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.lessons.isEmpty {
                        
                        VStack(alignment: .center, spacing: 7, content: {
                            
                            Image("empty")
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("You don't have any properties added yet")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack(spacing: 15) {
                                
                                ForEach(viewModel.lessons, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.selectedLesson = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 13, content: {
                                            
                                            WebPic(urlString: index.image ?? "", width: .infinity, height: 200, cornerRadius: 15, isPlaceholder: true)
                                            
                                            Text(index.title ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 18, weight: .semibold))
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(2)
                                        })
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    })
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .onAppear {
                
                viewModel.getVideos()
            }
            .sheet(isPresented: $viewModel.isDetail, content: {
                
                ChargeDetail(index: viewModel.selectedLesson)
            })
        }
    }
}

#Preview {
    ChargeView()
}
