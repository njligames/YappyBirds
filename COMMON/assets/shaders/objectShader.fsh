#version 100

#ifdef GL_ES
precision mediump float;
#endif

//varying vec4 destinationNormal;
varying vec4 destinationColor;
varying vec2 destinationTexCoord2D;
varying float destinationOpacity;
varying float destinationHidden;
varying mat4 destinationColorTransform;

uniform sampler2D diffuseTexture2D;
uniform sampler2D ambientTexture2D;
uniform sampler2D specularTexture2D;
uniform sampler2D normalTexture2D;
uniform sampler2D reflectiveTexture2D;
uniform sampler2D emissionTexture2D;
uniform sampler2D transparentTexture2D;
uniform sampler2D multiplyTexture2D;

uniform     int         u_opacityModifyRGB;



vec4 transformRGB(vec4 color, mat4 transform)
{
	float tr = color.r*transform[0][0] + color.g*transform[1][0] + color.b*transform[2][0] + transform[3][0];
	float tg = color.r*transform[0][1] + color.g*transform[1][1] + color.b*transform[2][1] + transform[3][1];
	float tb = color.r*transform[0][2] + color.g*transform[1][2] + color.b*transform[2][2] + transform[3][2];
	
	return vec4(tr, tg, tb, color.a);
}

void main(void)
{
	vec4 destOpacityColor = vec4(1.0, 1.0, 1.0, destinationOpacity);
	
    if(destinationHidden != 0.0)
    	destOpacityColor.a = 0.0;
    
    vec4 color = destinationColor;
    int modifyRGB = u_opacityModifyRGB;
    
    vec4 diffuseColor = texture2D(diffuseTexture2D, destinationTexCoord2D);
    
    if (modifyRGB == 1) {
        color = vec4(destinationColor.r * destinationColor.a,
                     destinationColor.g * destinationColor.a,
                     destinationColor.b * destinationColor.a,
                     destinationColor.a);
    }
    
    color = (color * diffuseColor * destOpacityColor);
    
    color = transformRGB(color, destinationColorTransform);
    
    if (color.a == 0.0)
    {
        discard;
    }
    
    
    gl_FragColor = color;
}
