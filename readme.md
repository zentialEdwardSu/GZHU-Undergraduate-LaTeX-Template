# 广州大学本科生毕业论文LaTex模板

> 如果你在寻找适用于硕士/博士学位论文或者更强大且整洁的论文模板，这里有你所期望的😊[Ian-Jhon/GZHU_Thesis_Latex_Template](https://github.com/Ian-Jhon/GZHU_Thesis_Latex_Template)


> 厌倦了TexLive巨大的包体积了吗？不想再看XeLaTeX冗长又几乎毫无帮助的报错信息了吗？厌倦了超长的编译时间了吗？ 来试试[Typst](https://typst.app/)吧🤗，甚至也有论文模板[bigsaltyfishes/gzhu-typst-thesis](https://github.com/bigsaltyfishes/gzhu-typst-thesis)🤓☝️

本文档基于[swq123459的毕业论文LaTeX模板改编](https://github.com/swq123459/GZHU-Report-Latex-Version/blob/master/%E5%AE%98%E6%96%B9%E7%89%88-%E6%9C%BA%E7%94%B5%E5%AD%A6%E9%99%A2%E6%AF%95%E4%B8%9A%E8%AE%BA%E6%96%87%E6%A8%A1%E6%9D%BF/document.tex)
主要进行了以下改进:
- 更加符合 广州大学学生毕业论文（设计）规范的封面
- 更加美观地实现了目录中section的引导线以及section*的目录项
- 基于gbt7714-bibtex-style的bibtex引用格式
- 在图按章节索引的基础上，让表格也按章节索引

# 使用

使用前应安装textlive的`ctex`与`gbt7714-bibtex-style`包

对于 NixOS/Nix-Darwin 用户，安装缺失字体后，通过 `nix develop` 激活环境即可，如果已经配置了 `direnv`，代码目录下执行 `direnv allow` 即可激活环境🤓☝️
PS: 绝大多数字体可以从 NUR 中获取(rewine.ttf-ms-win10)，黑体和楷体_GB2312网上找了以后用 Overlay 覆写或者自己打包安装即可

在需要使用`section*`时总是应该按照以下方法使用
```Tex
\phantomsection % 保证目录超链接跳转
\section*{你的标题}
\addcontentsline{toc}{层次(section)}{你的标题} %显示目录项
```

模板中的英文和中文字体可能需要根据实际情况更改以通过编译

# 引用

- https://github.com/zepinglee/gbt7714-bibtex-style 提供了符合gb7714-2015的引用样式
- https://ctex.org/ 提供了非常有用的中文排版工具
- https://github.com/swq123459/GZHU-Report-Latex-Version 本模板的来源，里面还有其他的实用模板

# 许可证

Copyright © 2018 SuWeiQiang. All rights reserved.

Copyright © 2025 EdwardSu. All rights reserved.

第三方许可证见[COPYING](./COPYING)
