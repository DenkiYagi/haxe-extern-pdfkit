package js.pdfkit;

import haxe.extern.EitherType;
import haxe.extern.Rest;
import js.lib.ArrayBuffer;
import js.lib.Uint8Array;
import js.node.Buffer;
import js.node.stream.Readable;

/**
 * PDFDocument - represents an entire PDF document
 */
#if pdfkit_standalone
@:native("PDFDocument")
#else
@:jsRequire("pdfkit")
#end
extern class PDFDocument extends Readable<PDFDocument> {
    /**
     * Creates a document.
     */
    function new(?options: PDFDocumentNewOptions);

    /**
     * Adds a new page.
     */
    function addPage(options: PDFPageOptions): PDFDocument;

    /**
     * Returns the range of pages that are currently buffered.
     */
    function bufferedPageRange(): PDFBufferedPageRange;

    /**
     * Switchs to a previous page (page numbers start at 0).
     */
    function switchToPage(n: Int): Void;

    /**
     * Manually flushs pages that have been buffered.
     */
    function flushPages(): Void;

    /**
     * Adds a named destination.
     */
    @:overload(function (name: String): Void {})
    function addNamedDestination(name: String, type: String, args: Rest<EitherType<String, Float>>): Void;

    /**
     * Creates a PDFReference.
     */
    function ref(?data: {}): PDFReference;

    @:overload(function(chunk: String): PDFDocument {})
    function addContent(data: Buffer): PDFDocument;

    /**
     * Finalizes the PDF and end the stream.
     */
    function end(): Bool;

    // mixin(ColorMixin)
    /**
     * Sets the fill color and opacity.
     */
    function fillColor(color: PDFColor, ?opacity: Float): PDFDocument;

    /**
     * Sets the stroke color and opacity.
     */
    function strokeColor(color: PDFColor, ?opacity: Float): PDFDocument;

    /**
     * Sets the both fill opacity and stroke opacity.
     */
    function opacity(opacity: Float): PDFDocument;

    /**
     * Sets the fill opacity.
     */
    function fillOpacity(opacity: Float): PDFDocument;

    /**
     * Sets the stroke opacity.
     */
    function strokeOpacity(opacity: Float): PDFDocument;

    /**
     * Creates a PDFLinearGradient.
     * - x1,y1 is the start point, x2,y2 is the end point.
     */
    function linearGradient(x1: Float, y1: Float, x2: Float, y2: Float): PDFLinearGradient;

    /**
     * Creates a PDFLinearGradient.
     * - r1 is the inner radius, r2 is the outer radius.
     */
    function radialGradient(x1: Float, y1: Float, r1: Float, x2: Float, y2: Float, r2: Float): PDFLinearGradient;


    // mixin(VectorMixin)
    /**
     * Pushes the current graphics state onto the stack.
     */
    function save(): PDFDocument;

    /**
     * Applies the last state on the stack to the context.
     */
    function restore(): PDFDocument;

    function closePath(): PDFDocument;

    function lineWidth(w: Float): PDFDocument;

    function lineCap(c: PDFLineCapStyle): PDFDocument;

    function lineJoin(j: PDFLineJoinStyle): PDFDocument;

    function miterLimit(m: Float): PDFDocument;

    @:overload(function(dashArray: Array<Float>, ?options: {?phase: Float}):PDFDocument {})
    function dash(length: Float, ?options: {?space: Float, ?phase: Float}): PDFDocument;

    function undash(): PDFDocument;

    function moveTo(x: Float, y: Float): PDFDocument;

    function lineTo(x: Float, y: Float): PDFDocument;

    function bezierCurveTo(cp1x: Float, cp1y: Float, cp2x: Float, cp2y: Float, x: Float, y: Float): PDFDocument;

    function quadraticCurveTo(cpx: Float, cpy: Float, x: Float, y: Float): PDFDocument;

    function rect(x: Float, y: Float, w: Float, h: Float): PDFDocument;

    function roundedRect(x: Float, y: Float, w: Float, h: Float, r: Float): PDFDocument;

    function ellipse(x: Float, y: Float, r1: Float, r2: Float): PDFDocument;

    function circle(x: Float, y: Float, radius: Float): PDFDocument;

    function arc(x: Float, y: Float, radius: Float, startAngle: Float, endAngle: Float, ?anticlockwise: Bool): PDFDocument;

    function polygon(points: Rest<PDFPoint>): PDFDocument;

    function path(path: String): PDFDocument;

    @:overload(function(rule: PDFWindingRule): PDFDocument {})
    function fill(color: PDFColor, ?rule: PDFWindingRule): PDFDocument;

    function stroke(color: PDFColor): PDFDocument;

    @:overload(function(rule: PDFWindingRule): PDFDocument {})
    function fillAndStroke(fillColor: PDFColor, strokeColor: PDFColor, ?rule: PDFWindingRule): PDFDocument;

    function clip(?rule: PDFWindingRule): PDFDocument;

    function transform(m11: Float, m12: Float, m21: Float, m22: Float, dx: Float, dy: Float): PDFDocument;

    function translate(x: Float, y: Float): PDFDocument;

    function rotate(angle: Float, ?options: {?origin: PDFPoint}): PDFDocument;

    @:overload(function(factor: Float, ?options: {?origin: PDFPoint}): PDFDocument {})
    function scale(xFactor: Float, yFactor: Float, ?options: {?origin: PDFPoint}): PDFDocument;


    // mixin(FontsMixin);
    /**
     * Set the font.
     */
    @:overload(function(src: String, family: String, ?size: Float): PDFDocument {})
    @:overload(function(src: Buffer, family: String, ?size: Float): PDFDocument {})
    @:overload(function(src: ArrayBuffer, family: String, ?size: Float): PDFDocument {})
    @:overload(function(src: Uint8Array, family: String, ?size: Float): PDFDocument {})
    function font(src: String, ?size: Float): PDFDocument;

    /**
     * Sets the font size.
     */
    function fontSize(fontSize: Float): PDFDocument;

    /**
     * Gets the line height in the current font.
     */
    function currentLineHeight(?includeGap: Bool): Float;

    /**
     * Registers a font.
     */
    @:overload(function(name: String, src: Buffer, family: String): PDFDocument {})
    @:overload(function(name: String, src: ArrayBuffer, family: String): PDFDocument {})
    @:overload(function(name: String, src: Uint8Array, family: String): PDFDocument {})
    function registerFont(name: String, src: String, family: String): PDFDocument;


    // mixin(TextMixin);
    function lineGap(lineGap: Float): PDFDocument;

    function moveDown(lines: Float): PDFDocument;

    function moveUp(lines: Float): PDFDocument;

    function text(text: String, ?x: Float, ?y: Float, ?style: PDFTextStyles): PDFDocument;

    function list(list: PDFListData, ?x: Float, ?y: Float, ?style: PDFListStyles): PDFDocument;

    function widthOfString(text: String, ?style: PDFTextStyles): Float;
    function heightOfString(text: String, ?style: PDFTextStyles): Float;


    // mixin(ImagesMixin);
    @:overload(function(src: Buffer, ?x: Float, ?y: Float, ?styles: PDFImageStyles):PDFDocument {})
    @:overload(function(src: ArrayBuffer, ?x: Float, ?y: Float, ?styles: PDFImageStyles):PDFDocument {})
    function image(src: String, ?x: Float, ?y: Float, ?styles: PDFImageStyles): PDFDocument;


    // mixin(AnnotationsMixin);
    function annotate(x: Float, y: Float, w: Float, h: Float, ?options: {}): PDFDocument;

    function note(x: Float, y: Float, w: Float, h: Float, contents: String, ?options: {}): PDFDocument;

    function goTo(x: Float, y: Float, w: Float, h: Float, name: String, ?options: {}): PDFDocument;

    @:overload(function(x: Float, y: Float, w: Float, h: Float, page: Int, ?options: {}):PDFDocument {})
    function link(x: Float, y: Float, w: Float, h: Float, url: String, ?options: {}): PDFDocument;

    function highlight(x: Float, y: Float, w: Float, h: Float, ?options: {}): PDFDocument;

    function underline(x: Float, y: Float, w: Float, h: Float, ?options: {}): PDFDocument;

    function strike(x: Float, y: Float, w: Float, h: Float, ?options: {}): PDFDocument;

    function lineAnnotation(x1: Float, y1: Float, x2: Float, y2: Float, ?options: {}): PDFDocument;

    function rectAnnotation(x: Float, y: Float, w: Float, h: Float, ?options: {}): PDFDocument;

    function ellipseAnnotation(x: Float, y: Float, w: Float, h: Float, ?options: {}): PDFDocument;

    function textAnnotation(x: Float, y: Float, w: Float, h: Float, text: String, ?options: {}): PDFDocument;


    // mixin(OutlineMixin);
    final outline: PDFOutline;
}

