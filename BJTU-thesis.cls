%===================================================
% 改自研究生院提供的博士学位论文Latex单页模板，https://gs.bjtu.edu.cn/cms/item/477.html
% 
% 使用说明：
% 1. 纸质版及图书馆最终提交电子版请在demo.tex中使用twoside
% 2. 匿名送审和在线送审的电子版，去掉twoside就是单页模板，便于电子阅读。
% 3. 理论上硕士与博士模板通用，修改demo.tex中\documentclass命令即可
% 4. 编译环境：在线可以用overleaf，www.overleaf.com；离线TexLive+TexStudio
% 5. 编译请使用xelatex
%
% 修改/完善的内容包括：
% 1. 与最新word模板同步，添加了答辩名单页、答辩决议页
% 2. 修正twoside中的偶数空白页页眉页脚问题，见demo.tex
% 3. 修正页脚字体大小及间距
% 4. 修改英文和数字字体为Times New Roman
% 5. 设置图表描述默认为居中对齐
% 6. 修正itemize的行距与正文一致
% 7. 增添命令来打中文括弧，避免正文中直接写中文括号出现的文字光标错位问题
%
% by 赵苡积，2023.05
%===================================================

%导入需要的宏包
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs,upgreek,array,mathrsfs,times,indentfirst,multirow,graphicx,graphbox}
\RequirePackage{fancyhdr}


%依赖的Latex版本
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
%声明本文档为模板类
\ProvidesClass{BJTU-thesis}


%根据用户选项LoadClass
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\if@isEnMaster\@isEnMasterfalse
\newif\if@isAcMaster\@isAcMasterfalse
\newif\if@isDoctor\@isDoctorfalse
\newif\if@isTwoSide\@isTwoSidefalse
%专硕
\DeclareOption{EnMaster}{\@isEnMastertrue}
%学硕
\DeclareOption{AcMaster}{\@isAcMastertrue}
%博士
\DeclareOption{Doctor}{\@isDoctortrue}
\DeclareOption{twoside}{\@isTwoSidetrue}
\ProcessOptions\relax
\if@isTwoSide
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openright,UTF8,space=auto]{ctexbook}
\fi

%设置英文和数字字体为Times New Roman
\usepackage{fontspec} 
\setmainfont{Times New Roman}


%定义使用者需要填写的标签
\def\BJTU@label@schoolNumber{学校代码:~}
\def\BJTU@label@classification{密级:~}
\def\BJTU@label@author{作者姓名:~}
\def\BJTU@label@studentNumber{学~~~~~~号:~}
\def\BJTU@label@advisor{导师姓名:~}
\def\BJTU@label@advisorTitle{职~~~~~~称:~}
\def\BJTU@label@engineeringMasterField{工程硕士专业领域:~}
\def\BJTU@label@degreeLevel{学位级别:~}
\def\BJTU@label@degreeType{学位类别:~}
\def\BJTU@label@major{学科专业:~}
\def\BJTU@label@researchArea{研究方向:~}

%定义上述标签的默认值
\def\BJTU@value@schoolNumber{10004}
\def\BJTU@value@classification{公开}
\def\BJTU@value@author{XXXX}
\def\BJTU@value@studentNumber{XXXX}
\def\BJTU@value@advisor{XXXX}
\def\BJTU@value@advisorTitle{XXXX}
\def\BJTU@value@engineeringMasterField{XXXX}
\if@isDoctor
\def\BJTU@value@degreeLevel{博士}
\else
\def\BJTU@value@degreeLevel{硕士}
\fi
\def\BJTU@value@degreeType{XXXX}
\def\BJTU@value@major{XXXX}
\def\BJTU@value@researchArea{XXXX}
\def\BJTU@value@title{中文题目}
\def\BJTU@value@englishtitle{英文题目}




