@_functionBuilder
struct BodyBuilder {
//    func buildExpression(_ node: H5Node) -> [H5Node] {
//        return [node]
//    }
    static func buildBlock(_ nodes: H5Node...) -> H5Node {
        return H5NodeList(nodes: nodes)
    }
    static func buildBlock(_ node: H5Node) -> H5Node {
        return node
    }
    static func buildBlock() -> H5Node {
        return H5NodeList(nodes: [])
    }
}

struct H5NodeList: H5Node {
    var nodes: [H5Node]
    
    func render() -> String {
        nodes.render()
    }
}
