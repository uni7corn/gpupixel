<h1 align="center">
  <a href="https://github.com/pixpark/gpupixel"><img src="./docs/image/describe.png"></a>
</h1>

<p align="center">
  <a href="./README.md">English</a> |
  <a href="./README_CN.md">简体中文</a>
</p>

<p align="center">
  <a href="https://gpupixel.pixpark.net/guide/intro">Build</a>
  <span> · </span>
  <a href="https://reactnative.dev/docs/tutorial">Demo</a>
  <span> · </span>
  <a href="https://reactnative.dev/showcase">Integration</a>
</p>

<p align="center">
   <a href="https://github.com/pixpark/gpupixel/stargazers"><img alt="GPUPixel Stars" src="https://img.shields.io/github/stars/pixpark/gpupixel?style=social"/></a>
    <a href="https://github.com/pixpark/gpupixel/releases/latest"><img alt="GPUPixel Release" src="https://img.shields.io/github/v/release/pixpark/gpupixel"/></a>
    <a href="#"><img alt="GPUPixel Stars" src="https://img.shields.io/badge/Platform-iOS_%7C_Android_%7C_Mac_%7C_Win_%7C_Linux-red"/></a>
     <a href="https://github.com/pixpark/gpupixel/actions/workflows/cmake-multi-platform.yml"><img src="https://github.com/pixpark/gpupixel/actions/workflows/cmake-multi-platform.yml/badge.svg"></a>
    <a href="https://github.com/pixpark/gpupixel/blob/main/LICENSE"><img alt="GPUPixel Stars" src="https://img.shields.io/github/license/pixpark/gpupixel"/></a>
</p>

<p align="center">
<a href="https://trendshift.io/repositories/7103" target="_blank"><img src="https://trendshift.io/api/badge/repositories/7103" alt="pixpark%2Fgpupixel | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>
</p>

---

