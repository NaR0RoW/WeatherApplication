import SwiftUI


struct DailyWeatherView: View {
    
    @ObservedObject var cityVM: WeatherViewModel

    var body: some View {

        ForEach(cityVM.weatherModel.daily) { weather in
            
            LazyVStack {
                
                dailyCell(weather: weather)
            }
        }
    }
    
    private func dailyCell(weather: DailyWeather) -> some View {
        
        HStack {
            
            Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 50)
            
            Spacer()
            
            Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min)) ℃")
                .frame(width: 150)
            
            Spacer()
            
            cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.516669929, green: 0.6484552026, blue: 0.785002172, alpha: 1)), Color(#colorLiteral(red: 0.4026746154, green: 0.466473043, blue: 0.7496678829, alpha: 1))]), startPoint: .topLeading, endPoint: .topTrailing)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}


struct DailyWeatherView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()
    }
}
