import UIKit

extension UIColor {
    static var deadTo: UIColor = {
        UIColor(named: "deadLinearTo") ?? .green
    }()
    
    static var deadFrom: UIColor = {
        UIColor(named: "deadLinearFrom") ?? .cyan
    }()
    
    static var lifeTo: UIColor = {
        UIColor(named: "lifeLinearTo") ?? .white
    }()
    
    static var lifeFrom: UIColor = {
        UIColor(named: "lifeLinearFrom") ?? .systemYellow
    }()
    
    static var livelyTo: UIColor = {
        UIColor(named: "livelyLinearTo") ?? .systemPink
    }()
    
    static var livelyFrom: UIColor = {
        UIColor(named: "livelyLinearFrom") ?? .systemPurple
    }()
}
