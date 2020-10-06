//
//  DetailView.swift
//  OnlineShopAnimations
//
//  Created by Maxim Macari on 06/10/2020.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var bagData: BagModel!
    @Binding var show: Bool
    var animation: Namespace.ID
    //Initialization
    @State var selectedColor = Color.red
    
    @State var count: Int
    
    
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Button(action: {
                        
                        withAnimation(.easeOut){
                            show.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        
                    })
                    
                    Text("Aristocratic Hand Bag")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top)
                    
                    Text(bagData.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                })
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            HStack(spacing: 10){
                VStack(alignment: .leading, spacing: 6){
                    Text("Price")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(bagData.price + " €")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                
                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //Herro animaiton
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }
            .padding()
            .padding(.top, 10)
            .zIndex(1)
            
            Spacer(minLength: 10)
            
            
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Color")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)

                        HStack(spacing: 15){
                            //Foreach with all colors available
                            ColorButton(color: Color(bagData.image), selectedColor: $selectedColor)

                            ColorButton(color: Color(.yellow), selectedColor: $selectedColor)

                            ColorButton(color: Color(.green), selectedColor: $selectedColor)

                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Size")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("12 cm")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    
                    
                }
                .padding(.horizontal)
                .padding(.top, -20)
                
                
                Text("Wheater you are heading to work or travelling, a trendy handbag or clutch will add as the perfect accessory with your outfits. Carry your daily essentials in style as you have a choice of shopping for bags.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                HStack(spacing: 20){
                    
                    Button(action: {
                        if count > 1{
                            count -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .frame(width: 35, height: 35)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                            )
                    })
                    
                    Text("\(count)")
                        .font(.title2)
                    
                    Button(action: {
                        count += 1
                        
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .frame(width: 35, height: 35)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                            )
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "suit.heart.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.red)
                            .clipShape(Circle())
                    })
                    
                }
                .padding(.horizontal)
                
                
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }, label: {
                    
                    Text("Buy now")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color(bagData.image))
                        .clipShape(Capsule())
                    
                })
                .padding(.top)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
                
            }
            .background(
                Color.white
                    .clipShape(CustomCorner())
                    .padding(.top, -100)
            )
            .zIndex(0)
        }
        .background(Color(bagData.image).ignoresSafeArea(.all, edges: .top))
        .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        .onAppear {
            //First color is image or bag color...
            selectedColor = Color(bagData.image)
        }
    }
}
