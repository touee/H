struct Head: H5InnerElement {
    static var name: String = "head"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension Head.Attribute {
}

struct Title: H5InnerElement {
    static var name: String = "title"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension Title.Attribute {
}

struct Script: H5InnerElement {
    static var name: String = "script"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension Script.Attribute {
    static func src(_ value: String) -> Self {
        return .init(key: "src", value: value)
    }
    static func type(_ value: String) -> Self {
        return .init(key: "type", value: value)
    }
}
func JS$(_ path: String) -> Script {
    return Script(.src(path), .type("text/javascript"))
}

struct Link: H5InnerElement {
    static var name: String = "link"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension Link.Attribute {
    static func rel(_ value: String) -> Self {
        return .init(key: "rel", value: value)
    }
    static func href(_ value: String) -> Self {
        return .init(key: "href", value: value)
    }
}
func CSS$(_ path: String) -> Link {
    return Link(.rel("stylesheet"), .href(path))
}

struct Body: H5InnerElement {
    static var name: String = "body"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension Body.Attribute {
}

struct Article: H5InnerElement {
    static var name: String = "article"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension Article.Attribute {
}

struct H1: H5InnerElement {
    static var name: String = "h1"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension H1.Attribute {
}

struct P: H5InnerElement {
    static var name: String = "p"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension P.Attribute {
}

struct Span: H5InnerElement {
    static var name: String = "span"
    struct Attribute: H5InnerElementAttribute { var key: String; var value: String? }
    var attributes: [Self.Attribute]
    var body: [H5InnerNode]?
}
extension Span.Attribute {
}
