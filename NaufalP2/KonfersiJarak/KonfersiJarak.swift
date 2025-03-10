//
//  KonfersiJarak.swift
//  NaufalP2
//
//  Created by Naufal Adli on 10/03/25.
//

import SwiftUI

struct KonversiJarak: View {
    @State private var selectedItem: String = "m to km"
    @State private var number: String = ""
    @State private var result: String = "00"
    @State private var unit: String = ""
    
    let options = ["m to km", "m to cm", "m to mi", "m to ft", "km to m", "km to cm", "km to mi", "km to ft", "cm to m", "cm to km", "cm to mi", "cm to ft", "mi to m", "mi to km", "mi to cm", "mi to ft", "ft to m", "ft to km", "ft to cm", "ft to mi"]
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("measuring-tape") 
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text("Konversi Jarak")
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
                        convertDistance()
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
    
    private func convertDistance() {
        guard let inputNumber = Double(number) else {
            result = "Invalid input"
            unit = ""
            return
        }
        
        switch selectedItem {
        case "m to km":
            result = String(format: "%.4f", inputNumber / 1000)
            unit = "km"
        case "m to cm":
            result = String(format: "%.2f", inputNumber * 100)
            unit = "cm"
        case "m to mi":
            result = String(format: "%.4f", inputNumber / 1609.34)
            unit = "mi"
        case "m to ft":
            result = String(format: "%.2f", inputNumber * 3.28084)
            unit = "ft"
        case "km to m":
            result = String(format: "%.2f", inputNumber * 1000)
            unit = "m"
        case "km to cm":
            result = String(format: "%.2f", inputNumber * 100_000)
            unit = "cm"
        case "km to mi":
            result = String(format: "%.4f", inputNumber / 1.60934)
            unit = "mi"
        case "km to ft":
            result = String(format: "%.2f", inputNumber * 3280.84)
            unit = "ft"
        case "cm to m":
            result = String(format: "%.4f", inputNumber / 100)
            unit = "m"
        case "cm to km":
            result = String(format: "%.6f", inputNumber / 100_000)
            unit = "km"
        case "cm to mi":
            result = String(format: "%.6f", inputNumber / 160_934)
            unit = "mi"
        case "cm to ft":
            result = String(format: "%.4f", inputNumber / 30.48)
            unit = "ft"
        case "mi to m":
            result = String(format: "%.2f", inputNumber * 1609.34)
            unit = "m"
        case "mi to km":
            result = String(format: "%.4f", inputNumber * 1.60934)
            unit = "km"
        case "mi to cm":
            result = String(format: "%.2f", inputNumber * 160_934)
            unit = "cm"
        case "mi to ft":
            result = String(format: "%.2f", inputNumber * 5280)
            unit = "ft"
        case "ft to m":
            result = String(format: "%.4f", inputNumber / 3.28084)
            unit = "m"
        case "ft to km":
            result = String(format: "%.6f", inputNumber / 3280.84)
            unit = "km"
        case "ft to cm":
            result = String(format: "%.2f", inputNumber * 30.48)
            unit = "cm"
        case "ft to mi":
            result = String(format: "%.6f", inputNumber / 5280)
            unit = "mi"
        default:
            result = "Invalid selection"
            unit = ""
        }
    }
}

struct KonversiJarak_Previews: PreviewProvider {
    static var previews: some View {
        KonversiJarak()
    }
}
