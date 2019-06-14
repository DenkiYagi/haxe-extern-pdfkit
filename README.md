# Haxe extern definitions for [PDFKit](http://pdfkit.org/)

## Install

```
haxelib git pdfkit https://github.com/DenkiYagi/haxe-extern-pdfkit
```

If you use `pdfkit.standalone.js`, please add haxe compiler flag `-D pdfkit_standalone`.

## Requirements

Haxe 4.0.0-rc.3+

## Examples

```haxe
import js.pdfkit.PDFDocument;
import js.node.Fs;

class Main {
    static function main(): Void {
        final doc = new PDFDocument();
        doc.pipe(Fs.createWriteStream("output.pdf"));
        doc.text("Hello world!");
        doc.end();
    }
}
```
