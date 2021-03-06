/*
 * 	Genome2D - 2D GPU Framework
 * 	http://www.genome2d.com
 *
 *	Copyright 2011-2015 Peter Stefcek. All rights reserved.
 *
 *	License:: ./doc/LICENSE.md (https://github.com/pshtif/Genome2D/blob/master/LICENSE.md)
 */
package com.genome2d.ui.skin;
import com.genome2d.callbacks.GCallback.GCallback0;
import com.genome2d.input.IGFocusable;
import com.genome2d.input.GFocusManager;
import com.genome2d.input.GMouseInputType;
import com.genome2d.input.GKeyboardInputType;
import com.genome2d.input.GKeyboardInput;
import com.genome2d.utils.GHAlignType;
import com.genome2d.utils.GVAlignType;
import com.genome2d.input.GMouseInput;
import com.genome2d.proto.GPrototype;
import com.genome2d.text.GTextFormat;
import com.genome2d.text.GTextureFont;
import com.genome2d.ui.element.GUIElement;
import com.genome2d.text.GTextureTextRenderer;
import com.genome2d.textures.GTexture;

@prototypeName("fontSkin")
class GUIFontSkin extends GUISkin implements IGFocusable {

    @prototype
    public var rotation:Float = 0;

    private var g2d_onEnter:GCallback0;
    #if swc @:extern #end
    public var onEnter(get, null):GCallback0;
    #if swc @:getter(onEnter) #end
    inline private function get_onEnter():GCallback0 {
    if (g2d_onEnter == null) g2d_onEnter = new GCallback0();
    return g2d_onEnter;
    }

    #if swc @:extern #end
    @prototype
    public var wordWrap(get, set):Bool;
    #if swc @:getter(wordWrap) #end
    inline private function get_wordWrap():Bool {
        return g2d_textRenderer.wordWrap;
    }
    #if swc @:setter(wordWrap) #end
    inline private function set_wordWrap(p_value:Bool):Bool {
        g2d_textRenderer.wordWrap = p_value;
        return p_value;
    }

    #if swc @:extern #end
    @prototype
    public var vAlign(get, set):GVAlignType;
    #if swc @:getter(vAlign) #end
    inline private function get_vAlign():GVAlignType {
        return g2d_textRenderer.vAlign;
    }
    #if swc @:setter(vAlign) #end
    inline private function set_vAlign(p_value:GVAlignType):GVAlignType {
        g2d_textRenderer.vAlign = p_value;
        return p_value;
    }

    #if swc @:extern #end
    @prototype
    public var hAlign(get, set):GHAlignType;
    #if swc @:getter(hAlign) #end
    inline private function get_hAlign():GHAlignType {
        return g2d_textRenderer.hAlign;
    }
    #if swc @:setter(hAlign) #end
    inline private function set_hAlign(p_value:GHAlignType):GHAlignType {
        g2d_textRenderer.hAlign = p_value;
        return p_value;
    }

    public var format:GTextFormat;

    #if swc @:extern #end
    public var text(get, set):String;
    #if swc @:getter(text) #end
    inline private function get_text():String {
        return g2d_textRenderer.text;
    }
    #if swc @:setter(text) #end
    inline private function set_text(p_value:String):String {
        g2d_textRenderer.text = p_value;
        return p_value;
    }

    #if swc @:extern #end
    @prototype
    public var autoSize(get, set):Bool;
    #if swc @:getter(autoSize) #end
    inline private function get_autoSize():Bool {
        return g2d_textRenderer.autoSize;
    }
    #if swc @:setter(autoSize) #end
    inline private function set_autoSize(p_value:Bool):Bool {
        g2d_textRenderer.autoSize = p_value;
        return p_value;
    }

    private var g2d_textRenderer:GTextureTextRenderer;
    #if swc @:extern #end
    public var textRenderer(get, never):GTextureTextRenderer;
    #if swc @:getter(textRenderer) #end
    inline private function get_textRenderer():GTextureTextRenderer {
        return g2d_textRenderer;
    }

