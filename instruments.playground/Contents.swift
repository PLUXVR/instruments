//Это класс Music, который инкапсулирует массив нашего свойства notes с типом String и позволяет задать поведение, в нашем примере мы добавили поведение, которое может соединить все приходящие данные в свойстве, в одну строку, это метод prepared().

class Music  {
    let notes: [String]
 
    init(notes: [String])  {
        self.notes = notes
    }

    func prepared() -> String  {
        return notes.joined(separator: " ")
    }
}

class Instrument {
    let brand: String
    
    init (brand: String){
        self.brand = brand
    }
    
    func tune() -> String {
        fatalError("Implement this method for \(brand)")
     }
    
    func play(_ music: Music) -> String {
        return music.prepared()
    }
    
    func perform(_ music: Music){
        print(tune())
        print(play(<#T##music: Music##Music#>))
    }
        
    class Piano:  Instrument  {
        let hasPedals: Bool
        // 2
        static let whiteKeys = 52
        static let blackKeys = 36
        // 3
        init(brand: String, hasPedals: Bool = false) {
               self.hasPedals = hasPedals
           // 4
           super.init(brand: brand)
        }
        // 5
            override func tune() -> String {
            return "Piano standard tuning for \(brand)."
        }
        override func play(_ music: Music) -> String {
        // 6
            let preparedNotes = super.play(music)
            //return "Piano playing \(preparedNotes)"
            return play(music, usingPedals: hasPedals)
        }
        
        func play(_ music: Music, usingPedals: Bool) -> String {
            let preparedNotes = super.play(music)
            if hasPedals && usingPedals {
                return "Play piano notes \(preparedNotes) with pedals."
            } else {
                return "Play piano notes \(preparedNotes) without pedals."
            }
        }
    }
    
    // 1
    let piano = Piano(brand: "Yamaha", hasPedals: true)
    piano.tune()
    // 2
    let music = Music(notes: ["C", "G", "F"])
    piano.play(music, usingPedals: false)
    // 3
    piano.play(music)
    // 4
    Piano.whiteKeys
    Piano.blackKeys
}
