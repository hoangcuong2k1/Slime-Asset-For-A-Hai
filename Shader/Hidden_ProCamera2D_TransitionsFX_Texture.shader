//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ProCamera2D/TransitionsFX/Texture" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_Step ("Step", Range(0, 1)) = 0
_BackgroundColor ("Background Color", Color) = (0,0,0,1)
_TransitionTex ("Transition Texture", 2D) = "white" { }
_Smoothing ("Smoothing", Range(0, 1)) = 0.1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 36506
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
uniform 	float _Smoothing;
uniform lowp sampler2D _TransitionTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
    u_xlatb0 = _Step==1.0;
    if(u_xlatb0){
        SV_Target0 = _BackgroundColor;
        return;
    }
    u_xlat0.x = texture2D(_TransitionTex, vs_TEXCOORD0.xy).x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb3 = _Step>=u_xlat0.x;
    if(u_xlatb3){
        u_xlat3 = (-_Smoothing) + 1.0;
        u_xlatb3 = u_xlat3<_Step;
        u_xlat0.x = (-u_xlat0.x) + _Step;
        u_xlat6 = (-_Step) + 1.0;
        u_xlat6 = u_xlat0.x / u_xlat6;
        u_xlat0.x = u_xlat0.x / _Smoothing;
        u_xlat0.x = (u_xlatb3) ? u_xlat6 : u_xlat0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        u_xlat2 = (-u_xlat10_1) + _BackgroundColor;
        u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
        SV_Target0 = u_xlat0;
        return;
    }
    SV_Target0 = u_xlat10_1;
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
uniform 	float _Smoothing;
uniform lowp sampler2D _TransitionTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
    u_xlatb0 = _Step==1.0;
    if(u_xlatb0){
        SV_Target0 = _BackgroundColor;
        return;
    }
    u_xlat0.x = texture2D(_TransitionTex, vs_TEXCOORD0.xy).x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb3 = _Step>=u_xlat0.x;
    if(u_xlatb3){
        u_xlat3 = (-_Smoothing) + 1.0;
        u_xlatb3 = u_xlat3<_Step;
        u_xlat0.x = (-u_xlat0.x) + _Step;
        u_xlat6 = (-_Step) + 1.0;
        u_xlat6 = u_xlat0.x / u_xlat6;
        u_xlat0.x = u_xlat0.x / _Smoothing;
        u_xlat0.x = (u_xlatb3) ? u_xlat6 : u_xlat0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        u_xlat2 = (-u_xlat10_1) + _BackgroundColor;
        u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
        SV_Target0 = u_xlat0;
        return;
    }
    SV_Target0 = u_xlat10_1;
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
uniform 	float _Smoothing;
uniform lowp sampler2D _TransitionTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
    u_xlatb0 = _Step==1.0;
    if(u_xlatb0){
        SV_Target0 = _BackgroundColor;
        return;
    }
    u_xlat0.x = texture2D(_TransitionTex, vs_TEXCOORD0.xy).x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb3 = _Step>=u_xlat0.x;
    if(u_xlatb3){
        u_xlat3 = (-_Smoothing) + 1.0;
        u_xlatb3 = u_xlat3<_Step;
        u_xlat0.x = (-u_xlat0.x) + _Step;
        u_xlat6 = (-_Step) + 1.0;
        u_xlat6 = u_xlat0.x / u_xlat6;
        u_xlat0.x = u_xlat0.x / _Smoothing;
        u_xlat0.x = (u_xlatb3) ? u_xlat6 : u_xlat0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        u_xlat2 = (-u_xlat10_1) + _BackgroundColor;
        u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
        SV_Target0 = u_xlat0;
        return;
    }
    SV_Target0 = u_xlat10_1;
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
uniform 	float _Smoothing;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Step==1.0);
#else
    u_xlatb0 = _Step==1.0;
#endif
    if(u_xlatb0){
        SV_Target0 = _BackgroundColor;
        return;
    }
    u_xlat0.x = texture(_TransitionTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Step>=u_xlat0.x);
#else
    u_xlatb3 = _Step>=u_xlat0.x;
#endif
    if(u_xlatb3){
        u_xlat3 = (-_Smoothing) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat3<_Step);
#else
        u_xlatb3 = u_xlat3<_Step;
#endif
        u_xlat0.x = (-u_xlat0.x) + _Step;
        u_xlat6 = (-_Step) + 1.0;
        u_xlat6 = u_xlat0.x / u_xlat6;
        u_xlat0.x = u_xlat0.x / _Smoothing;
        u_xlat0.x = (u_xlatb3) ? u_xlat6 : u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2 = (-u_xlat16_1) + _BackgroundColor;
        u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat16_1;
        SV_Target0 = u_xlat0;
        return;
    }
    SV_Target0 = u_xlat16_1;
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
uniform 	float _Smoothing;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Step==1.0);
#else
    u_xlatb0 = _Step==1.0;
#endif
    if(u_xlatb0){
        SV_Target0 = _BackgroundColor;
        return;
    }
    u_xlat0.x = texture(_TransitionTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Step>=u_xlat0.x);
#else
    u_xlatb3 = _Step>=u_xlat0.x;
#endif
    if(u_xlatb3){
        u_xlat3 = (-_Smoothing) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat3<_Step);
#else
        u_xlatb3 = u_xlat3<_Step;
#endif
        u_xlat0.x = (-u_xlat0.x) + _Step;
        u_xlat6 = (-_Step) + 1.0;
        u_xlat6 = u_xlat0.x / u_xlat6;
        u_xlat0.x = u_xlat0.x / _Smoothing;
        u_xlat0.x = (u_xlatb3) ? u_xlat6 : u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2 = (-u_xlat16_1) + _BackgroundColor;
        u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat16_1;
        SV_Target0 = u_xlat0;
        return;
    }
    SV_Target0 = u_xlat16_1;
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
uniform 	float _Smoothing;
UNITY_LOCATION(0) uniform mediump sampler2D _TransitionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Step==1.0);
#else
    u_xlatb0 = _Step==1.0;
#endif
    if(u_xlatb0){
        SV_Target0 = _BackgroundColor;
        return;
    }
    u_xlat0.x = texture(_TransitionTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Step>=u_xlat0.x);
#else
    u_xlatb3 = _Step>=u_xlat0.x;
#endif
    if(u_xlatb3){
        u_xlat3 = (-_Smoothing) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat3<_Step);
#else
        u_xlatb3 = u_xlat3<_Step;
#endif
        u_xlat0.x = (-u_xlat0.x) + _Step;
        u_xlat6 = (-_Step) + 1.0;
        u_xlat6 = u_xlat0.x / u_xlat6;
        u_xlat0.x = u_xlat0.x / _Smoothing;
        u_xlat0.x = (u_xlatb3) ? u_xlat6 : u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2 = (-u_xlat16_1) + _BackgroundColor;
        u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat16_1;
        SV_Target0 = u_xlat0;
        return;
    }
    SV_Target0 = u_xlat16_1;
    return;
}

#endif
"
}
}
}
}
}