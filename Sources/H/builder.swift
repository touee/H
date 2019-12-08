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
    static func buildEither(first: H5Node) -> H5Node {
        return first
    }
    static func buildEither(second: H5Node) -> H5Node {
        return second
    }
}

struct H5NodeList {
    var nodes: [H5Node]
}
extension H5NodeList: H5Node {}

func ForEach<Iter: IteratorProtocol>(_ iter: Iter, @BodyBuilder body: (Iter.Element) -> H5Node) -> H5Node {
    var iter = iter
    var list = [H5Node]()
    while let x = iter.next() {
        list += [body(x)]
    }
    return H5NodeList(nodes: list)
}
func ForEach<Iter: Sequence>(_ seq: Iter, @BodyBuilder body: (Iter.Element) -> H5Node) -> H5Node {
    var iter = seq.makeIterator()
    var list = [H5Node]()
    while let x = iter.next() {
        list += [body(x)]
    }
    return H5NodeList(nodes: list)
}

struct EmptyNode {}
extension EmptyNode: H5Node {}
