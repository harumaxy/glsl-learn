# GLSL Learn

GLSL を学ぶ


## Godot Shader と GLSL の対応表

基本的にGLSL互換だが微妙に違うところがある。


fragment
- gl_FragColor = `COLOR`
- gl_FragCoord = `FRAGCOORD`

vertex
- gl_Position = `VERTEX`
- gl_PointSize = `POINT_SIZE`
- gl_PointCoord = `POINT_COORD`
- gl_FrontFacing = `FROMT_FACING`


その他のルール
- GLSLでは、`fragment / vertex shader`はそれぞれ`main`関数を持つ
- Godotでは、１つのシェーダーファイルに`void fragment()`と`void vertex()`をそれぞれ書く
  - GLSL からコピーしてくるときは、`main`関数の名前を変えるべし


マクロ
- GLSLでは、Cとの類似性のためにマクロが使える。
- ただし、Godotにはマクロがない
  - マクロを移植するには、
    - `#define`は関数、定数で置き換える
    - `#if`, `#ifdef`といった条件付きコンパイルマクロは代替手段がない


uniform & varying
- どちらも普通に使える
- uniformは、GDScriptから入力できる。　
- varying は、 vertex -> fragment に値を渡す
  - in / out キーワード

precision
- float または int の精度を定義する。
- Godot では、型の前に前置詞 `lowp`, `mediump`, `highp` を配置することで変数の精度を定義する。
  - 例 `highp float length = 1.0;`


## Shadertory
flagment shader を記述するサイト
ここでのエントリーポイントは、`mainImage()`関数

ここを参考にするには、`mainImage()`を`fragment()`にリネームして、
`fragColor`変数と`fragCoord`変数をそれぞれ置き換える


## The Book of Shader

[The Book of Shaders](https://thebookofshaders.com/)

有名なサイト
ここで使われてる`uniform`変数を置き換えるには

- `u_resolution` = `1.0 / SCREEEN_PIXEL_SIZE`
- `u_time` = `TIME`
- `u_mouse` = uniform を使って、GDScriptから提供
