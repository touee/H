struct HTML5: H5RootElement {
    static var name: String = "html"
    struct Attribute: H5RootElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5Node]?
}
extension HTML5.Attribute {
    static func lang(_ value: String) -> Self {
        return .init(key: "lang", value: value)
    }
}

extension HTML5 {
    var document: H5Document<Self> {
        H5Document(root: self)
    }
}
