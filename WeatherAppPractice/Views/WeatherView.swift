//
//  WeatherView.swift
//  WeatherAppPractice
//
//  Created by Arbab Husain on 6/11/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack(){
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name).bold().font(.largeTitle)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                    Spacer()
                    
                    VStack{
                        
                        HStack{
                            VStack(spacing: 20){
                                Image(systemName: "cloud" ).font(.system(size: 40))
                                
                                Text(weather.weather[0].main).bold().font(.largeTitle)
                                
                            }.frame(width: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feels_like.roundDouble() + "°").font(.system(size: 75)).fontWeight(.bold).padding()
                        }
                        Spacer()
                            .frame(height: 80)
                        Image(systemName: "house").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                        Spacer()
                        
                    }.frame(maxWidth: .infinity)
                    
                }.padding().frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack{
            Spacer()
            VStack(alignment: .leading, spacing: 20){
                Text("Weather today:").fontWeight(.bold).padding(.bottom).font(.title)
                HStack{
                    VStack{
                        Text("Lowest Temp").bold()
                        Text(weather.main.temp_min.roundDouble()).font(.title).fontWeight(.bold)
                    }.multilineTextAlignment(.center)
                    Spacer()
                    VStack{
                        Text("Highest Temp").bold()
                        Text(weather.main.temp_max.roundDouble()).font(.title).fontWeight(.bold)
                    }.multilineTextAlignment(.center)

                }
                HStack{
                    VStack{
                        Text("Pressure").bold()
                        Text(weather.main.pressure.roundDouble()).font(.title).fontWeight(.bold)
                    }.multilineTextAlignment(.center)
                    Spacer()
                    VStack{
                        Text("Humidity").bold()
                        Text(weather.main.humidity.roundDouble() + "%").font(.title).fontWeight(.bold)
                    }.multilineTextAlignment(.center)

                }
            }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom, 20).foregroundColor(Color(.systemIndigo)).background(.white).cornerRadius(20
            )
                
            }
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(.systemIndigo)).preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
