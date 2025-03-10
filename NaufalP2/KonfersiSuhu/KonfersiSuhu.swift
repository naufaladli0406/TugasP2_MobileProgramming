//
//  KonfersiSuhu.swift
//  NaufalP2
//
//  Created by Naufal Adli on 05/03/25.
//
import SwiftUI

struct KonfersiSuhu: View {
    @State private var selectedItem: String = "Cel to Re"
    @State private var number: String = ""
    @State private var result: String = "00"
    @State private var unit: String = "" 
    
    let options = ["Cel to Re", "Cel to Far", "Re to Cel", "Re to Far"]
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("temperature")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("Konfersi Suhu")
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
                        convertTemperature()
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
        .padding(.bottom,40)

    }
    
    private func convertTemperature() {
        guard let inputNumber = Double(number) else {
            result = "Invalid input"
            unit = ""
            return
        }
        
        switch selectedItem {
        case "Cel to Re":
            result = String(format: "%.2f", (4.0 / 5.0) * inputNumber)
            unit = "Re"
        case "Cel to Far":
            result = String(format: "%.2f", (9.0 / 5.0) * inputNumber + 32)
            unit = "F"
        case "Re to Cel":
            result = String(format: "%.2f", (5.0 / 4.0) * inputNumber)
            unit = "C"
        case "Re to Far":
            result = String(format: "%.2f", (9.0 / 4.0) * inputNumber + 32)
            unit = "F"
        default:
            result = "Invalid selection"
            unit = ""
        }
    }
}

struct KonfersiSuhu_Previews: PreviewProvider {
    static var previews: some View {
        KonfersiSuhu()
    }
}
