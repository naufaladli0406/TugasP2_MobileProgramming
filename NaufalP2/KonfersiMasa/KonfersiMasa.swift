//
//  KonfersiMasa.swift
//  NaufalP2
//
//  Created by Naufal Adli on 10/03/25.
//

import SwiftUI

struct KonversiMassa: View {
    @State private var selectedItem: String = "kg to g"
    @State private var number: String = ""
    @State private var result: String = "00"
    @State private var unit: String = ""
    
    let options = ["kg to g", "kg to oz", "g to kg", "g to oz", "oz to kg", "oz to g"]
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("massa")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("Konversi Massa")
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
                        convertMass()
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
    
    private func convertMass() {
        guard let inputNumber = Double(number) else {
            result = "Invalid input"
            unit = ""
            return
        }
        
        switch selectedItem {
        case "kg to g":
            result = String(format: "%.2f", inputNumber * 1000)
            unit = "g"
        case "kg to oz":
            result = String(format: "%.2f", inputNumber * 35.274)
            unit = "oz"
        case "g to kg":
            result = String(format: "%.2f", inputNumber / 1000)
            unit = "kg"
        case "g to oz":
            result = String(format: "%.2f", inputNumber * 0.035274)
            unit = "oz"
        case "oz to kg":
            result = String(format: "%.2f", inputNumber * 0.0283495)
            unit = "kg"
        case "oz to g":
            result = String(format: "%.2f", inputNumber * 28.3495)
            unit = "g"
        default:
            result = "Invalid selection"
            unit = ""
        }
    }
}

struct KonversiMassa_Previews: PreviewProvider {
    static var previews: some View {
        KonversiMassa()
    }
}
