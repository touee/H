extension H5ElementAttribute {
    static func style(_ value: String) -> Self {
        return .init(key: "style", value: value)
    }
    static func style(_ css: [CSSDeclaration]) -> Self {
        return .init(key: "style", value: css.render())
    }
    @inlinable
    static func style(_ css: CSSDeclaration...) -> Self {
        return self.style(css)
    }
}