%定义用户填写上述标签对应值的命令,需要用户在主文档自行调用
\newcommand\schooNumber[1]{\def\BJTU@value@schoolNumber{#1}}
\newcommand\classification[1]{\def\BJTU@value@classification{#1}}
\renewcommand\author[1]{\def\BJTU@value@author{#1}}
\newcommand\studentNumber[1]{\def\BJTU@value@studentNumber{#1}}
\newcommand\advisor[1]{\def\BJTU@value@advisor{#1}}
\newcommand\advisorTitle[1]{\def\BJTU@value@advisorTitle{#1}}
\newcommand\engineeringMasterField[1]{\def\BJTU@value@engineeringMasterField{#1}}
\newcommand\degreeType[1]{\def\BJTU@value@degreeType{#1}}
\newcommand\major[1]{\def\BJTU@value@major{#1}}
\newcommand\researchArea[1]{\def\BJTU@value@researchArea{#1}}
\newcommand\englishtitle[1]{\def\BJTU@value@englishtitle{#1}}
\renewcommand\title[1]{\def\BJTU@value@title{#1}}
\newcommand\datetime[1]{\def\BJTU@label@datetime{#1}}


%%empty page

\newcommand{\makeEmptyPage}{

 \thispagestyle{empty}{
	 \ 
}

}

\newcommand{\twosideEmptyPage}{
	\if@isTwoSide
	\makeEmptyPage
	\fi
}



%制作内封
\newcommand{\makeInfo}{
	\newpage
	\pagenumbering{roman}
	\thispagestyle{plain}
	{\songti\zihao{5}\noindent\BJTU@label@schoolNumber\BJTU@value@schoolNumber}
	\hfill
	{\songti\zihao{5}\BJTU@label@classification\BJTU@value@classification}
	%这里控制上下间距
	\vspace{31.5pt}
	\begin{center}
		{\kaishu\zihao{0}北~京~交~通~大~学\\}
		%这里控制上下间距
		\if@isDoctor
		{\songti\zihao{2}\textbf{博~士~学~位~论~文}\\}
		\else
		{\songti\zihao{2}硕~士~学~位~论~文\\}
		\fi
		%这里控制上下间距
		\vspace{44pt}
		{\songti\zihao{-3}\BJTU@value@title\\}
		%这里控制上下间距
		\vspace{15pt}
		{\songti\zihao{-3}\BJTU@value@englishtitle\\}
	\end{center}
	%这里控制上下间距
	\vspace{48pt}
	{\songti\zihao{4}
		\begin{tabular}{ll}
			\BJTU@label@author \BJTU@value@author  \hspace{25mm} & \BJTU@label@studentNumber \BJTU@value@studentNumber \\
			\\
			\BJTU@label@advisor \BJTU@value@advisor & \BJTU@label@advisorTitle \BJTU@value@advisorTitle \\
			\\
			\if@isEnMaster
			\BJTU@label@engineeringMasterField \BJTU@value@engineeringMasterField& \BJTU@label@degreeLevel \BJTU@value@degreeLevel \\
			\else
			\BJTU@label@degreeType \BJTU@value@degreeType & \BJTU@label@degreeLevel \BJTU@value@degreeLevel \\
			\\
			\BJTU@label@major \BJTU@value@major&  \BJTU@label@researchArea \BJTU@value@researchArea  
			\fi
		\end{tabular}
	}	

	\vfill
	\begin{center}
           {\songti\zihao{4}北京交通大学\ \ \ \ }\\
           {\vspace{10pt}\BJTU@label@datetime}
	\end{center}
}


%定义答辩委员会环境
\newenvironment{committee}{
	\chapter*{答辩委员会名单}\thispagestyle{plain}
}{}

%重新定义致谢环境
\renewenvironment{thanks}{
	\chapter*{致谢}\thispagestyle{plain}
}{}

%定义中文摘要环境
\newenvironment{abstract}{
	\chapter*{摘要}
	\markboth{摘要}{摘要}
	\addcontentsline{toc}{chapter}{摘要}
}{}

%定义英文摘要环境
\newenvironment{englishabstract}{
	\chapter*{ABSTRACT}
	\markboth{ABSTRACT}{ABSTRACT}
	\addcontentsline{toc}{chapter}{ABSTRACT}
}{}

%定义中英文关键词命令
\newcommand{\keywords}[1]{\textbf{关键词：}#1}
\newcommand{\englishkeywords}[1]{\textbf{KEYWORDS:~}#1}

%定义序言环境
\newenvironment{preface}{
	\chapter*{序言}
	\markboth{序言}{序言}
	\addcontentsline{toc}{chapter}{序言}
}{}

%定义缩略词中英文对照表环境
\newenvironment{abbr}{
	\chapter*{缩略词中英文对照表}
	\markboth{缩略词中英文对照表}{缩略词中英文对照表}
	\addcontentsline{toc}{chapter}{缩略词中英文对照表}
}{}

%定义缩略词中英文对照表环境
\newenvironment{mathsymbol}{
	\chapter*{主要数学符号表}
	\markboth{主要数学符号表}{主要数学符号表}
	\addcontentsline{toc}{chapter}{主要数学符号表}
}{}

%定义作者简历环境
\newenvironment{mresume}{
	\chapter*{作者简历}
	\markboth{作者简历}{作者简历}
	\addcontentsline{toc}{chapter}{作者简历}
}{}

%定义攻读博士学位期间取得的研究成果环境
\newenvironment{publication}{
	\chapter*{攻读博士学位期间取得的研究成果}
	\markboth{攻读博士学位期间取得的研究成果}{攻读博士学位期间取得的研究成果}
	\addcontentsline{toc}{chapter}{攻读博士学位期间取得的研究成果}
}{}

%定义独创性声明环境
\newenvironment{statement}{
	\chapter*{独创性声明}
	\markboth{独创性声明}{独创性声明}
	\addcontentsline{toc}{chapter}{独创性声明}
}{}

%定义答辩决议书环境
\newenvironment{resolution}{
	\chapter*{答辩决议书}
	\markboth{答辩决议书}{答辩决议书}
	\addcontentsline{toc}{chapter}{答辩决议书}
}{}

%定义学位论文数据集环境
\newenvironment{dataset}{
	\chapter*{学位论文数据集}
	\markboth{学位论文数据集}{学位论文数据集}
	\addcontentsline{toc}{chapter}{学位论文数据集}
}{}


%%定义正文的页眉页脚格式
\def\BJTU@chapter{}
\fancypagestyle{BJTU@heading}{
	\fancyhf{}
	\fancyhead[EC]{
		\zihao{5} %新增
		\if@isDoctor
		北京交通大学博士学位论文
		\else
		北京交通大学硕士学位论文
		\fi
	}
	% \fancyhead[OC]{\leftmark}
	% \fancyfoot[C]{\thepage}
	\fancyhead[CO]{\zihao{5}\leftmark}
	\fancyfoot[C]{\zihao{-5}\thepage}
}



%%设置页边距和装订线
\usepackage[
top=3.5cm,
bottom=2.5cm,
left=2.5cm,
right=2.5cm,
bindingoffset=1cm,
headheight=15pt
]{geometry}

%% 设置章节格式
\ctexset{chapter={
		name={},
		number = {\arabic{chapter}},
		format = {\heiti \centering \zihao{3}},
		pagestyle = {BJTU@heading},
		beforeskip = 28bp,
		afterskip = 20bp,
		fixskip = true,
	}
}

%% 设置一级章节格式
\ctexset{section={
		% format={\raggedright \bfseries \sffamily \zihao{4}}, %mac
		format={\raggedright \heiti \zihao{3}},
		beforeskip = 28bp plus 1ex minus .2ex,
		afterskip = 24bp plus .2ex,
		fixskip = true,
	}
}

% 设置二级标题格式

%黑体小四加粗顶左，单倍行距，序号与题目间空一个汉字符

\ctexset{subsection={
		% format = {\bfseries \sffamily \raggedright \zihao{-4}},
		format = {\heiti \raggedright \zihao{-3}},
		beforeskip =28bp plus 1ex minus .2ex,
		afterskip = 24bp plus .2ex,
		fixskip = true,
	}
}

% 设置三节标题格式：黑体小四居左书写，单倍行距，序号与题目间空一个汉字符

\ctexset{subsubsection={
		% format={\heiti \raggedright \zihao{-4}},
		format={\heiti \raggedright \zihao{4}},
		beforeskip=28bp plus 1ex minus .2ex,
		afterskip=24bp plus .2ex,
		fixskip=true,
	}
}


%目录
\ifxetex  % xelatex
\RequirePackage[xetex]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	plainpages=false,
	pdfstartview=FitH
}
\else
\ifpdf
\RequirePackage[pdftex,unicode]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	plainpages=false,
	pdfstartview=FitH
}
\else
\RequirePackage[dvipdfmx,unicode]{hyperref}
\hypersetup{
	bookmarksnumbered,
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	plainpages=false,
	pdfstartview=FitH
}
\fi
\fi

\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}



\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\vspace{1pt}\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{section}[2\ccwd]{\vspace{1pt}\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{subsection}[4\ccwd]{\vspace{1pt}\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{figure}[0pt]{\vspace{1pt}\songti\zihao{-4}}
{\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.}\contentspage}

\titlecontents{table}[0pt]{\vspace{1pt}\songti\zihao{-4}}
{\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.}\contentspage}


\renewcommand\tableofcontents{%
	% \vspace{-1cm}
	\chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
	\pdfbookmark[0]{目录}{bittoc}
	\@starttoc{toc}%
}



%设定文档页眉页脚
\pagestyle{BJTU@heading}
%必须在设置完文档的页眉页脚格式之后再重定义此命令
\renewcommand{\chaptermark}[1]{
	\markboth{#1}{}
}


%%定义制作论文封面命令
\newcommand{\makecover}{
	\newpage\thispagestyle{empty}
	\vspace{50pt}
	\begin{figure}
		\centering
		\includegraphics*[]{logo.png}
	\end{figure}
	\vspace{18pt}
	\begin{center}
		\if@isDoctor
		{\songti\zihao{2}\bfseries{博士学位论文\\}}
		\else
		{\songti\zihao{2}\bfseries{硕士学位论文\\}}		
		\fi
		\vspace{44pt}
		{\songti\zihao{-3}\BJTU@value@title\\}
		\vspace{18pt}
		{\zihao{-3}\BJTU@value@englishtitle\\}
		\vspace{90pt}
		\begin{tabular}{l}
			{\songti\zihao{4}作者：\BJTU@value@author}\\
			\\
			{\songti\zihao{4}导师：\BJTU@value@advisor}\\
		\end{tabular}
		\\
		\vspace{120pt}
		{\songti\zihao{4}北京交通大学\ \ \ \ \ }\\
		\vspace{14pt}
		{\songti\zihao{4}\BJTU@label@datetime}
	\end{center}
	\newpage\thispagestyle{empty}
}


%% graphics packages
\RequirePackage{graphicx}
%% 并列子图
\RequirePackage{subfigure}

\RequirePackage{wrapfig}
%%===========================设置图表标题选项==========================
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
	font = {fontsize},
	labelsep = zhspace,
}
\captionsetup[table]{
	position = top,
	aboveskip = 6bp,
	belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
	position = bottom,
	aboveskip = 6bp,
	belowskip = 6bp,
}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
% ccaption -- bicaption
%\RequirePackage{ccaption}
%\captiondelim{\ }
%\captionnamefont{\songti\zihao{5}}
%\captiontitlefont{\songti\zihao{5}}


%% sort and compress citations
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}


% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}

% 颜色宏包
\RequirePackage{xcolor}


% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% listings 源代码显示宏包
\RequirePackage{listings}
\lstset{tabsize=4, %
	frame=shadowbox, %把代码用带有阴影的框圈起来
	commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
	rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
	keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
	showstringspaces=false,%不显示代码字符串中间的空格标记
	stringstyle=\ttfamily, % 代码字符串的特殊格式
	keepspaces=true, %
	breakindent=22pt, %
	numbers=left,%左侧显示行号
	stepnumber=1,%
	numberstyle=\tiny, %行号字体用小号
	basicstyle=\footnotesize, %
	showspaces=false, %
	flexiblecolumns=true, %
	breaklines=true, %对过长的代码自动换行
	breakautoindent=true,%
	breakindent=4em, %
	aboveskip=1em, %代码块边框
	%% added by http://bbs.ctex.org/viewthread.php?tid=53451
	fontadjust,
	captionpos=t,
	framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
	xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
	texcl=true,
	% 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
	extendedchars=false,columns=flexible,mathescape=true
	numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头

%% enumerate 列表环境间距调节
\usepackage{enumitem}
% \setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
% \setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=2pt,parsep=0pt,topsep=0pt}
\setenumerate[1]{itemsep=2pt,parsep=0pt,topsep=0pt}
% \setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%_  参考文献风格 added by wei.jianwen@gmail.com
\bibliographystyle{GBT7714-2005NLang}

%_ 参考文献环境
\renewenvironment{thebibliography}[1]
{\zihao{5}
	\chapter*{\bibname}
	\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
	\addcontentsline{toc}{chapter}{参考文献}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{1mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{0.05pc}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}


%%附录
%\let\@appendix\appendix
%\renewenvironment{appendix}{%
%  \@appendix
%  \gdef\@chapapp{\appendixname~\thechapter}
%  %\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
%  }{}

%\newcommand{\mmchapter}{\BJTU@chapter*}



\endinput