protocol Renderable {
    func render() -> String
}

extension Array where Element == H5InnerNode {
    func render() -> String {
        self.map {
            switch $0 { // TODO: raw
            case let text as String:
                return sanitizeText(text)
            case let comment as Comment:
                return escapeComment(comment.content)
            case let element as Renderable:
                return element.render()
            default:
                fatalError()
            }
        }.joined(separator: "")
    }
}

extension Array where Element: H5ElementAttribute {
    func render() -> String {
        self.map {
            if let value = $0.value {
                return $0.key + "=\"" + quoteAttributeValue(value) + "\""
            }
            return $0.key
        }.joined(separator: " ")
    }
}
