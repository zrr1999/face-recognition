#import emoji: checkmark, crossmark, construction
#import "@local/bone-document:0.1.0": document-init
#import "utils.typ": include-section
#show: document-init.with(title: "多模态特征提取研究情况", author: "詹荣瑞")

= 方法和模型
== Face Detection
- opencv
- ssd
- #checkmark dlib
- mtcnn
- retinaface
- #checkmark mediapipe

== Face Recognition (Feature Extraction)
- #checkmark OpenFace
- #checkmark DeepFace
- DeepID
- #checkmark ArcFace
- #checkmark Facenet
- #checkmark Facenet512

== Facial Feature Recognition
- #checkmark VGG-Face

== Classification
- #checkmark Fully Connected Layer
- VGG-Face

= 实验
== 特征提取
使用每个检测模型和识别模型（特征提取部分）分别提取特征，命名成
`f"{detection_method}_{recognition_method}.pkl"`。

== 分类模型训练
对每类特征分别进行 `kfold-10` 的交叉 `10000` 批次的训练，在 `10` 次损失不下降的情况下停止训练（这个数值可能有点小，后续调整）。
目前给出了每次训练的精度和 `10` 次训练的平均精度。

早熟机制：
- #checkmark Loss
- #checkmark Accuracy
- #crossmark Precision
- #crossmark Recall
- #crossmark F1
- #checkmark Weighted-F1

= 指标
- #checkmark Accuracy
- #checkmark Weighted-F1

= 结果
// typstfmt::off
#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*检测方法*], [*特征提取方法*], [*精度*], [*weighted-F1*],
  text(blue)[dlib], text(blue)[Facenet], text(blue)[91.33\%], text(blue)[90.93\%] ,
  [dlib], [ArcFace], [2.29\%], [1.00\%] ,
  [dlib], [OpenFace], [1.85\%], [0.18\%] ,
  [dlib], [DeepFace], [71.04\%], [70.20\%] ,
  [dlib], [Facenet512], [76.40\%], [75.60\%] ,
  text(blue)[dlib], text(blue)[VGG-Face], text(blue)[99.37\%], text(blue)[99.33\%] ,
  text(blue)[mediapipe], text(blue)[Facenet], text(blue)[94.17\%], text(blue)[94.00\%] ,
  [mediapipe], [ArcFace], [1.12\%], [0.19\%] ,
  [mediapipe], [OpenFace], [21.88\%], [19.60\%] ,
  [mediapipe], [DeepFace], [79.90\%], [79.34\%] ,
  [mediapipe], [Facenet512], [82.82\%], [82.33\%] ,
  text(blue)[mediapipe], text(blue)[VGG-Face], text(blue)[98.72\%], text(blue)[98.68\%] ,
)
#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*特征方法*], [*特征层级*], [*精度*], [*weighted-F1*],
  [GeMAPSv01a], [lld], [52.40\%], [52.37\%],
  [GeMAPSv01b], [lld], [49.60\%], [48.55\%],
  [eGeMAPSv01a], [lld], [55.97\%], [56.39\%],
  [eeGeMAPSv01b], [lld], [56.87\%], [57.20\%],
  [eGeMAPSv02], [lld], [59.10\%], [59.02\%],
  [emobase], [lld], [69.90\%], [70.01\%],
)
// typstfmt::on

= 数据集

== UCEC-Face
数据集由若干图片组成，每张图片包含一个人的脸部，图片的命名格式为如下
```sh
$DATASETS/Face-Dataset/UCEC-Face/subject{i}/subject{i}.{j}.png
```
其中i表示人的编号，$j$表示图片的编号，$i$的范围是$1-130$，$j$从$0$开始，范围并不固定。


= 参考资料
- #link("https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=10210367")[Chinese Face Dataset for Face Recognition]
- #link("https://github.com/serengil/deepface")[Deepface Package]
