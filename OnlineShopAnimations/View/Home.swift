//
//  Home.swift
//  OnlineShopAnimations
//
//  Created by Maxim Macari on 06/10/2020.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab = scrollTabs[0]
    @Namespace var animation
    @State var show = false
    @State var selectedBag: BagModel!
    
    var body: some View {
        
        
        ZStack{
            VStack(spacing: 0){
                ZStack{
                    HStack(spacing: 15){
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "line.horizontal.3.decrease")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "cart")
                                    .font(.title)
                                    .foregroundColor(.black)
                            })
                            
                            Circle()
                                .fill(Color.red)
                                .frame(width: 15, height: 15)
                                .offset(x: 5, y: -10)
                            
                        })
                        
                    }
                    
                    Text("Shop")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    
                }.padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: true, content: {
                    VStack{
                        HStack{
                            Text("Women")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                
                                Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            
                            HStack(spacing:15){
                                ForEach(scrollTabs, id: \.self){ tab in
                                    //tab button
                                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                                    
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 10)
                        })
                        
                        //Building custom GridView
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15){
                            
                            ForEach(bags){ bag in
                                
                                BagView(bagData: bag, animation: animation)
                                    .onTapGesture(count: 1, perform: {
                                        withAnimation(.easeIn){
                                            selectedBag = bag
                                            show.toggle()
                                        }
                                    })
                                
                            }
                        }
                        .padding()
                        .padding(.top, 10)
                        
                    }
                })
            }
            .background(Color.black.opacity(0.05))
            .ignoresSafeArea(.all, edges: .all)
            
            if selectedBag != nil && show{
                DetailView(bagData: $selectedBag, show: $show,animation: animation, count: 1)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}


