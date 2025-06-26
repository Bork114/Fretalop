using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

[System.Serializable]
public class CustomPostProcessRender : ScriptableRendererFeature 
{
    private CustomPostProcessPass m_customPass;
    
    public override void AddRenderPass(ScriptableRenderer renderer, ref RenderingData renderingData){
    renderer.EnqueuePass(m_customPass);
    }

    public override void Create(){
        m_customPass = new CustomPostProcessPass();
    }

}
