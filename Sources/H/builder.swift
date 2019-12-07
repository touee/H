@_functionBuilder
struct BodyBuilder {
    func buildExpression(_ node: H5Node) -> [H5Node] {
        return [node]
    }
    func buildBlock(_ nodes: H5Node...) -> [H5Node] {
        return nodes
    }
}
