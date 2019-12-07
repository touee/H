import XCTest
@testable import H

final class HTests: XCTestCase {
    func testSimple() {
        
        let html = HTML5(.lang("en")) {[
            Head {[
                    Title { ["Demo"] },
                    JS$("static/js/demo.js"),
                    Link(.rel("stylesheet"), .href("static/css/demo.css"), .init(key: "foo", value: "bar")),
            ]},
            Body {[
                Article {[
                    H1 { ["hello"] },
                    P { ["hello", Span(.style(.color(.blue))) { ["world"] }] },
                ]}
            ]}
        ]}
        
        XCTAssertEqual(html.document.render(), #"<!DOCTYPE html><html lang="en"><head><title>Demo<title/><script src="static/js/demo.js" type="text/javascript"/><link rel="stylesheet" href="static/css/demo.css" foo="bar"/><head/><body><article><h1>hello<h1/><p>hello<span style="color: blue">world<span/><p/><article/><body/><html/>"#)
    }

    static var allTests = [
        ("testSimple", testSimple),
    ]
}
