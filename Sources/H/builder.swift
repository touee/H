@_functionBuilder
struct BodyBuilder {
    func buildExpression(_ node: H5InnerNode) -> [H5InnerNode] {
        return [node]
    }
    func buildBlock(_ nodes: H5InnerNode...) -> [H5InnerNode] {
        return nodes
    }
}
