struct CSSDeclaration {
    var property: String
    var value: StyleValue
}
enum StyleValue {
    case string(String)
}
extension CSSDeclaration {
    func render() -> String {
        self.property + ": " + { () -> String in
            switch self.value {
            case .string(let string):
                return string
            }
        }()
    }
}

extension Array where Element == CSSDeclaration {
    func render() -> String {
        self.map { $0.render() }.joined(separator: "; ")
    }
}
extension CSSDeclaration {
    static func color(_ value: String) -> Self {
        return .init(property: "color", value: .string(value))
    }
    static func color(_ color: HTMLColor) -> Self {
        return .init(property: "color", value: .string(color.name))
    }
}
struct HTMLColor {
    var name: String
}
extension HTMLColor {
    static var blue: Self {
        return .init(name: "blue")
    }
}
