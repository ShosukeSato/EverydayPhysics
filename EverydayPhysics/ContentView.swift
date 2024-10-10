import SwiftUI

// カスタムカラーの定義（あなたのアセットに合わせて変更してください）
extension Color {
    static let themeBackground = Color("Background")
    static let themeForeground = Color("Foreground")
    static let themeAccent = Color("Accent")
}



//ここから代替コード
struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("基本計算")) {
                    NavigationLink(destination: CalculationDetailView(calculationType: "時速→秒速")) {
                        VStack(alignment: .leading) {
                            Text("時速→秒速")
                                .font(.headline)
                            Text("時速を秒速に変換します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: CalculationDetailView(calculationType: "速度")) {
                        VStack(alignment: .leading) {
                            Text("速度")
                                .font(.headline)
                            Text("距離と時間から速度を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: CalculationDetailView(calculationType: "加速度")) {
                        VStack(alignment: .leading) {
                            Text("加速度")
                                .font(.headline)
                            Text("速度の変化と時間から加速度を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: CalculationDetailView(calculationType: "力")) {
                        VStack(alignment: .leading) {
                            Text("力")
                                .font(.headline)
                            Text("質量と加速度から力を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    // 他の基本計算項目を同様に追加...
                }

                Section(header: Text("自由落下")) {
                    NavigationLink(destination: CalculationDetailView(calculationType: "自由落下 (時間)")) {
                        VStack(alignment: .leading) {
                            Text("自由落下 (時間)")
                                .font(.headline)
                            Text("時間から自由落下の距離を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: CalculationDetailView(calculationType: "自由落下 (距離)")) {
                        VStack(alignment: .leading) {
                            Text("自由落下 (距離)")
                                .font(.headline)
                            Text("距離から自由落下の時間を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: CalculationDetailView(calculationType: "自由落下 (速度)")) {
                        VStack(alignment: .leading) {
                            Text("自由落下 (速度)")
                                .font(.headline)
                            Text("時間から自由落下の速度を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: CalculationDetailView(calculationType: "自由落下のエネルギー")) {
                        VStack(alignment: .leading) {
                            Text("自由落下のエネルギー")
                                .font(.headline)
                            Text("高さから自由落下のエネルギーを計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    // 他の自由落下項目を同様に追加...
                }

                Section(header: Text("放物運動")) {
                    NavigationLink(destination: CalculationDetailView(calculationType: "放物運動 (初速・角度)")) {
                        VStack(alignment: .leading) {
                            Text("放物運動 (初速・角度)")
                                .font(.headline)
                            Text("初速と角度から放物運動の軌跡を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    NavigationLink(destination: CalculationDetailView(calculationType: "放物運動 (角度・距離)")) {
                        VStack(alignment: .leading) {
                            Text("放物運動 (角度・距離)")
                                .font(.headline)
                            Text("角度と距離から放物運動の初速を計算します")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    // 他の放物運動項目を同様に追加...
                }
            }
            .navigationBarTitle("Physics Calculations", displayMode: .inline)
        }
    }
}
//ここまで


struct CalculationDetailView: View {
    var calculationType: String
    @State private var input1: String = ""
    @State private var input2: String = ""
    @State private var result: String = ""
    
    var body: some View {
        Form {
            TextField(inputPlaceholder1(), text: $input1)
                .keyboardType(.decimalPad)
            TextField(inputPlaceholder2(), text: $input2)
                .keyboardType(.decimalPad)
            
            Button("Calculate") {
                performCalculation()
            }
            
            Text(result)
                .bold()
        }
        .navigationBarTitle(calculationType)
    }
    
    private func inputPlaceholder1() -> String {
        switch calculationType {
        case "速度":
            return "Distance (m)"
        case "加速度":
            return "Velocity (m/s)"
        case "力":
            return "Mass (kg)"
        case "時速→秒速":
            return "Speed (km/h)"
        case "自由落下 (時間)":
            return "Time (s)"
        case "自由落下 (距離)":
            return "Distance (m)"
        case "自由落下 (速度)":
            return "Time (s)"
        case "自由落下のエネルギー":
            return "Mass (kg)"
        case "放物運動 (初速・角度)":
            return "Initial Velocity (m/s)"
        case "放物運動 (角度・距離)":
            return "Angle (degrees)"
        
            // 他の新しい項目に対するプレースホルダーもここに追加
        default:
            return "Input 1"
        }
    }
    
    private func inputPlaceholder2() -> String {
        switch calculationType {
        case "速度":
            return "Time (s)"
        case "加速度":
            return "Time (s)"
        case "力":
            return "Acceleration (m/s²)"
        case "時速→秒速":
            return "" // 第二の入力は不要なので空文字を返す
        case "自由落下 (時間)", "自由落下 (距離)", "自由落下 (速度)":
            return "" // 第二の入力は不要
        case "自由落下のエネルギー":
            return "Height (m)"
        case "放物運動 (初速・角度)":
            return "Angle (degrees)"
        case "放物運動 (角度・距離)":
            return "Distance (m)"
        
            // 他の新しい項目に対するプレースホルダーもここに追加
        default:
            return "Input 2"
        }
    }
    
    
    
    private func performCalculation() {
        guard let value1 = Double(input1) else {
            result = "Invalid Input"
            return
        }
        
        let gravity = 9.81 // 重力加速度 (m/s^2)
        
        if !["時速→秒速", "自由落下 (時間)", "自由落下 (距離)", "自由落下 (速度)"].contains(calculationType) {
            guard let value2 = Double(input2) else {
                result = "Invalid Input"
                return
            }
            
            switch calculationType {
            case "速度":
                if let velocity = calculateVelocity(distance: value1, time: value2) {
                    result = "Result: \(velocity) m/s"
                } else {
                    result = "Error"
                }
            case "加速度":
                if let acceleration = calculateAcceleration(velocity: value1, time: value2) {
                    result = "Result: \(acceleration) m/s²"
                } else {
                    result = "Error"
                }
            case "力":
                let force = calculateForce(mass: value1, acceleration: value2)
                result = "Result: \(force) N"
                
            case "放物運動 (初速・角度)":
                let initialVelocity = value1
                let angleDegrees = value2
                let angleRadians = angleDegrees * .pi / 180 // 度からラジアンへ変換
                let maxHeight = (initialVelocity * initialVelocity * sin(angleRadians) * sin(angleRadians)) / (2 * gravity)
                let range = (initialVelocity * initialVelocity * sin(2 * angleRadians)) / gravity
                result = "Max Height: \(maxHeight) m, Range: \(range) m"
                
            case "自由落下のエネルギー":
                guard let height = Double(input2) else {
                    result = "Invalid Input"
                    return
                }
                let energy = value1 * gravity * height
                result = "Potential Energy: \(energy) Joules"
                


            case "放物運動 (角度・距離)":
                let angleDegrees = value1
                let angleRadians = angleDegrees * .pi / 180 // 度からラジアンへ変換
                let distance = value2
                // ここで角度と距離から初速を計算
                let initialVelocity = sqrt(distance * gravity / sin(2 * angleRadians))
                result = "Initial Velocity: \(initialVelocity) m/s"


            
                
                // 他のケース...
                
            default:
                result = "Invalid Calculation Type"
            }
        } else {
            // 他の計算タイプ
            switch calculationType {
            case "時速→秒速":
                let metersPerSecond = convertKmPerHourToMetersPerSecond(kmPerHour: value1)
                result = "Result: \(metersPerSecond) m/s"
                
            case "自由落下 (時間)":
                let time = value1
                let distance = 0.5 * gravity * time * time
                result = "Distance: \(distance) m"
                
            case "自由落下 (距離)":
                let distance = value1
                let time = sqrt(2 * distance / gravity)
                result = "Time: \(time) s"
                
            case "自由落下 (速度)":
                let time = value1
                let velocity = gravity * time
                result = "Final Velocity: \(velocity) m/s"
                
                // 他のケース...
                
            default:
                result = "Invalid Calculation Type"
            }
        }
    }
    
    
    // ここに計算関数を挿入（calculateVelocity, calculateAcceleration, calculateForce）
    func calculateVelocity(distance: Double, time: Double) -> Double? {
        return time != 0 ? distance / time : nil
    }
    
    func calculateAcceleration(velocity: Double, time: Double) -> Double? {
        return time != 0 ? velocity / time : nil
    }
    
    func calculateForce(mass: Double, acceleration: Double) -> Double {
        return mass * acceleration
    }
    
    func convertKmPerHourToMetersPerSecond(kmPerHour: Double) -> Double {
        return kmPerHour / 3.6
    }
    
    
    // プレビュー
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