typedef PDFDocumentNewOptions = ReadableNewOptions & PDFPageOptions & {
    /**
     * PDF version
     *
     * default: `V1_3`
     */
    var ?pdfVersion: PdfVersion;

    /**
     * Whether streams should be compressed.
     *
     * default: `true`
     */
    var ?compress: Bool;

    /**
     * The default font
     *
     * default: `"Helvetica"`
     */
    var ?font: String;

    /**
     * The document metadata
     */
    var ?info: PDFDocumentInfo;

    /**
     * Add the first page.
     *
     * default: `true`
     */
    var ?autoFirstPage: Bool;

    /**
     * The user password
     */
    var ?userPassword: String;

    /**
     * The owner password
     */
    var ?ownerPassword: String;

    /**
     * The object specifying PDF file permissions
     */
    var permissions: PDFPermissions;
}

typedef PDFPageOptions = {
    /**
     * Allows you to control when pages are flushed to the output file yourself rather
     * than letting PDFKit handle that for you.
     *
     * default: `false`
     */
    var ?bufferPages: Bool;

    /**
     * The default page size
     *
     * default: `Letter`
     */
    var ?size: PdfPageSize;
    // new PDFPage(this, options);

    /**
     * The default page layout
     *
     * default: `Portrait`
     */
    var ?layout: PdfPageLayout;

    /**
     * The default page margin (singular)

     * default: `72`
     */
    var ?margin: Float;

    /**
     * The default page margin (plural)
     */
    var ?margins: PdfPageMergins;
}

