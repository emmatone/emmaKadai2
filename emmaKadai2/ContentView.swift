//
//  ContentView.swift
//  emmaKadai2
//　課題2　足し算・引き算・掛け算・割り算アプリ
//
//  Created by Hitomi Ishiodori on 2022/12/18.
//

import SwiftUI

struct ContentView: View {

    @State var inputText1: String = ""
    @State var inputText2: String = ""

    enum calcType: String, CaseIterable, Identifiable {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "×"
        case division = "÷"
        var id: Self { self }
    }

    @State var selectedcalcType: calcType = .addition
    @State var resultText = "Label"

    var body: some View {
        VStack(spacing: 15) {
            Text("課題2\n足し算・引き算・掛け算・割り算アプリ")
                .font(.headline)

            //数字入力テキストフィールド
            Group {
                TextField("", text: $inputText1)
                TextField("", text: $inputText2)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
            .frame(width: 180)

            //計算方法ピッカー
            Picker("calcType", selection: $selectedcalcType) {
                ForEach(calcType.allCases) { type in
                    Text(type.rawValue)
                }
            }
            .colorMultiply(.blue)
            .pickerStyle(.segmented)
            .frame(width: 180)

            // 計算ボタン
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                // 入力
                let inputNumber1 = Double(inputText1) ?? 0
                let inputNumber2 = Double(inputText2) ?? 0

                // 処理
                switch selectedcalcType {
                case .addition :
                    resultText = String(inputNumber1 + inputNumber2)
                case .subtraction :
                    resultText = String(inputNumber1 - inputNumber2)
                case .multiplication:
                    resultText = String(inputNumber1 * inputNumber2)
                case .division:
                    if inputNumber2 == 0 {
                        resultText = "割る数には0以外を入力して下さい"
                    } else {
                        resultText = String(inputNumber1 / inputNumber2)
                    }
                }
            }
            .buttonStyle(.borderedProminent)

            // 計算結果表示テキストフィールド
            Text("\(resultText)")
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
