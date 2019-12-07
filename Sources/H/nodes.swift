protocol H5Node: Renderable {}

protocol H5Element: H5Node {
    associatedtype Attribute: H5ElementAttribute
    static var name: String { get }
    var attributes: [Attribute] { get set }
    var body: [H5Node]? { get set }
    init(attributes: [Attribute], body: [H5Node]?)
}
protocol H5ElementAttribute {
    var key: String { get set }
    var value: String? { get set }
    init(key: String, value: String?)
}
extension H5ElementAttribute {
    // Instead of use .init directly, we have to use this function to create custom attribute.
    // Otherwise, the compiler would complain: `Type of expression is ambiguous without more context`
    static func attr$(key: String, value: String) -> Self {
        return Self.init(key: key, value: value)
    }
}
extension H5Element {
    init(_ attributes: [Self.Attribute], @BodyBuilder bodyBuilder: () -> H5Node) {
        self.init(attributes: attributes, body: [bodyBuilder()])
    }
    init(_ attributes: [Self.Attribute]) {
        self.init(attributes: attributes, body: nil)
    }
    @inlinable
    init(_ attributes: Self.Attribute..., @BodyBuilder bodyBuilder: () -> H5Node) {
        self.init(attributes, bodyBuilder: bodyBuilder)
    }
    @inlinable
    init(_ attributes: Self.Attribute...) {
        self.init(attributes)
    }
}

extension H5Element {
    func render() -> String {
        let openTagContent: String
        if self.attributes.count > 0 {
            openTagContent = Self.name + " " + self.attributes.render()
        } else {
            openTagContent = Self.name
        }
        if let body = self.body {
            return "<" + openTagContent + ">" + body.render() + "<" + Self.name + "/>"
        } else {
            return "<" + openTagContent + "/>"
        }
    }
}

struct H5Document<T: H5RootElement> {
    var root: T
}
extension H5Document: Renderable {
    func render() -> String {
        "<!DOCTYPE html>" + self.root.render()
    }
}
protocol H5RootElement: H5Element {}

extension String: H5Node {
    func render() -> String {
        return sanitizeText(self)
    }
}
struct Comment: H5Node {
    var content: String
    init(_ content: String) {
        self.content = content
    }
    func render() -> String {
        return escapeComment(self.content)
    }
}

protocol H5RootElementAttribute: H5ElementAttribute {}
