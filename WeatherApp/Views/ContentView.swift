import SwiftUI


struct ContentView: View {
    
    @ObservedObject var cityVM = WeatherViewModel()

    var body: some View {

        ZStack(alignment: .bottom) {
            
            VStack(spacing: 0) {
                
                MenuHeaderView(cityVM: cityVM)
                    .padding()
                
                ScrollView(showsIndicators: false) {
                    
                    CityView(cityVM: cityVM)
                }
                .padding(.top, 10)
            }
            .padding(.top, 40)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.516669929, green: 0.6484552026, blue: 0.785002172, alpha: 1)), Color(#colorLiteral(red: 0.4026746154, green: 0.466473043, blue: 0.7496678829, alpha: 1))]), startPoint: .topLeading, endPoint: .topTrailing))
        .edgesIgnoringSafeArea(.all)
    }
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()
    }
}
