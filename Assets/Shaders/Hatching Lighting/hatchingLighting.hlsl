#ifndef HATCHING_LIGHTING_INCLUDED
#define HATCHING_LIGHTING_INCLUDED

struct HatchingLightingData {
    // Position and orientation
    float3 normalWS;
    
    // Surface attributes
    float3 albedo;
};

#ifndef SHADERGRAPH_PREVIEW
float3 HatchingLightHandling(HatchingLightingData d, Light light){
    
    float3 radiance = light.color;
    float diffuse = saturate(dot(d.normalWS, light.direction));
    float3 color = d.albedo * radiance * diffuse;
    
    return color;
}
#endif


float CalculateHatchingLighting(HatchingLightingData d){ 
#ifdef SHADERGRAPH_PREVIEW
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hls"
    // In preview, estimate diffuse + specular
    
    float3 lightDir = float3(0.5,0.5,0);
    float intensity = saturate(dot(d.normalWS,lightDir));
    return d.albedo * intensity;
    
 #else
   // get main light. Located in Shaders/Hatching Lighting/hatchingLighting.hlsl
    Light mainLight = GetMainLight();
    
    float3 color = 0;
    //shade main light
    color += HatchingLightHandling(d, mainLight);
    
    return color;
#endif
}

void CalculateHatchingLighing_float(float3 Normal, float3 Albedo, out float3 Color){
    
    HatchingLightingData d;
    d.normalWS = Normal;
    d.albedo = Albedo;
    
    Color = CalculateHatchingLighting(d);
}

#endif