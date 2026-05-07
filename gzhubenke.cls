\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gzhubenke}[2025/05/26 广州大学本科论文模板]

\newif\ifgzhubenke@autofakebold

\def\gzhubenke@ctexfontset{fandol}
\def\gzhubenke@latinmain{TeX Gyre Termes}
\def\gzhubenke@latinsans{TeX Gyre Heros}
\def\gzhubenke@latinmono{TeX Gyre Cursor}
\def\gzhubenke@cjksong{}
\def\gzhubenke@cjkhei{}
\def\gzhubenke@cjkkai{}
\def\gzhubenke@cjkmono{}

\newcommand{\gzhubenke@parse@fontset}[1]{%
    \expandafter\gzhubenke@parse@fontset@aux#1\@nil
}

\def\gzhubenke@parse@fontset@aux#1=#2\@nil{%
    \edef\gzhubenke@ctexfontset{#2}%
}

\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{letterpaper}{article}}
\DeclareOption{AutoFakeBold}{\gzhubenke@autofakeboldtrue}
\DeclareOption*{%
    \@expandtwoargs\in@{fontset=}{\CurrentOption}%
    \ifin@
        \gzhubenke@parse@fontset{\CurrentOption}%
    \else
        \PassOptionsToClass{\CurrentOption}{article}%
    \fi
}
\ExecuteOptions{12pt,a4paper,AutoFakeBold}
\ProcessOptions\relax

\LoadClass{article}

% 加载需要的宏包
\RequirePackage{graphicx}
\edef\gzhubenke@load@ctex{%
    \noexpand\RequirePackage[fontset=\gzhubenke@ctexfontset,UTF8,heading=true]{ctex}%
}
\gzhubenke@load@ctex
\RequirePackage{keyval}
\ifgzhubenke@autofakebold
    \xeCJKsetup{AutoFakeBold=true}
\fi
\RequirePackage{indentfirst}
\RequirePackage{amsmath}
\RequirePackage{bm}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{amsfonts}
\RequirePackage{fontspec}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{enumerate}
\RequirePackage{chngcntr}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{abstract}
\RequirePackage{setspace}
\RequirePackage{makecell}
\RequirePackage{float}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage[left=2.7cm, right=2.5cm, top=2cm, bottom=2cm]{geometry}
\RequirePackage{gbt7714}

% 字体设置
\setmainfont{\gzhubenke@latinmain}
\setsansfont{\gzhubenke@latinsans}
\setmonofont{\gzhubenke@latinmono}

