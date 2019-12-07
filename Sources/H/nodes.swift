protocol H5Node: Renderable {}

protocol H5Element: Renderable {
    associatedtype Attribute: H5ElementAttribute
    static var name: String { get }
    var attributes: [Attribute] { get set }
    var body: [H5InnerNode]? { get set }
    init(attributes: [Attribute], body: [H5InnerNode]?)
}
protocol H5ElementAttribute {
    var key: String { get set }
    var value: String? { get set }
    init(key: String, value: String?)
}
extension H5Element {
    init(_ attributes: [Self.Attribute], @BodyBuilder bodyBuilder: () -> [H5InnerNode]) {
        self.init(attributes: attributes, body: bodyBuilder())
    }
    init(_ attributes: [Self.Attribute]) {
        self.init(attributes: attributes, body: nil)
    }
    @inlinable
    init(_ attributes: Self.Attribute..., @BodyBuilder bodyBuilder: () -> [H5InnerNode]) {
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
protocol H5RootElement: H5Element {}
extension H5Document: Renderable {
    func render() -> String {
        "<!DOCTYPE html>" + self.root.render()
    }
}

protocol H5InnerNode: H5Node {}
protocol H5InnerElement: H5Element, H5InnerNode {}
extension String: H5InnerNode {
    func render() -> String {
        return sanitizeText(self)
    }
}
struct Comment: H5InnerNode {
    var content: String
    init(_ content: String) {
        self.content = content
    }
    func render() -> String {
        return escapeComment(self.content)
    }
}

protocol H5RootElementAttribute: H5ElementAttribute {}
protocol H5InnerElementAttribute: H5ElementAttribute {}
