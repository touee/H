import XCTest
@testable import H

final class HTests: XCTestCase {
    func testSimple() {
        
        let html = HTML5(.lang("en")) {
            Head {
                Title { "Demo" }
                JS$("static/js/demo.js")
                Link(.rel("stylesheet"), .href("static/css/demo.css"), .attr$(key: "foo", value: "bar"), .emptyAttr$(key: "test"))
            }
            Body {
                Article {
                    if true {
                        H1 { "hello" }
                    } else {
                        H1 { "bye-bye" }
                    }
                    P {
                        "hello"
                        Span(.style(.color(.blue))) { "world" }
                    }
                    ForEach(0..<5) { i in
                        if i % 2 == 0 {
                            P { "\(i)" }
                        } else {
                            EmptyNode()
                        }
                    }
                }
            }
        }
        
        XCTAssertEqual(html.document.render(), #"<!DOCTYPE html><html lang="en"><head><title>Demo</title><script src="static/js/demo.js" type="text/javascript"/><link rel="stylesheet" href="static/css/demo.css" foo="bar" test/></head><body><article><h1>hello</h1><p>hello<span style="color: blue">world</span></p><p>0</p><p>2</p><p>4</p></article></body></html>"#)
    }

    static var allTests = [
        ("testSimple", testSimple),
    ]
}
