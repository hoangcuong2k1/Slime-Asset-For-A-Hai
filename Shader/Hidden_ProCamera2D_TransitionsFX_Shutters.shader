//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ProCamera2D/TransitionsFX/Shutters" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Step ("Step", Range(0, 1)) = 0
_BackgroundColor ("Background Color", Color) = (0,0,0,1)
_Direction ("Direction", Float) = 0
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 45460
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Step;
uniform 	vec4 _BackgroundColor;
uniform 	int _Direction;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb6;
void main()
{
    u_xlatb0 = _Direction==0;
    u_xlat2 = _Step * 0.5;
    u_xlatb4 = u_xlat2<vs_TEXCOORD0.x;
    u_xlatb0 = u_xlatb4 && u_xlatb0;
    u_xlat4 = (-_Step) * 0.5 + 1.0;
    u_xlatb6 = vs_TEXCOORD0.x<u_xlat4;
    u_xlatb0 = u_xlatb6 && u_xlatb0;
    if(u_xlatb0){
        u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat10_1;
    } else {
        u_xlatb0 = _Direction==1;
        u_xlatb2 = u_xlat2<vs_TEXCOORD0.y;
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        u_xlatb2 = vs_TEXCOORD0.y<u_xlat4;
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        if(u_xlatb0){
            u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
            SV_Target0 = u_xlat10_0;
        } else {
            SV_Target0 = _BackgroundColor;
        }
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Step;
uniform 	vec4 _BackgroundColor;
uniform 	int _Direction;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb6;
void main()
{
    u_xlatb0 = _Direction==0;
    u_xlat2 = _Step * 0.5;
    u_xlatb4 = u_xlat2<vs_TEXCOORD0.x;
    u_xlatb0 = u_xlatb4 && u_xlatb0;
    u_xlat4 = (-_Step) * 0.5 + 1.0;
    u_xlatb6 = vs_TEXCOORD0.x<u_xlat4;
    u_xlatb0 = u_xlatb6 && u_xlatb0;
    if(u_xlatb0){
        u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat10_1;
    } else {
        u_xlatb0 = _Direction==1;
        u_xlatb2 = u_xlat2<vs_TEXCOORD0.y;
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        u_xlatb2 = vs_TEXCOORD0.y<u_xlat4;
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        if(u_xlatb0){
            u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
            SV_Target0 = u_xlat10_0;
        } else {
            SV_Target0 = _BackgroundColor;
        }
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Step;
uniform 	vec4 _BackgroundColor;
uniform 	int _Direction;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb6;
void main()
{
    u_xlatb0 = _Direction==0;
    u_xlat2 = _Step * 0.5;
    u_xlatb4 = u_xlat2<vs_TEXCOORD0.x;
    u_xlatb0 = u_xlatb4 && u_xlatb0;
    u_xlat4 = (-_Step) * 0.5 + 1.0;
    u_xlatb6 = vs_TEXCOORD0.x<u_xlat4;
    u_xlatb0 = u_xlatb6 && u_xlatb0;
    if(u_xlatb0){
        u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat10_1;
    } else {
        u_xlatb0 = _Direction==1;
        u_xlatb2 = u_xlat2<vs_TEXCOORD0.y;
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        u_xlatb2 = vs_TEXCOORD0.y<u_xlat4;
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        if(u_xlatb0){
            u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
            SV_Target0 = u_xlat10_0;
        } else {
            SV_Target0 = _BackgroundColor;
        }
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _Step;
uniform 	vec4 _BackgroundColor;
uniform 	int _Direction;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Direction==0);
#else
    u_xlatb0 = _Direction==0;
#endif
    u_xlat2 = _Step * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat2<vs_TEXCOORD0.x);
#else
    u_xlatb4 = u_xlat2<vs_TEXCOORD0.x;
#endif
    u_xlatb0 = u_xlatb4 && u_xlatb0;
    u_xlat4 = (-_Step) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vs_TEXCOORD0.x<u_xlat4);
#else
    u_xlatb6 = vs_TEXCOORD0.x<u_xlat4;
#endif
    u_xlatb0 = u_xlatb6 && u_xlatb0;
    if(u_xlatb0){
        u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat16_1;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(_Direction==1);
#else
        u_xlatb0 = _Direction==1;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<vs_TEXCOORD0.y);
#else
        u_xlatb2 = u_xlat2<vs_TEXCOORD0.y;
#endif
        u_xlatb0 = u_xlatb2 && u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(vs_TEXCOORD0.y<u_xlat4);
#else
        u_xlatb2 = vs_TEXCOORD0.y<u_xlat4;
#endif
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        if(u_xlatb0){
            u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
            SV_Target0 = u_xlat16_0;
        } else {
            SV_Target0 = _BackgroundColor;
        }
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _Step;
uniform 	vec4 _BackgroundColor;
uniform 	int _Direction;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Direction==0);
#else
    u_xlatb0 = _Direction==0;
#endif
    u_xlat2 = _Step * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat2<vs_TEXCOORD0.x);
#else
    u_xlatb4 = u_xlat2<vs_TEXCOORD0.x;
#endif
    u_xlatb0 = u_xlatb4 && u_xlatb0;
    u_xlat4 = (-_Step) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vs_TEXCOORD0.x<u_xlat4);
#else
    u_xlatb6 = vs_TEXCOORD0.x<u_xlat4;
#endif
    u_xlatb0 = u_xlatb6 && u_xlatb0;
    if(u_xlatb0){
        u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat16_1;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(_Direction==1);
#else
        u_xlatb0 = _Direction==1;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<vs_TEXCOORD0.y);
#else
        u_xlatb2 = u_xlat2<vs_TEXCOORD0.y;
#endif
        u_xlatb0 = u_xlatb2 && u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(vs_TEXCOORD0.y<u_xlat4);
#else
        u_xlatb2 = vs_TEXCOORD0.y<u_xlat4;
#endif
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        if(u_xlatb0){
            u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
            SV_Target0 = u_xlat16_0;
        } else {
            SV_Target0 = _BackgroundColor;
        }
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _Step;
uniform 	vec4 _BackgroundColor;
uniform 	int _Direction;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Direction==0);
#else
    u_xlatb0 = _Direction==0;
#endif
    u_xlat2 = _Step * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat2<vs_TEXCOORD0.x);
#else
    u_xlatb4 = u_xlat2<vs_TEXCOORD0.x;
#endif
    u_xlatb0 = u_xlatb4 && u_xlatb0;
    u_xlat4 = (-_Step) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vs_TEXCOORD0.x<u_xlat4);
#else
    u_xlatb6 = vs_TEXCOORD0.x<u_xlat4;
#endif
    u_xlatb0 = u_xlatb6 && u_xlatb0;
    if(u_xlatb0){
        u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat16_1;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(_Direction==1);
#else
        u_xlatb0 = _Direction==1;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat2<vs_TEXCOORD0.y);
#else
        u_xlatb2 = u_xlat2<vs_TEXCOORD0.y;
#endif
        u_xlatb0 = u_xlatb2 && u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(vs_TEXCOORD0.y<u_xlat4);
#else
        u_xlatb2 = vs_TEXCOORD0.y<u_xlat4;
#endif
        u_xlatb0 = u_xlatb2 && u_xlatb0;
        if(u_xlatb0){
            u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
            SV_Target0 = u_xlat16_0;
        } else {
            SV_Target0 = _BackgroundColor;
        }
    }
    return;
}

#endif
"
}
}
}
}
}