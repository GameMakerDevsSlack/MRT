attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    
    vec4 v_diffuse = texture2D( gm_BaseTexture, v_vTexcoord );
    vec4 v_stencil = vec4( 0.0, 0.0, 0.0, v_diffuse.a );
    
    gl_FragData[0] = v_vColour * v_diffuse;
    gl_FragData[1] = v_stencil; //<-- This line errors :(
    
}