/**
 * PDF versions that is supported PDFKit
 */
enum abstract PdfVersion(String) from String to String {
    var V1_3 = "1.3";
    var V1_4 = "1.4";
    var V1_5 = "1.5";
    var V1_6 = "1.6";
    var V1_7 = "1.7";
    var V1_7_ext3 = "1.7ext3";
}

/**
 * The document metadata
 */
typedef PDFDocumentInfo = {
    /**
     * The title of the document
     */
    var ?Title: String;

    /**
     * The name of the author
     */
    var ?Author: String;

    /**
     * The subject of the document
     */
    var ?Subject: String;

    /**
     * Keywords associated with the document
     */
    var ?Keywords: String;

    /**
     * The creator of the document (added automatically by PDFKit)
     */
    var ?Creator: String;

    /**
     * The producer of the document (added automatically by PDFKit)
     */
    var ?Producer: String;

    /**
     * The date the document was created (added automatically by PDFKit)
     */
    var ?CreationDate: Date;

    /**
     * The date the document was last modified
     */
    var ?ModDate: Date;
}

typedef PDFPermissions = {
    /**
     * Whether printing is allowed.
     * Specify `LowResolution` to allow degraded printing, or `HighResolution` to allow printing with high resolution.
     */
    var ?prnting: PdfPrintingPermission;

    /**
     * Whether modifying the file is allowed.
     * Specify `true` to allow modifying document content.
     */
    var ?modifying: Bool;

    /**
     * Whether copying text or graphics is allowed.
     * Specify `true` to allow copying.
     */
    var ?copying: Bool;

    /**
     * Whether annotating, form filling is allowed.
     * Specify `true` to allow annotating and form filling
     */
    var ?annotating: Bool;

    /**
     * Whether form filling and signing is allowed.
     * Specify `true` to allow filling in form fields and signing.
     */
    var ?fillingForms: Bool;


    /**
     * Whether copying text for accessibility is allowed.
     * Specify `true` to allow copying for accessibility.
     */
    var ?contentAccessibility: Bool;

    /**
     * Whether assembling document is allowed.
     * Specify `true` to allow document assembly.
     */
    var ?documentAssembly: Bool;
}

