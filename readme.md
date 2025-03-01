# 广州大学本科生毕业论文(设计) 模板？

> 如果你在寻找适用于硕士/博士学位论文或者更强大且整洁的论文模板，这里有你所期望的😊[Ian-Jhon/GZHU_Thesis_Latex_Template](https://github.com/Ian-Jhon/GZHU_Thesis_Latex_Template)

本文档基于[swq123459的毕业论文LaTeX模板改编](https://github.com/swq123459/GZHU-Report-Latex-Version/blob/master/%E5%AE%98%E6%96%B9%E7%89%88-%E6%9C%BA%E7%94%B5%E5%AD%A6%E9%99%A2%E6%AF%95%E4%B8%9A%E8%AE%BA%E6%96%87%E6%A8%A1%E6%9D%BF/document.tex)
主要进行了以下改进:
- 更加符合 广州大学学生毕业论文（设计）规范的封面
- 更加美观地实现了目录中section的引导线以及section*的目录项
- 基于gbt7714-bibtex-style的bibtex引用格式
- 在图按章节索引的基础上，让表格也按章节索引

# 使用

使用前应安装textlive的`ctex`与`gbt7714-bibtex-style`包

如果你正在使用NixOs/Nix且安装了direnv，可直接通过`direnv allow`激活环境🤓☝️

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