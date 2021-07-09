//
//  ContentView.swift
//  281016App
//
//  Created by 田中俊多 on 2021/05/13.
//

import SwiftUI
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport




extension UIApplication {
    //キーボード閉じる
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView: View {
    
    
    @State private var showingAlert = false
    
    @State var str10: String = ""
    @State var str2: String = ""
    @State var str8: String = ""
    @State var str16: String = ""
    
    @State var num10: Int = 0
   
    @State var messege10 = false
    @State var messege2 = false
    @State var messege8 = false
    @State var messege16 = false
    
    @State var count10 = 0
    @State var count2 = 0
    @State var count8 = 0
    @State var count16 = 0
    
    @State var screen: CGSize!
    
    init() {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
            GADMobileAds.sharedInstance().start(completionHandler: nil)
        })
    }
    
    var body: some View {
        
       
        VStack{
            HStack {
                
                if screen != nil {
                Text("10進数").padding(.horizontal, 0) .frame(width: 70)
                TextField("", text: $str10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 0.47*screen.width, height: 0.05*screen.height)
                }
                Button(action: {
                    if str10 != "" {
                    count10 = str10.count
                    if let num10 = Int(str10){
                        messege10 = false
                        messege8 = false
                        messege2 = false
                        messege16 = false
                        str2  = String(num10, radix: 2)
                        str8  = String(num10, radix: 8)
                        str16  = String(num10, radix: 16)
                        if count10 >= 16 {
                            messege10 = true
                        }
                    } else {
                        messege10 = true
                    }
                    }
                    else if str10 == "" {
                        str2 = ""
                        str8 = ""
                        str16 = ""
                    }
                }) {
                    Image(systemName: "arrow.forward")
                      
                    
                }
                .frame(width: 50)
                .foregroundColor(.white)
                .background(
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 33)
                        .cornerRadius(6, antialiased: true)
                )
            }
            .padding()
            if messege10 == true {
                Text("0~9の数字で15字以下で入力してください。")
                    .foregroundColor(Color.red)
                
            }
            HStack{
                if screen != nil {
                Text("2進数").padding(.horizontal, 0) .frame(width: 70)
                TextField("", text: $str2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 0.47*screen.width, height: 0.05*screen.height)
                }
                Button(action:{
                    if str2 != "" {
                    for letter2 in str2{
                        if (letter2 == "0" || letter2 == "1" ){
                            messege2 = false
                            if count2 >= 16 {
                                messege16 = true
                            }
                        }
                        else{
                            messege2 = true
                        }
                    }
                    if messege2 == false {
                        messege10 = false
                        messege8 = false
                        messege2 = false
                        messege16 = false
                        num10 = Int(str2, radix: 2)!
                        str10 = String(num10)
                        str8  = String(Int(str2, radix: 2)!, radix: 8)
                        str16 = String(Int(str2, radix: 2)!, radix: 16)
                        
                    }
                    }
                    else if str2 == "" {
                        str10 = ""
                        str8 = ""
                        str16 = ""
                    }
                }) {
                    Image(systemName: "arrow.forward")
                      
                    
                }
                .frame(width: 50)
                .foregroundColor(.white)
                .background(
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 33)
                        .cornerRadius(6, antialiased: true)
                )
            }
            .padding()
            if messege2 == true {
                Text("0,1の数字で15桁以下で入力してください。")
                    .foregroundColor(Color.red)
                
            }
            
            HStack{
                if screen != nil {
                Text("8進数").padding(.horizontal, 0) .frame(width: 70)
                TextField("", text: $str8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 0.47*screen.width, height: 0.05*screen.height)
                }
                Button(action: {
                    if str8 != "" {
                    count8 = str8.count
                    for letter8 in str8{
                        if(letter8 == "0" || letter8 == "1" || letter8 == "2" || letter8 == "3" || letter8 == "4" || letter8 == "5" || letter8 == "6" || letter8 == "7" ){
                            messege8 = false
                            if count8 >= 16 {
                                messege8 = true
                            }
                        } else {
                            messege8 = true
                        }
                        if messege8 == false{
                            messege10 = false
                            messege8 = false
                            messege2 = false
                            messege16 = false
                            num10 = Int(str8, radix: 8)!
                            str10 = String(num10)
                            str2  = String(Int(str8, radix: 8)!, radix: 2)
                            str16 = String(Int(str8, radix: 8)!, radix: 16)
                        }
                    }
                    }
                    else if str8 == "" {
                        str2 = ""
                        str10 = ""
                        str16 = ""
                    }
                }) {
                    Image(systemName: "arrow.forward")
                      
                    
                }
                .frame(width: 50)
                .foregroundColor(.white)
                .background(
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 33)
                        .cornerRadius(6, antialiased: true)
                )
            }
            .padding()
            if messege8 == true {
                Text("0~7の数字で15桁以下で入力してください。")
                    .foregroundColor(Color.red)
            }
            HStack{
                if screen != nil {
                Text("16進数").padding(.horizontal, 0) .frame(width: 70)
                TextField("", text: $str16)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 0.47*screen.width, height: 0.05*screen.height)
                }
                Button(action: {
                    if str16 != "" {
                    count16 = str16.count
                    for letter16 in str16 {
                        if(letter16 == "0" || letter16 == "1" || letter16 == "2" || letter16 == "3" || letter16 == "4" || letter16 == "5" || letter16 == "6" || letter16 == "7" || letter16 == "8" || letter16 == "9" || letter16 == "a" || letter16 == "b" || letter16 == "c" || letter16 == "d" || letter16 == "e" || letter16 == "f" || letter16 == "A" || letter16 == "B" || letter16 == "C" || letter16 == "D" || letter16 == "E" || letter16 == "F" ){
                         messege16 = false
                            if count16 >= 16 {
                                messege16 = true
                            }
                        } else {
                            messege16 = true
                        }
                    }
                    if messege16 == false {
                        messege10 = false
                        messege8 = false
                        messege2 = false
                        messege16 = false
                        num10 = Int(str16, radix: 16)!
                        str10 = String(num10)
                        str2  = String(Int(str16, radix: 16)!, radix: 2)
                        str8 = String(Int(str16, radix: 16)!, radix: 8)
                    }
                    }
                    else if str16 == ""{
                        str2 = ""
                        str10 = ""
                        str8 = ""
                    }
                }) {
                  Image(systemName: "arrow.forward")
                    
                }
                .frame(width: 50)
                .foregroundColor(.white)
                .background(
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 50, height: 33)
                        .cornerRadius(6, antialiased: true)
                )
            }
            .padding()
            if messege16 == true {
                Text("0~9,a~fで15桁以下で入力してください。")
                    .foregroundColor(Color.red)
            }
        }
        
        
//                       AdMobView()
//                           .frame(width: 150, height: 60)
                        
            
        
        .onAppear(){
                    screen = UIScreen.main.bounds.size
                }
        
    
        //キーボード背景タップで閉じる
        .gesture(
                  TapGesture()
                      .onEnded { _ in
                          UIApplication.shared.closeKeyboard()
                          
                  }
              )
        
        AdMobView()
            .frame(width: 150, height: 60)
}
    
}
//admob
struct AdMobView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<AdMobView>) -> GADBannerView{
        let banner = GADBannerView(adSize: kGADAdSizeBanner)

        banner.adUnitID = "ca-app-pub-6818460835033371/2125607214"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
      }
  }



//ここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