    #if swc @:extern #end
    @prototype
    public var fontScale(get, set):Float;
    #if swc @:getter(fontScale) #end
    inline private function get_fontScale():Float {
        return g2d_textRenderer.fontScale;
    }
    #if swc @:setter(fontScale) #end
    inline private function set_fontScale(p_value:Float):Float {
        g2d_textRenderer.fontScale = p_value;
        return p_value;
    }

    #if swc @:extern #end
    @prototype
    public var lineSpace(get, set):Float;
    #if swc @:getter(lineSpace) #end
    inline private function get_lineSpace():Float {
        return g2d_textRenderer.lineSpace;
    }
    #if swc @:setter(lineSpace) #end
    inline private function set_lineSpace(p_value:Float):Float {
        g2d_textRenderer.lineSpace = p_value;
        return p_value;
    }

    #if swc @:extern #end
    @prototype("getReference")
    public var font(get, set):GTextureFont;
    #if swc @:getter(font) #end
    inline private function get_font():GTextureFont {
        return g2d_textRenderer.textureFont;
    }
    #if swc @:setter(font) #end
    inline private function set_font(p_value:GTextureFont):GTextureFont {
        g2d_textRenderer.textureFont = p_value;
        return p_value;
    }

    #if swc @:extern #end
    public var cursorStartIndex(get, set):Int;
    #if swc @:getter(cursorStartIndex) #end
    inline private function get_cursorStartIndex():Int {
        return g2d_textRenderer.cursorStartIndex;
    }
    #if swc @:setter(cursorStartIndex) #end
    inline private function set_cursorStartIndex(p_value:Int):Int {
        g2d_textRenderer.cursorStartIndex = p_value;

        return p_value;
    }

    #if swc @:extern #end
    public var cursorEndIndex(get, set):Int;
    #if swc @:getter(cursorEndIndex) #end
    inline private function get_cursorEndIndex():Int {
        return g2d_textRenderer.cursorEndIndex;
    }
    #if swc @:setter(cursorEndIndex) #end
    inline private function set_cursorEndIndex(p_value:Int):Int {
        g2d_textRenderer.cursorEndIndex = p_value;

        return p_value;
    }

    @prototype
    public var inputEnabled:Bool = false;

    override private function getTexture():GTexture {
        return (g2d_textRenderer != null && g2d_textRenderer.textureFont != null) ? g2d_textRenderer.textureFont.texture : null;
    }

    override public function getMinWidth():Float {
        return autoSize ? g2d_textRenderer.width : 0;
    }

    override public function getMinHeight():Float {
        return autoSize ? g2d_textRenderer.height : 0;
    }

    public function new(p_id:String = "", p_font:GTextureFont = null, p_fontScale:Float = 1, p_autoSize:Bool = true, p_origin:GUIFontSkin = null) {
        super(p_id, p_origin);

        g2d_textRenderer = new GTextureTextRenderer();
        g2d_textRenderer.autoSize = p_autoSize;

        if (p_font != null) font = p_font;
        fontScale = p_fontScale;
        autoSize = p_autoSize;
    }

    override public function render(p_left:Float, p_top:Float, p_right:Float, p_bottom:Float, p_red:Float, p_green:Float, p_blue:Float, p_alpha:Float):Bool {
        g2d_textRenderer.format = format;
        g2d_textRenderer.blendMode = blendMode;

        if (forcePixelAccuracy) {
            p_left = Math.round(p_left);
            p_top = Math.round(p_top);
            p_right = Math.round(p_right);
            p_bottom = Math.round(p_bottom);
        }

        var rendered:Bool = false;
        if (super.render(p_left, p_top, p_right, p_bottom, p_red, p_green, p_blue, p_alpha)) {
            g2d_textRenderer.red = red * p_red;
            g2d_textRenderer.green = green * p_green;
            g2d_textRenderer.blue = blue * p_blue;
            g2d_textRenderer.alpha = alpha * p_alpha;

            g2d_textRenderer.width = p_right - p_left;
            g2d_textRenderer.height = p_bottom - p_top;
            g2d_textRenderer.render(p_left, p_top, 1, 1, rotation, 1, 1, 1, 1);
            rendered = true;
        }
        return rendered;
    }

