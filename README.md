# H

A toy poc HTML DSL in swift.

## comparison 

| aspect\project            | [swift-html](https://github.com/pointfreeco/swift-html)      | [Vaux](https://github.com/dokun1/Vaux)                       | [Plot](https://github.com/JohnSundell/Plot)                  | [H](https://github.com/touee/H)                              |
| ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| nodes                     | [enum](https://github.com/pointfreeco/swift-html/blob/master/Sources/Html/Node.swift) |                                                              | [generic enum](https://github.com/JohnSundell/Plot/blob/master/Sources/Plot/API/Node.swift) | [protocol](https://github.com/touee/H/blob/master/Sources/H/nodes.swift) |
| elements                  | [static function](https://github.com/pointfreeco/swift-html/blob/master/Sources/Html/Elements.swift) of `Node` | [global function](https://github.com/dokun1/Vaux/blob/master/Sources/Vaux/Builders.swift) | [static function](https://github.com/JohnSundell/Plot/blob/master/Sources/Plot/API/HTMLElements.swift) of specialized `Node<Context>` | [struct](https://github.com/touee/H/blob/master/Sources/H/elements.swift) conform `H5Element` |
| elements representation   | array                                                        | function builder                                             | array                                                        | function builder                                             |
| attributes                | [static function](https://github.com/pointfreeco/swift-html/blob/master/Sources/Html/Attributes.swift) of `Attribute` | [member](https://github.com/dokun1/Vaux/blob/master/Sources/Vaux/Attributes.swift) of `HTML` | [member](https://github.com/JohnSundell/Plot/blob/master/Sources/Plot/API/HTMLAttributes.swift) of specialized `Node<Context>` | [static function](https://github.com/touee/H/blob/master/Sources/H/elements.swift) of element's associatedtype |
| attributes representation | array parameter                                              | modifier                                                     | together with inner elements                                 | variadic parameters                                          |
|                           |                                                              |                                                              |                                                              |                                                              |
| useable                   | yes                                                          | yes                                                          | yes                                                          | no                                                           |
| without foundation?       | no                                                           | no                                                           | no                                                           | currently yes                                                |
| rendering                 | String concatenation                                         | `TextOutputStream`                                           | String concatenation                                         | String concatenation                                         |


