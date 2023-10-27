//
//  QuoteView.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct QuoteView: View {
    
    @StateObject var viewmodel = TodayViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a quote")
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
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 30) {
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Warren Buffett")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewmodel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewmodel.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Caption")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Financial guru")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewmodel.caption.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewmodel.caption)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        
                        VStack(alignment: .leading, spacing: 6, content: {
                            
                            Text("Quote")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Write the text of a quote here...")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewmodel.quote.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewmodel.quote)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewmodel.addQuote {
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding([.horizontal, .bottom])
                })
                .opacity(viewmodel.name.isEmpty || viewmodel.caption.isEmpty || viewmodel.quote.isEmpty ? 0.5 : 1)
                .disabled(viewmodel.name.isEmpty || viewmodel.caption.isEmpty || viewmodel.quote.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    QuoteView()
}