    override private function elementModelChanged_handler(p_element:GUIElement):Void {
        text = (p_element.model != null) ? p_element.model : "";
    }

    override private function clone():GUISkin {
        var clone:GUIFontSkin = new GUIFontSkin("", g2d_textRenderer.textureFont, fontScale, autoSize, (g2d_origin == null)?this:cast g2d_origin);
        clone.red = red;
        clone.green = green;
        clone.blue = blue;
        clone.alpha = alpha;
        clone.color = color;
        clone.vAlign = vAlign;
        clone.hAlign = hAlign;
        clone.rotation = rotation;
        clone.inputEnabled = inputEnabled;
        clone.wordWrap = wordWrap;
        clone.blendMode = blendMode;
        return clone;
    }

    override public function captureMouseInput(p_input:GMouseInput):Void {
        if (inputEnabled && p_input.type == GMouseInputType.MOUSE_UP) GFocusManager.setFocus(this);

        g2d_textRenderer.captureMouseInput(p_input);
    }

    override public function bindPrototype(p_prototype:GPrototype):Void {
        bindPrototypeDefault(p_prototype);

        if (g2d_origin == null) {
            if (p_prototype.getProperty("id").value != "") {
                g2d_id = p_prototype.getProperty("id").value;
                GUISkinManager.g2d_addSkin(g2d_id, this);
            }
        }
    }

    override public function dispose():Void {
        Genome2D.getInstance().onKeyboardInput.remove(keyboard_handler);
        super.dispose();
    }

    public var restrictedChars:Array<String> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];

    private function keyboard_handler(input:GKeyboardInput):Void {
        if (!GFocusManager.hasFocus(this) || input.type != GKeyboardInputType.KEY_DOWN) return;

        switch (input.keyCode) {
            // LEFT
            case 37:
                cursorStartIndex = cursorEndIndex = cursorEndIndex-1;
                if (cursorStartIndex < 0) {
                    cursorStartIndex = cursorEndIndex = 0;
                }
            // RIGHT
            case 39:
                cursorStartIndex = cursorEndIndex = cursorEndIndex+1;
                if (cursorStartIndex > text.length) {
                    cursorStartIndex = cursorEndIndex = text.length;
                }
            // BACKSPACE
            case 8:
                if (cursorStartIndex > 0) {
                    text = text.substr(0,cursorStartIndex-1) + text.substr(cursorStartIndex);
                    cursorStartIndex = cursorEndIndex = cursorEndIndex-1;
                }
            // DELETE
            case 46:
                if (cursorStartIndex < text.length) {
                    text = text.substr(0,cursorStartIndex) + text.substr(cursorStartIndex+1);
                }
            case 13:
                if (g2d_onEnter != null) g2d_onEnter.dispatch();
            case _:
                var char:String = String.fromCharCode(input.charCode);
                if (restrictedChars.indexOf(char) != -1) {
                    text = text.substr(0,cursorStartIndex) + char + text.substr(cursorStartIndex);
                    cursorStartIndex = cursorEndIndex = cursorEndIndex+1;
                }
        }

        g2d_element.model = text;
    }

    private function gotFocus():Void {
        textRenderer.enableCursor = true;
        Genome2D.getInstance().onKeyboardInput.add(keyboard_handler);
    }

    private function lostFocus():Void {
        Genome2D.getInstance().onKeyboardInput.remove(keyboard_handler);
        textRenderer.enableCursor = false;
    }
}
