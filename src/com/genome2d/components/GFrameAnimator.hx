package com.genome2d.components;
import com.genome2d.components.renderable.GSprite;
import com.genome2d.textures.GTexture;

class GFrameAnimator extends GAnimator
{
	public var timeDilation:Float = 1;

    /**
        Is animation repeating after reaching the last frame, default true
    **/
    public var repeatable:Bool = true;

    /**
        Is playback reversed, default false
    **/
    public var reversed:Bool = false;
	
    private var g2d_speed:Float = 1000/30;
    private var g2d_accumulatedTime:Float = 0;
    private var g2d_lastUpdatedFrameId:Int = 0;
    private var g2d_startIndex:Int = -1;
    private var g2d_endIndex:Int = -1;
    private var g2d_playing:Bool = true;
	
	private var g2d_sprite:GSprite;
	private function getSprite():GSprite {
		if (g2d_sprite == null) g2d_sprite = cast node.getComponent(GSprite);
		return g2d_sprite;
	}

    /**
        Get the current frame count
    **/
    private var g2d_frameCount:Int;
    #if swc @:extern #end
    public var frameCount(get, never):Int;
    #if swc @:getter(frameCount) #end
    inline private function get_frameCount():Int {
        return g2d_frameCount;
    }

    /**
        Get the current frame index the movieclip is at
    **/
    private var g2d_currentFrame:Int = -1;
    #if swc @:extern #end
    public var currentFrame(get, never):Int;
    #if swc @:getter(currentFrame) #end
    inline private function get_currentFrame():Int {
        return g2d_currentFrame;
    }

    /**
        Textures used for frames
    **/
    private var g2d_frameTextures:Array<GTexture>;
    #if swc @:extern #end
    public var frameTextures(never, set):Array<GTexture>;
    #if swc @:setter(frameTextures) #end
    inline private function set_frameTextures(p_value:Array<GTexture>):Array<GTexture> {
        g2d_frameTextures = p_value;
        g2d_frameCount = p_value.length;
        g2d_currentFrame = 0;
        if (g2d_frameTextures.length>0) {
            getSprite().texture = g2d_frameTextures[0];
        } else {
            getSprite().texture = null;
        }

        return g2d_frameTextures;
    }

    /**
	    Go to a specified frame
	**/
    public function gotoFrame(p_frame:Int):Void {
        if (g2d_frameTextures == null) return;
        g2d_currentFrame = p_frame;
        g2d_currentFrame %= g2d_frameCount;
        getSprite().texture = g2d_frameTextures[g2d_currentFrame];
    }

    /**
        Go to a specified frame and start playing
    **/
    public function gotoAndPlay(p_frame:Int):Void {
        gotoFrame(p_frame);
        play();
    }

    /**
        Go to a specified frame and stop playing
    **/
    public function gotoAndStop(p_frame:Int):Void {
        gotoFrame(p_frame);
        stop();
    }

    /**
	    Stop playback
	**/
    public function stop():Void {
        g2d_playing = false;
    }

    /**
	    Start the playback
	**/
    public function play():Void {
        g2d_playing = true;
    }
	
	inline public function update(p_deltaTime:Float):Void {
        if (g2d_playing && g2d_frameCount>1) {
            g2d_accumulatedTime += p_deltaTime*timeDilation;

            if (g2d_accumulatedTime >= g2d_speed) {
                g2d_currentFrame += (reversed) ? -Std.int(g2d_accumulatedTime / g2d_speed) : Std.int(g2d_accumulatedTime / g2d_speed);
                if (reversed && g2d_currentFrame<0) {
                    if (repeatable) {
                        g2d_currentFrame = g2d_frameCount+g2d_currentFrame%g2d_frameCount;
                    } else {
                        g2d_currentFrame = 0;
                        g2d_playing = false;
                    }
                } else if (!reversed && g2d_currentFrame>=g2d_frameCount) {
                    if (repeatable) {
                        g2d_currentFrame = g2d_currentFrame%g2d_frameCount;
                    } else {
                        g2d_currentFrame = g2d_frameCount-1;
                        g2d_playing = false;
                    }
                }
				if (g2d_sprite == null) g2d_sprite = cast node.getComponent(GSprite);
                if (g2d_sprite != null) g2d_sprite.texture = g2d_frameTextures[g2d_currentFrame];
            }
            g2d_accumulatedTime %= g2d_speed;
        }
    }
}