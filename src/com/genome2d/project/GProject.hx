package com.genome2d.project;

import com.genome2d.callbacks.GCallback.GCallback0;
import com.genome2d.debug.GDebug;
import com.genome2d.macros.MGDebug;
import com.genome2d.assets.GAssetManager;
import com.genome2d.context.GContextConfig;
import com.genome2d.assets.GAsset;
import com.genome2d.assets.GStaticAssetManager;
import com.genome2d.geom.GRectangle;
#if cs
import unityengine.*;
#end

#if !cs
class GProject {
#else
@:nativeGen
class GProject extends MonoBehaviour {
#end
    #if cs
    public var onUpdate(default,null):GCallback0;
    public var onFrame(default,null):GCallback0;

    // onMouse callback was moved to GUnityContext
    #end

    private var g2d_genome:Genome2D;
    public function getGenome():Genome2D {
        return g2d_genome;
    }

    private var g2d_config:GProjectConfig;

    private var g2d_assetManager:GAssetManager;

    #if !cs
    public function new(p_config:GProjectConfig) {
        g2d_config = p_config;

        g2d_genome = Genome2D.getInstance();
        if (g2d_config.initGenome) {
            initGenome();
        } else {
            init();
        }
    }
    #else
    private function getConfig():GProjectConfig {
        var contextConfig:GContextConfig = new GContextConfig(this, new GRectangle(0,0,Screen.width,Screen.height));
        return new GProjectConfig(contextConfig);
    }

    public function Start() {
        GDebug.info("Starting project.");
        onUpdate = new GCallback0();
        onFrame = new GCallback0();

        g2d_config = getConfig();

        g2d_genome = Genome2D.getInstance();
        if (g2d_config.initGenome) {
            initGenome();
        } else {
            init();
        }
    }

    public function Update() {
        onUpdate.dispatch();
    }

    public function OnPostRender() {
        onFrame.dispatch();
    }
    #end
    /**
     *  Initialize Genome2D
     **/
    private function initGenome():Void {
        GDebug.info("initGenome");
        g2d_genome.onFailed.addOnce(genomeFailed_handler);
        g2d_genome.onInitialized.addOnce(genomeInitialized_handler);
        g2d_genome.init(g2d_config.contextConfig);
    }

    private function init():Void {
    }

    /**
     *  Handlers
     **/
    private function genomeInitialized_handler():Void {
        GDebug.info("genomeInitialized");
        g2d_assetManager = new GAssetManager();
        init();
    }

    private function genomeFailed_handler(p_msg:String):Void {
        GDebug.error("genomeFailed", p_msg);
    }
}