enum abstract PdfPrintingPermission(String) {
    var LowResolution = "lowResolution";
    var HighResolution = "highResolution";
}

abstract PdfPageSize(EitherType<String, Array<Float>>) {
    public static final ISO_4A0 = new PdfPageSize("4A0");
    public static final ISO_2A0 = new PdfPageSize("2A0");
    public static final A0  = new PdfPageSize("A0");
    public static final A1  = new PdfPageSize("A1");
    public static final A2  = new PdfPageSize("A2");
    public static final A3  = new PdfPageSize("A3");
    public static final A4  = new PdfPageSize("A4");
    public static final A5  = new PdfPageSize("A5");
    public static final A6  = new PdfPageSize("A6");
    public static final A7  = new PdfPageSize("A7");
    public static final A8  = new PdfPageSize("A8");
    public static final A9  = new PdfPageSize("A9");
    public static final A10 = new PdfPageSize("A10");
    public static final B0  = new PdfPageSize("B0");
    public static final B1  = new PdfPageSize("B1");
    public static final B2  = new PdfPageSize("B2");
    public static final B3  = new PdfPageSize("B3");
    public static final B4  = new PdfPageSize("B4");
    public static final B5  = new PdfPageSize("B5");
    public static final B6  = new PdfPageSize("B6");
    public static final B7  = new PdfPageSize("B7");
    public static final B8  = new PdfPageSize("B8");
    public static final B9  = new PdfPageSize("B9");
    public static final B10 = new PdfPageSize("B10");
    public static final C0  = new PdfPageSize("C0");
    public static final C1  = new PdfPageSize("C2");
    public static final C2  = new PdfPageSize("C2");
    public static final C3  = new PdfPageSize("C3");
    public static final C4  = new PdfPageSize("C4");
    public static final C5  = new PdfPageSize("C5");
    public static final C6  = new PdfPageSize("C5");
    public static final C7  = new PdfPageSize("C7");
    public static final C8  = new PdfPageSize("C8");
    public static final C9  = new PdfPageSize("C9");
    public static final C10 = new PdfPageSize("C10");
    public static final RA0 = new PdfPageSize("RA0");
    public static final RA1 = new PdfPageSize("RA1");
    public static final RA2 = new PdfPageSize("RA2");
    public static final RA3 = new PdfPageSize("RA3");
    public static final RA4 = new PdfPageSize("RA4");
    public static final SRA0 = new PdfPageSize("SRA0");
    public static final SRA1 = new PdfPageSize("SRA1");
    public static final SRA2 = new PdfPageSize("SRA2");
    public static final SRA3 = new PdfPageSize("SRA3");
    public static final SRA4 = new PdfPageSize("SRA4");
    public static final Executive = new PdfPageSize("EXECUTIVE");
    public static final Folio = new PdfPageSize("FOLIO");
    public static final Legal = new PdfPageSize("LEGAL");
    public static final Letter = new PdfPageSize("LETTER");
    public static final Tabloid = new PdfPageSize("TABLOID");

    inline function new(size: EitherType<String, Array<Float>>) {
        this = size;
    }

    public inline static function custom(width:Float, height:Float): PdfPageSize {
        return new PdfPageSize([width, height]);
    }
}

