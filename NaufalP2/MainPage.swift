//
//  MainPage.swift
//  NaufalP2
//
//  Created by Naufal Adli on 03/03/25.
//
import SwiftUI

struct MainPage: View {
    var colums = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        NavigationView{
            VStack{
                VStack(spacing: 30){
                    Image("calculator")
                        .resizable()
                        .frame(width: 100,height: 100)
                    
                    Text("Project Unit Konversi")
                        .font(.custom("", size: 25))
                        .bold()
                }
                
                VStack{
                    LazyVGrid(columns: colums, spacing: 25) {
                        NavigationLink(destination: KonfersiSuhu(), label: {
                            VStack(spacing: 10){
                                Image("temperature")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                
                                Text("Suhu")
                                    .font(.custom("", size: 16))
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal,40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.07), radius: 10, x: 0, y: 0)
                        })
                        
                        NavigationLink(destination: KonversiMassa(), label: {
                            VStack(spacing: 10){
                                Image("massa")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                
                                Text("Masa")
                                    .font(.custom("", size: 16))
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal,40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.07), radius: 10, x: 0, y: 0)
                        })
                        
                        NavigationLink(destination: KonversiLuas(), label: {
                            VStack(spacing: 10){
                                Image("wide")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                
                                Text("Luas")
                                    .font(.custom("", size: 16))
                                    .foregroundColor(.black)
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal,40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.07), radius: 10, x: 0, y: 0)
                        })
                        
                        NavigationLink(destination: KonversiJarak(), label: {
                            VStack(spacing: 10){
                                Image("measuring-tape")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                
                                Text("Jarak")
                                    .font(.custom("", size: 16))
                                    .foregroundColor(.black)
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal,40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.07), radius: 10, x: 0, y: 0)
                        })
                    }
                    .padding(.horizontal,30)
                }
                .padding(.top,40)
            }
        }
    }
}