> Welcome to join us to make GPUPixel better by participating [discussions](https://github.com/pixpark/gpupixel/discussions), opening [issues](https://github.com/pixpark/gpupixel/issues/new/choose), submitting [PRs](https://github.com/pixpark/gpupixel/pulls) 👏.

## Introduction

⛰️ GPUPixel is a real-time, high-performance image and video filter library, extremely easy to compile and integrate with  small library size.

🔑 GPUPixel  is written in C++11 and is based on OpenGL/ES, incorporating a built-in beauty face filter that achieves commercial-grade beauty effects.

🔌 GPUPixel supports platforms including `iOS`, `Android`, `Mac`, `Win` and `Linux`. It can theoretically be ported to any platform that supports OpenGL/ES.

## Effects Preview

👉 **Video: <a href="https://youtu.be/9BY1Qx1NEPs" target="_blank">YouTube</a> | <a href="https://www.bilibili.com/video/BV1xQ4y1L7Fh/?share_source=copy_web&vd_source=46adcb1014fa989cfcbb4cc1e866831e" target="_blank">BiliBili</a>**


|                   **Origin**                    |                    **Smooth**                     |                    **White**                     |                   **ThinFace**                    |
| :---------------------------------------------: | :-----------------------------------------------: | :----------------------------------------------: | :-----------------------------------------------: |
| <img src="./docs/image/origin.gif" width="180px"> |  <img src="./docs/image/smooth.gif" width="180px">  |  <img src="./docs/image/white.gif" width="180px">  | <img src="./docs/image/thinface.gif" width="180px"> |
|                   **BigEye**                    |                   **Lipstick**                    |                   **Blusher**                    |                    **ON-OFF**                     |
| <img src="./docs/image/bigeye.gif" width="180px"> | <img src="./docs/image/lipstick.gif" width="180px"> | <img src="./docs/image/blusher.gif" width="180px"> |  <img src="./docs/image/on-off.gif" width="180px">  |

## Architecture
![](./docs/image/arch-en.jpg)

## Features

This table compares the features supported by **GPUPixel** and **GPUImage** and **Android-GPUImage**:

✅: Supported | ❌: Not supported | ✏️: Planning

|                       | [GPUPixel](https://github.com/pixpark/gpupixel) | [GPUImage](https://github.com/BradLarson/GPUImage) | [Android-GPUImage](https://github.com/cats-oss/android-gpuimage) |
| :-------------------- | :---------------------------------------------: | :------------------------------------------------: | :----------------------------------------------------------: |
| 📷 **Filters:**        |                        ✅                        |                         ❌                          |                              ❌                               |
| Skin Smoothing Filter |                        ✅                        |                         ❌                          |                              ❌                               |
| Skin Whitening Filter |                        ✅                        |                         ❌                          |                              ❌                               |
| Face Slimming Filter  |                        ✅                        |                         ❌                          |                              ❌                               |
| Big Eyes Filter       |                        ✅                        |                         ❌                          |                              ❌                               |
| Lipstick Filter       |                        ✅                        |                         ❌                          |                              ❌                               |
| Blush Filter          |                        ✅                        |                         ❌                          |                              ❌                               |
| More Build in Filter  |                        ✅                        |                         ✅                          |                              ✅                               |
| 🎬 **Input Formats:**  |                                                 |                                                    |                                                              |
| YUV420P(I420)         |                        ✅                        |                         ❌                          |                              ❌                               |
| RGBA                  |                        ✅                        |                         ✅                          |                              ✅                               |
| JPEG                  |                        ✅                        |                         ✅                          |                              ✅                               |
| PNG                   |                        ✅                        |                         ✅                          |                              ✅                               |
| NV21(for Android)     |                        ✏️                        |                         ❌                          |                              ❌                               |
| 🎥 **Output Formats:** |                                                 |                                                    |                                                              |
| RGBA                  |                        ✅                        |                         ✅                          |                              ✅                               |
| YUV420P(I420)         |                        ✏️                        |                         ❌                          |                              ❌                               |
| 💻 **Platform:**       |                                                 |                                                    |                                                              |
| iOS                   |                        ✅                        |                         ✅                          |                              ❌                               |
| Mac                   |                        ✅                        |                         ✅                          |                              ❌                               |
| Android               |                        ✅                        |                         ❌                          |                              ✅                               |
| Win                   |                        ✅                        |                         ❌                          |                              ❌                               |
| Linux                 |                        ✅                        |                         ❌                          |                              ❌                               |


##  Performance
### iPhone
|       -        | iPhone 6P | iPhone 8 | iPhone X | iPhone 11 | iPhone 14 pro |
| :------------: | :-------: | :------: | :------: | :-------: | :-----------: |
|    **CPU**     |    5%     |    5%    |    3%    |    3%     |      3%       |
| **Time Taken** |   10ms    |   4ms    |   3ms    |    3ms    |      3ms      |
### Android
|     -      | Xiaomi 10 | Huawei Mate30 | Vivo  | SAMSUNG | Google Pixel |
| :--------: | :-------: | :-----------: | :---: | :-----: | :----------: |
|    CPU     |    3%     |      5%       |   -   |    -    |      -       |
| Time Taken |    6ms    |      5ms      |   -   |    -    |      -       |


## Lib Size

|       | iOS(.framework) | MacOS(.framework) | Android(.aar) |
| :---: | :-------------: | :---------------: | :-----------: |
| Size  |     2.4 MB      |      2.6 MB       |    2.1 MB     |


## Before You Start
⭐️ Star us on GitHub, and be instantly notified for new releases!

![](./docs/image/give-star.gif)



## Getting Started

See the doc: [Introduction](https://gpupixel.pixpark.net/guide/build) | [Build](https://gpupixel.pixpark.net/guide/build) | [Examples](https://gpupixel.pixpark.net/guide/demo) | [Integrated](https://gpupixel.pixpark.net/guide/integrated)

## Contributing

Welcome to join us to make GPUPixel better by participating [discussions](https://github.com/pixpark/gpupixel/discussions), opening [issues](https://github.com/pixpark/gpupixel/issues/new/choose), submitting [PRs](https://github.com/pixpark/gpupixel/pulls).

At the same time, please consider supporting GPUPixel by sharing it on social media and at events and conferences.

## Contributors

[![](https://opencollective.com/gpupixel/contributors.svg?width=890&button=false)](https://github.com/pixpark/gpupixel/graphs/contributors)

## Acknowledgement
### Reference Project
1. [GPUImage](https://github.com/BradLarson/GPUImage) 
2. [CainCamera](https://github.com/CainKernel/CainCamera)
3. [AwemeLike](https://github.com/ZZZZou/AwemeLike)
4. [VNN](https://github.com/joyycom/VNN)

## License
This repository is available under the [MIT License](https://github.com/pixpark/gpupixel?tab=MIT-1-ov-file#readme).