\define@key{gzhubenke}{latin-main}{\def\gzhubenke@latinmain{#1}}
\define@key{gzhubenke}{latin-sans}{\def\gzhubenke@latinsans{#1}}
\define@key{gzhubenke}{latin-mono}{\def\gzhubenke@latinmono{#1}}
\define@key{gzhubenke}{cjk-song}{\def\gzhubenke@cjksong{#1}}
\define@key{gzhubenke}{cjk-hei}{\def\gzhubenke@cjkhei{#1}}
\define@key{gzhubenke}{cjk-kai}{\def\gzhubenke@cjkkai{#1}}
\define@key{gzhubenke}{cjk-mono}{\def\gzhubenke@cjkmono{#1}}
\define@key{gzhubenke}{fontset}{\ClassError{gzhubenke}{`fontset' must be used as a class option}{Use \string\documentclass[fontset=#1]\string{gzhubenke\string}.}}

\newcommand{\gzhubenke@ifempty}[3]{%
    \if\relax\detokenize{#1}\relax
        #2%
    \else
        #3%
    \fi
}

\newcommand{\gzhubenke@apply@font@overrides}{%
    \setmainfont{\gzhubenke@latinmain}%
    \setsansfont{\gzhubenke@latinsans}%
    \setmonofont{\gzhubenke@latinmono}%
    \gzhubenke@ifempty{\gzhubenke@cjksong}{}{\setCJKmainfont{\gzhubenke@cjksong}\setCJKfamilyfont{zhsong}{\gzhubenke@cjksong}}%
    \gzhubenke@ifempty{\gzhubenke@cjkhei}{}{\setCJKsansfont{\gzhubenke@cjkhei}\setCJKfamilyfont{zhhei}{\gzhubenke@cjkhei}}%
    \gzhubenke@ifempty{\gzhubenke@cjkkai}{}{\setCJKfamilyfont{zhkai}{\gzhubenke@cjkkai}}%
    \gzhubenke@ifempty{\gzhubenke@cjkmono}{}{\setCJKmonofont{\gzhubenke@cjkmono}}%
}

\newcommand{\gzhusetup}[1]{%
    \setkeys{gzhubenke}{#1}%
    \gzhubenke@apply@font@overrides
}

\newcommand{\hei}{\CJKfamily{zhhei}}
\newcommand{\kai}{\CJKfamily{zhkai}}
\newcommand{\song}{\CJKfamily{zhsong}}

% 页眉页脚设置
\pagestyle{plain}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.4pt}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}

% 章节标题格式左 上 下的缩进
\titlespacing{\section}{0pt}{0pt}{2em}
\titlespacing{\subsection}{2em}{1em}{1em}
\titlespacing{\subsubsection}{2em}{1em}{0pt}

\titleformat{\section}{\centering\zihao{3}\hei\bfseries}{第\chinese{section}章}{0.5em}{}
\titleformat{\subsection}{\zihao{-4}\hei\bfseries}{\arabic{section}.\arabic{subsection}}{0.5em}{}
\titleformat{\subsubsection}{\zihao{-4}\hei\bfseries}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{0.5em}{}

% 图表名称设置
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 图 表 算法 按照章节重置
\counterwithin{figure}{section}
\counterwithin{table}{section}
\numberwithin{equation}{section}
\counterwithin{algorithm}{section}

\renewcommand{\thetable}{\thesection{}.\arabic{table}}
\renewcommand{\thefigure}{\thesection{}.\arabic{figure}}

% 目录格式设置
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsecpagefont}{\normalfont}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\setlength{\cftbeforesubsubsecskip}{3pt}
\setlength{\cftaftertoctitleskip}{3em}
% 引导线
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% 图表标题格式
\DeclareCaptionFormat{myformat}{\song\zihao{5}#1#2\quad#3}
\captionsetup{format=myformat, labelsep=none}

% 行距设置
\newcommand{\mkls}{\linespread{1.6428}\selectfont}

% 快捷引用
\newcommand{\refsec}[1]{第\ref{#1}章}
\newcommand{\refsubsec}[1]{\ref{#1}节}
\newcommand{\refig}[1]{图 \ref{#1} }
\newcommand{\refeq}[1]{公式 （\ref{#1}）}

% 大型方程环境
\newenvironment{largeequation}{
    \begin{large}\begin{equation}
}{
    \end{equation}\end{large}
}

% 表格线宽设定
\def\I{\vrule width1.2pt}

% 固定下划线长度
\makeatletter
\newcommand\dlmu[2][4cm]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\makeatother

% 代码格式设置
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
    basicstyle          =   \sffamily,
    keywordstyle        =   \bfseries,
    commentstyle        =   \rmfamily\itshape,
    stringstyle         =   \ttfamily,
    flexiblecolumns,    
    numbers             =   left,
    showspaces          =   false,
    numberstyle         =   \zihao{-5}\ttfamily,
    showstringspaces    =   false,
    captionpos          =   t,
    frame               =   lrtb,
}

% 超链接设置
\RequirePackage[colorlinks,linkcolor=black,anchorcolor=blue,citecolor=black]{hyperref}

% 参考文献设置
% https://github.com/zepinglee/gbt7714-bibtex-style/tree/master
% not include doi/uri in bib, otherwise J-> J/OL
\bibliographystyle{gbt7714-numerical}

% 节号样式设置
\ctexset{
    section = {
        format+ = \song\zihao{-4},
        name = {第,章},
        number = \chinese{section}
    }
}

\renewcommand{\footnoterule}{}

\endinput
