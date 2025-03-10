//
//  KonfersiLuas.swift
//  NaufalP2
//
//  Created by Naufal Adli on 10/03/25.
//

import SwiftUI

struct KonversiLuas: View {
    @State private var selectedItem: String = "m² to km²"
    @State private var number: String = ""
    @State private var result: String = "00"
    @State private var unit: String = ""
    
    let options = ["m² to km²", "m² to ha", "m² to a", "km² to m²", "km² to ha", "km² to a", "ha to m²", "ha to km²", "ha to a", "a to m²", "a to km²", "a to ha"]
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("wide") 
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("Konversi Luas")
                    .font(.custom("", size: 25))
                    .bold()
            }
            .padding(.bottom, 20)
            
            VStack(spacing: 10) {
                HStack {
                    HStack {
                        Text("Pilih Konversi")
                            .font(.custom("", size: 18))
                        Spacer()
                        Text(":")
                            .font(.custom("", size: 18))
                    }
                    
                    HStack {
                        Menu {
                            ForEach(options, id: \.self) { option in
                                Button(action: { selectedItem = option }) {
                                    Text(option)
                                        .foregroundColor(.black)
                                }
                            }
                        } label: {
                            Text(selectedItem)
                                .foregroundColor(.black)
                                .font(.custom("", size: 18))
                            Spacer()
                            Image(systemName: "chevron.down")
                                          .foregroundColor(.black)
                                          .font(.system(size: 14))
                        }
                      
                    }
                }
                .padding(.top, 20)
                
                HStack {
                    HStack {
                        Text("Masukan Angka")
                            .font(.custom("", size: 18))
                        Spacer()
                        Text(":")
                            .font(.custom("", size: 18))
                    }
                    
                    HStack {
                        VStack {
                            TextField("", text: $number)
                                .font(.custom("", size: 16))
                                .keyboardType(.numberPad)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.top, 10)
                
                HStack {
                    Spacer()
                    Button(action: {
                        convertArea()
                    }, label: {
                        Text("Hitung")
                            .font(.custom("", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .background(Color("purple"))
                            .cornerRadius(20)
                    })
                    .padding(.trailing, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                
                HStack {
                    HStack {
                        Text("Hasilnya")
                            .font(.custom("", size: 18))
                        Spacer()
                        Text(":")
                            .font(.custom("", size: 18))
                    }
                    
                    HStack {
                        Text("\(result) \(unit)")
                            .font(.custom("", size: 18))
                        Spacer()
                    }
                }
                .padding(.top, 5)
                .padding(.top, 10)
            }
            .padding(.horizontal, 30)
        }
        .padding(.bottom, 40)
    }
    
    private func convertArea() {
        guard let inputNumber = Double(number) else {
            result = "Invalid input"
            unit = ""
            return
        }
        
        switch selectedItem {
        case "m² to km²":
            result = String(format: "%.6f", inputNumber / 1_000_000)
            unit = "km²"
        case "m² to ha":
            result = String(format: "%.4f", inputNumber / 10_000)
            unit = "ha"
        case "m² to a":
            result = String(format: "%.2f", inputNumber / 100)
            unit = "a"
        case "km² to m²":
            result = String(format: "%.2f", inputNumber * 1_000_000)
            unit = "m²"
        case "km² to ha":
            result = String(format: "%.2f", inputNumber * 100)
            unit = "ha"
        case "km² to a":
            result = String(format: "%.2f", inputNumber * 10_000)
            unit = "a"
        case "ha to m²":
            result = String(format: "%.2f", inputNumber * 10_000)
            unit = "m²"
        case "ha to km²":
            result = String(format: "%.6f", inputNumber / 100)
            unit = "km²"
        case "ha to a":
            result = String(format: "%.2f", inputNumber * 100)
            unit = "a"
        case "a to m²":
            result = String(format: "%.2f", inputNumber * 100)
            unit = "m²"
        case "a to km²":
            result = String(format: "%.6f", inputNumber / 10_000)
            unit = "km²"
        case "a to ha":
            result = String(format: "%.4f", inputNumber / 100)
            unit = "ha"
        default:
            result = "Invalid selection"
            unit = ""
        }
    }
}

struct KonversiLuas_Previews: PreviewProvider {
    static var previews: some View {
        KonversiLuas()
    }
}
