import UIKit

enum CelluralFillCellState: String {
    case life = "🐣"
    case lively = "💥"
    case dead = "💀"
    
    var background: [UIColor] {
        switch self {
        case .life:
            return [UIColor.lifeFrom, UIColor.lifeTo]
        case .lively:
            return [UIColor.livelyFrom, UIColor.livelyTo]
        case .dead:
            return [UIColor.deadFrom, UIColor.deadTo]
        }
    }
    
    var title: String {
        switch self {
        case .life:
            return "Жизнь"
        case .lively:
            return "Живая"
        case .dead:
            return "Мертвая"
        }
    }
    
    var description: String {
        switch self {
        case .life:
            return "Ку-ку!"
        case .lively:
            return "и шевелится!"
        case .dead:
            return "или прикидывается"
        }
    }
}

extension CelluralFillCellState {
    static func randomState() -> CelluralFillCellState {
        return Bool.random() ? .lively : .dead
    }
}
