struct VS_INPUT { // Input to VS
    float4 Position : POSITION;
    float4 Color    : COLOR0;
    float2 Texcoord : TEXCOORD0;
};


struct VS_OUTPUT { // Output to PS from VS
    float4 Position : SV_POSITION;
    float4 Color    : COLOR0;
    float2 Texcoord : TEXCOORD0;
};


VS_OUTPUT main(VS_INPUT IN)
{
    VS_OUTPUT OUT;
    OUT.Position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], IN.Position);
    OUT.Color = IN.Color;
    OUT.Texcoord = IN.Texcoord;
    return OUT;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~// Our texture coordinates:
struct PS_INPUT { // Input from VS to PS
    float4 Color    : COLOR0;
    float2 Texcoord : TEXCOORD0;
};

struct PS_OUTPUT { // Output from PS
    float4 Color0 : SV_TARGET0;
    float4 Color1 : SV_TARGET1;
};

//Texture2D textureMix1 : register(t1);
SamplerState texture1 : register(s1);

//Texture2D textureMix2 : register(t2);
//SamplerState texture2 : register(s2);

PS_OUTPUT main(PS_INPUT IN)
{   
    float4 outputDiffuse = tex2D( gm_BaseTexture, IN.Texcoord ) * tex2D( texture1, IN.Texcoord );
    float4 outputStencil = float4( 0.0, 1.0, 0.0, outputDiffuse.a );
    
    PS_OUTPUT OUT;
    OUT.Color0 = IN.Color * outputDiffuse;
    OUT.Color1 = outputStencil;
    
    return OUT;
    
}
