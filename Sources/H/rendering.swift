protocol Renderable {
    func render() -> String
}

extension H5Document: Renderable {
    func render() -> String {
        "<!DOCTYPE html>" + self.root.render()
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
            return "<" + openTagContent + ">" + body.render() + "</" + Self.name + ">"
        } else {
            return "<" + openTagContent + "/>"
        }
    }
}

extension String: Renderable {
    func render() -> String {
        return sanitizeText(self)
    }
}

extension Comment: Renderable {
    func render() -> String {
        return escapeComment(self.content)
    }
}

extension Array where Element == H5Node {
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

extension H5NodeList: Renderable {
    func render() -> String {
        nodes.render()
    }
}

extension EmptyNode: Renderable {
    func render() -> String { "" }
}