enum abstract PdfPageLayout(String) {
    var Portrait = "portrait";
    var Landscape = "landscape";
}

typedef PdfPageMergins = {
    var top: Float;
    var bottom: Float;
    var left: Float;
    var right: Float;
}

typedef PDFBufferedPageRange = {
    final start: Int;
    final count: Int;
}

enum abstract PDFLineCapStyle(Int) {
    var Butt = 1;
    var Round = 1;
    var Square = 2;
}

enum abstract PDFLineJoinStyle(Int) {
    var Miter = 0;
    var Round = 1;
    var Bevel = 2;
}

enum abstract PDFWindingRule(String) {
    var NonZero = "non-zero";
    var EvenOdd = "even-odd";
}

typedef PDFTextStyles = {
    /**
     * Set to false to disable line wrapping all together
     *
     * default: `true`
     */
    var ?lineBreak: Bool;

    /**
     * The width that text should be wrapped to (by default, the page width minus the left and right margin)
     */
    var ?width: Float;

    /**
     * The maximum height that text should be clipped to
     */
    var ?height: Float;

    /**
     * The text justification
     *
     * default: `Left`
     */
    var ?align: PDFTextAlign;

    /**
     * The character to display at the end of the text when it is too long. Set to true to use the default character.
     */
    var ?ellipsis: EitherType<String, Bool>;

    /**
     * The number of columns to flow the text into
     *
     * default: `1`
     */
    var ?columns: Int;

    /**
     * The amount of space between each column (1/4 inch by default)
     *
     * default: `18`
     */
    var ?columnGap: Float;

    /**
     * The amount in PDF points (72 per inch) to indent each paragraph of text
     */
    var ?indent: Float;

    /**
     * The amount of space between each paragraph of text
     */
    var ?paragraphGap: Float;

    /**
     * The amount of space between each line of text
     */
    var ?lineGap: Float;

    /**
     * The amount of space between each word in the text
     */
    var ?wordSpacing: Float;

    /**
     * The amount of space between each character in the text
     */
    var ?characterSpacing: Float;

    /**
     * Whether to fill the text (true by default)
     */
    var ?fill: Bool;

    /**
     * Whether to stroke the text
     */
    var ?stroke: Bool;

    /**
     * A URL or page to link this text to (shortcut to create an annotation)
     */
    var ?link: EitherType<String, Int>;

    /**
     * Go to annotation for this text
     */
    var ?goTo: String;

    /**
     * Insert anchor for this text
     */
    var ?destination: String;

    /**
     * Whether to underline the text
     */
    var ?underline: Bool;

    /**
     * Whether to strike out the text
     */
    var ?strike: Bool;

    /**
     * Whether to slant the text (angle in degrees or true)
     */
    var ?oblique: EitherType<Bool, Float>;

    /**
     * The vertical alignment of the text with respect to its insertion point (values as canvas textBaseline)
     */
    var ?baseline: EitherType<Float, PDFTextBaseLine>;

    /**
     * Whether the text segment will be followed immediately by another segment. Useful for changing styling in the middle of a paragraph.
     */
    var ?continued: Bool;

    /**
     * An array of OpenType feature tags to apply. If not provided, a set of defaults is used.
     */
    var ?features: EitherType<Array<String>, Dynamic<Bool>>;
}

enum abstract PDFTextAlign(String) {
    var Left = "left";
    var Center = "center";
    var Right = "right";
    var Justify = "justify";
}

enum abstract PDFTextBaseLine(String) {
    var SvgMiddle = "svg-middle";
    var Middle = "middle";
    var SvgCentral = "svg-central";
    var Bottom = "bottom";
    var Ideographic = "ideographic";
    var Alphabetic = "alphabetic";
    var Mathematical = "mathematical";
    var Hanging = "hanging";
    var Top = "top";
}

typedef PDFListData = EitherType<String, Array<PDFListData>>;

