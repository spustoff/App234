//
//  TodayEarnings.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI

struct TodayEarnings: View {
    
    @Environment(\.presentationMode) var router
    
    @State var pairs: [String] = ["EURUSD", "EURJPY", "GBPCAD"]
    @State var current_pair: String = "GBPCAD"
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add earnings")
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
                
                TradeChart(pair: current_pair)
                    .disabled(true)
                
                Menu {
                    
                    ForEach(pairs, id: \.self) { index in
                    
                        Button(action: {
                            
                            current_pair = index
                            
                        }, label: {
                            
                            HStack {
                                
                                Text(index)
                                
                                Spacer()
                                
                                if current_pair == index {
                                    
                                    Image(systemName: "xmark")
                                }
                            }
                        })
                    }
                    
                } label: {
                    
                    HStack {
                        
                        Text(current_pair)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                }
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding([.horizontal, .bottom])
                })
            }
        }
    }
}

#Preview {
    TodayEarnings()
}