typedef PDFListStyles = PDFTextStyles & {
    /**
     * The list marker style
     *
     * default: `Bullet`
     */
    var ?listType: PDFListType;

    /**
     * The bullet marker radius
     */
    var ?bulletRadius: Float;

    /**
     * The bullet marker indent
     */
    var ?bulletIndent: Float;

    /**
     * The text indent
     */
    var ?textIndent: Float;
}

enum abstract PDFListType(String) {
    var Bullet = "bullet";
    var Numbered = "numbered";
    var Lettered = "lettered";
}

typedef PDFImageStyles = {
    /**
     * Image is scaled proportionally to fit in the provided `width`
     */
    var ?width: Float;

    /**
     * Image is scaled proportionally to fit in the provided `height`
     */
    var ?height: Float;

    /**
     * Image is scaled proportionally by the provided scale `factor`
     */
    var ?scale: Float;

    /**
     * Image is scaled proportionally to fit within the passed width and height
     */
    var ?fit: PDFSize;

    /**
     * Image is scaled proportionally to completely cover the rectangle defined by the passed width and height
     */
    var ?cover: PDFSize;

    /**
     * Horizontally align the image
     */
    var ?align: PDFImageHorizontalAlign;

    /**
     * Vertically align the image
     */
    var ?valign: PDFImageVerticalAlign;

    /**
     * A URL or page to link this text to (shortcut to create an annotation)
     */
    var ?link: EitherType<String, Int>;

    /**
     * Go to annotation for this text
     */
    var ?goTo: String;

    /**
     * Insert anchor for this text
     */
    var ?destination: String;
}

enum abstract PDFImageHorizontalAlign(String) {
    var Left = "left";
    var Center = "center";
    var Right = "right";
}

enum abstract PDFImageVerticalAlign(String) {
    var Top = "top";
    var Center = "center";
    var Bottom = "bottom";
}

extern class PDFReference {
    @:overload(function(chunk: String): Void {})
    function write(chunk: Buffer): Void;

    @:overload(function(chunk: String): Void {})
    function end(?chunk: Buffer): Void;

    function finalize(): Bool;
}

extern class PDFOutline {
    function addItem(title: String, ?options: {expanded: Bool}): PDFOutline;
}

abstract PDFColor(Dynamic)
    from String to String
    from PDFColorGray to PDFColorGray
    from PDFColorRGB to PDFColorRGB
    from PDFColorCMYK to PDFColorCMYK
    from PDFGradient to PDFGradient
{ }

extern class PDFGradient {
    function stop(pos: Float, color: PDFColor, ?opacity: Float): PDFGradient;
}
extern class PDFLinearGradient extends PDFGradient { }
extern class PDFRadialGradient extends PDFGradient { }

abstract PDFColorGray(Array<Int>) {
    public inline function new(gray: Int) {
        this = [gray];
    }
}

abstract PDFColorRGB(Array<Int>) {
    public inline function new(red:Int, green:Int, blue:Int) {
        this = [red, green, blue];
    }
}

abstract PDFColorCMYK(Array<Int>) {
    public inline function new(cyan:Int, magenta:Int, yellow:Int, black:Int) {
        this = [cyan, magenta, yellow, black];
    }
}

abstract PDFPoint(Array<Float>) {
    public var x(get, set): Float;
    inline function get_x(): Float return this[0];
    inline function set_x(x: Float): Float return this[0] = x;

    public var y(get, set): Float;
    inline function get_y(): Float return this[1];
    inline function set_y(y: Float): Float return this[1] = y;

    public inline function new(x: Float, y: Float) {
        this = [x, y];
    }
}

abstract PDFSize(Array<Float>) {
    public var width(get, set): Float;
    inline function get_width(): Float return this[0];
    inline function set_width(width: Float): Float return this[0] = width;

    public var height(get, set): Float;
    inline function get_height(): Float return this[1];
    inline function set_height(height: Float): Float return this[1] = height;

    public inline function new(width: Float, height: Float) {
        this = [width, height];
    }
}
