%%
%% This is file `nputhesis.cls'.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nputhesis}[2022/11/08 NWPU]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax
\LoadClass{book}
\RequirePackage[UTF8]{ctexcap} 
\usepackage{CJKutf8} % 注意要用 CJKutf8 而不是 CJK
\usepackage{ctex}
%\usepackage{newtxmath}
%\usepackage{fontspec}

\usepackage{changes}%用于加入删改标记
%\usepackage{easyReview}
\RequirePackage{ulem}%下划线强调


%------------字号行距---------%
\usepackage{setspace}
% \renewcommand{\songti}{\CJKfontspec{SimSun}}
% \renewcommand{\heiti}{\CJKfontfamily{SimHei}}
\setmainfont{Times New Roman}
\setCJKmainfont[AutoFakeBold=2]{SimSun}
\newCJKfontfamily{\heitibf}[AutoFakeBold=2]{SimHei}
\newCJKfontfamily{\heitii}{SimHei}

\songti
\renewcommand{\normalsize}{\zihao{-4}}
% \linespread{1.5}  % 设置行间距
\linespread{1.42} % 1.42对应33 34行  % 1.34对应一页36行
%\setlength{\baselineskip}{28pt}


%----------页面大小-------------%
\RequirePackage{geometry}

\geometry{paperwidth=210mm,paperheight=297mm,%
  left=2.5cm,right=2.5cm,top=2.54cm,bottom=2.54cm}
\topmargin=-10.4mm
\headheight=17pt
\footskip=8mm
\headsep=5mm

%--------章节编号----------%
\CTEXsetup[name={第,章}, number={\arabic{chapter}}, % \arabic 表示数字1 2 3 4 ，\chinese 表示汉字一二三四
  beforeskip={-4pt}, afterskip={16.5pt},nameformat={\heiti\zihao{3}},
titleformat={\heiti\zihao{3}}]{chapter}
\CTEXsetup[
format={\heiti\zihao{4}},
beforeskip={10pt},
afterskip={0pt}]{section}

\CTEXsetup[
format={\heiti\zihao{-4}},
beforeskip={10pt},
%\baselineskip={20pt},
afterskip={0pt}]{subsection}
\RequirePackage{titletoc}

%---------目录设置-----------%
\def\@contentfont{\songti\zihao{-4}}
\titlecontents{chapter}[0pt]{\heiti\zihao{-4}}
  {\thecontentslabel\hspace{.5em}}{}  % 在第一个大括号后添加 \bfseries，可以实现目录中章节黑体
  {\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{section}[15pt]{\@contentfont}
  {\hspace{.5em}\thecontentslabel\hspace{.5em}}{}
  {\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[30pt]{\@contentfont}
  {\quad\thecontentslabel\hspace{.5em}}{}
  {\hspace{0em}\titlerule*{.}\contentspage}
  
  
  \let\npu@tableofcontents\tableofcontents
  \def\tableofcontents{\cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\npu@contents}%cleardoublepage配合phatom..调整页码问题
  	\npu@tableofcontents}

%-------------页眉页脚-----------%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
%\renewcommand{\chaptermark}[1]{\markboth{%
%  \if@mainmatter%
%    \ifnum\arabic{chapter}>0%
%      \arabic{chapter}\quad%
%    \fi
%  \fi#1}{}}
\fancyhf{}
\fancyhead[EC]{\nouppercase{\songti\zihao{-5}\npu@rightmark}}
\fancyhead[OC]{\nouppercase{\songti\zihao{-5}\leftmark}}
\fancyfoot[C]{\songti\zihao{5}\thepage}
\renewcommand{\headrule}{%
  \hrule width\headwidth height2.8pt \vspace{1pt}%
  \hrule width\headwidth height0.8pt}
\fancypagestyle{plain}{\thispagestyle{fancy}}
\newcommand{\clearpagestyle}{\clearpage{\pagestyle{empty}\cleardoublepage}}

%-------左开空白页----------%
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\vspace*{\fill}
	% \begin{center}
	%  \Large This Page Intentionally Left Blank!
	%\end{center}
	\vspace{\fill}
	\thispagestyle{empty}%奇数页结尾后空白页样式，全白为empty，保留页眉页脚为plain
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%---------define var----------%
\def\title{\@ifnextchar[\@@title{\@@title[]}}
\def\author{\@ifnextchar[\@@author{\@@author[]}}
\def\major{\@ifnextchar[\@@major{\@@major[]}}
\def\supervisor{\@ifnextchar[\@@supervisor{\@@supervisor[]}}
\def\supervisorB{\@ifnextchar[\@@supervisorB{\@@supervisorB[]}}
\def\applydate{\@ifnextchar[\@@applydate{\@@applydate[]}}
\def\studycollege{\@ifnextchar[\@@studycollege{\@@studycolledge[]}}

\def\@@title[#1]#2{\def\@title@en{#1}\def\@title{#2}}
\def\@@author[#1]#2{\def\@author@en{#1}\def\@author{#2}}
\def\@@major[#1]#2{\def\@major@en{#1}\def\@major{#2}}
\def\@@supervisor[#1]#2{\def\@supervisor@en{#1}\def\@supervisor{#2}}
\def\@@applydate[#1]#2{\def\@applydate@en{#1}\def\@applydate{#2}}
\def\@@studycollege[#1]#2{\def\@studyeollege@en{#1}\def\@studycollege{#2}}
\def\@title{} \def\@author{} \def\@major{} \def\@supervisor{} \def\@applydate{} \def\@studycollege{}

\def\schoolno#1{\def\@schoolno{#1}}\def\@schoolno{}
\def\classno#1{\def\@classno{#1}}\def\@classno{}
\def\secretlevel#1{\def\@secretlevel{#1}}\def\@secretlevel{}
\def\authorno#1{\def\@authorno{#1}}\def\@authorno{}
\def\support#1{\def\@support{#1}}\def\@support{}



%------------封面------------%
\def\makeoutercover{
  \begin{titlepage}
  	
    \linespread{1.25}
    \begin{center}
      \heiti\zihao{5}
      \hfill
      \newlength{\max@length}
      \settowidth{\max@length}{\npu@schoolno\npu@comma 2000000000}
      \newlength{\name@length}
      \settowidth{\name@length}{\npu@schoolno~}
      \newlength{\name@lengthdown}
      \setlength{\name@lengthdown}{4.06cm}
      \begin{minipage}{\textwidth}
      	\bf
      	\heitibf
      	\begin{flushright}%封面右上信息表
      		\begin{tabular}{ | m{1.9cm}<{\centering}|m{2.2cm}<{\centering}| } 
      			\hline
   	  		    \makebox[\name@length][s]{\npu@schoolno}& \@schoolno\\
   	  		    \hline
      		    \makebox[\name@length][s]{\npu@classno}& \@classno\\
      		    \hline
     		    \makebox[\name@length][s]{\npu@secretlevel}& \@secretlevel\\
     		    \hline
      		    \makebox[\name@length][s]{\npu@authorno}& \@authorno\\
      		    \hline
      		\end{tabular}
      	\end{flushright}

      \end{minipage}
      \par\vspace{10cm}
          	 \heiti\zihao{2}
      \begin{minipage}[t]{2.34cm}
      	\begin{center}
      		      \heitibf\zihao{2}
        	\makebox[2.34cm][s]{\textbf{\npu@title~~}}
      	\end{center}
      \end{minipage}
      %\hbox to 2.5cm{\hfill \npu@title}
      \setbox123=\hbox{
        \begin{minipage}[t]{12.13cm}
          \begin{center}
          	 \heitibf\zihao{2}
          	 \setlength{\baselineskip}{1.55cm}
          	 \noindent
            \textbf{\@title}
          \end{center}
        \end{minipage} }
      \setbox124=\hbox{
        \begin{minipage}[t]{12.13cm}
          \begin{center}
          	\setlength{\baselineskip}{1.55cm}
          	\noindent
            \uline{\hfill\quad\hfill}\\
            \uline{\hfill\quad\hfill}\\
          \end{center}
        \end{minipage} }
      \hskip-1cm
      \copy123\kern-\wd123\box124
      \par\vspace{2cm}
      \zihao{3}
      \songti
      \begin{minipage}{5.32cm}
      	\bf
      	
        \makebox[5.32cm]{\makebox[1.56cm][c]{\npu@author} \uline{\hfill\textbf{\@author}\hfill}}
      \end{minipage}
	  \par\vspace{2.45\baselineskip}	
	  \vspace{-0.05cm}
      \settowidth{\name@length}{\npu@applydate}
      \begin{minipage}{14.21cm}

        \setlength{\baselineskip}{1cm}     
        \zihao{3}
        \songti  
        \bf 
        \noindent
        \makebox[\name@lengthdown]{\makebox[3.6cm][s]{\npu@major} }\uline{\hfill\@major\hfill} \par
%        \vspace{0.5\baselineskip}
        \makebox[\name@lengthdown]{\makebox[3.6cm][s]{\npu@supervisor} }\uline{\hfill\@supervisor\hfill} \par
%        \vspace{0.5\baselineskip}
		\makebox[\name@lengthdown]{\makebox[3.6cm][s]{\npu@studycollege}} \uline{\hfill\@studycollege\hfill} \par
%        \vspace{0.5\baselineskip}
        \makebox[\name@lengthdown]{\makebox[3.6cm][s]{\npu@applydate} }\uline{\hfill\bf \@applydate\hfill} \par
      \end{minipage}
      \vspace{2\baselineskip}
    \end{center}
  \end{titlepage}
  \clearpagestyle}

\def\makeinnercover@zh{
  \begin{titlepage}
    \linespread{1.25}
    \vspace*{2cm}
    \begin{center}
      \settowidth{\name@length}{\zihao{3}\npu@schoolname}
      \divide\name@length by 12
      \multiply\name@length by 17
      \makebox[\name@length][s]{\zihao{3}\npu@schoolname}
      \vskip5mm
      \settowidth{\name@length}{\zihao{1}\npu@degree}
      \divide\name@length by 12
      \multiply\name@length by 17
      \makebox[\name@length][s]{\zihao{1}\npu@degree}
      \vskip10mm
%      \centerline{\zihao{4}\npu@degreeclass}
      \vskip4cm
      \zihao{2}
      \begin{minipage}[t]{2.5cm}
        \hfil\npu@title\npu@comma
      \end{minipage}
      \setbox123=\hbox{
        \begin{minipage}[t]{10cm}
          \begin{center}
            \@title
          \end{center}
        \end{minipage}}
      \setbox124=\hbox{
        \begin{minipage}[t]{10cm}
          \begin{center}
            \uline{\hfill\quad\hfill}\\
            \uline{\hfill\quad\hfill}\\
          \end{center}
        \end{minipage}}
      \hskip-1cm
      \copy123\kern-\wd123\box124
      \par\vspace{4.6cm}
      \zihao{3}
      \settowidth{\name@length}{\npu@major}
      \begin{minipage}{9cm}
        \noindent
        \makebox[\name@length][s]{\npu@major}\npu@comma\uline{\hfill\@major\hfill}\par
        \vspace{0.25\baselineskip}
        \makebox[\name@length][s]{\npu@author}\npu@comma\uline{\hfill\@author\hfill}\par
        \vspace{0.25\baselineskip}
        \makebox[\name@length][s]{\npu@supervisor}\npu@comma\uline{\hfill\@supervisor\hfill}\par
        \vspace{0.25\baselineskip}
%        \makebox[\name@length][s]{\npu@supervisorB}\npu@comma\uline{\hfill\@supervisorB\hfill}\par
%        \vspace{0.25\baselineskip}
      \end{minipage}
      \vspace{2.45\baselineskip}
      \par\makebox[30mm]{\@applydate}\hfill
    \end{center}
  \end{titlepage}
  \clearpagestyle}

\def\makeinnercover@en{
  \begin{titlepage}
    \linespread{1.25}
    \vspace*{1.5cm}

    \zihao{3}
    \begin{center}
      {\bf
        %\Large
        \zihao{2}Title: \zihao{3}\@title@en \\
        \vspace{-1\baselineskip}
        \vspace{3\baselineskip}
        \zihao{-3}
        By\\
        \@author@en \\

        Under the Supervision of\\
        \@supervisor@en\\}
      \vspace{1\baselineskip}
      %\Large
      \vspace{4\baselineskip}
      A Dissertation Submitted to\\
      Northwestern Polytechnical University\\
      \vspace{1\baselineskip}
      In Partial Fulfillment of the Requirement\\
      For the Degree of\\
      Master of \@major@en\\
      \vspace{4\baselineskip}
      Xi'an, P. R. China\\
      \@applydate@en
    \end{center}
  \end{titlepage}
  \clearpagestyle}

\def\makecover{\makeoutercover\makeinnercover@zh\makeinnercover@en}
\let\npu@frontmatter\frontmatter
\def\frontmatter{\npu@frontmatter\pagenumbering{Roman}}

%------------摘要-----------%
\newenvironment{abstract}{%
	\chapter{\npu@abstract}%\addcontentsline{toc}{chapter}{\npu@abstract}%
	\newenvironment{keywords}{%
		\vspace{2\baselineskip}\par\noindent\textbf{\heiti\npu@keywords\npu@comma}}{}
}{\vfill\zihao{5}\@support}

\newenvironment{Abstract}{%
	\chapter{\npu@Abstract}%\addcontentsline{toc}{chapter}{\npu@Abstract}%
	\newenvironment{Keywords}{%
		\vspace{2\baselineskip}\par\noindent\textbf{\npu@Keywords:~}}{}}{}%:~替换了\npu@comma
\newenvironment{innovation}{%
	\chapter{\npu@innovation}%\addcontentsline{toc}{chapter}{\npu@Abstract}%
}{}
	

%-------图表----------%
\RequirePackage[justification=centering]{caption}%标题过长居中
\usepackage{graphicx}
%\usepackage{epstopdf}
\usepackage{float}  % 固定图片位置 -- JieruChen
\usepackage{booktabs}  %  引入三线表宏包
\usepackage{threeparttable}% 引入三线表宏包---JieruChen
\usepackage{multirow}
\usepackage{subfigure}
%\usepackage{movie15}

\usepackage{bicaption}

\captionsetup[figure]{labelsep=quad}
\captionsetup[table]{labelsep=quad}
\captionsetup[figure]{name={\zihao{5} 图},labelsep=quad}  % 自己加
\captionsetup[table]{name={\zihao{5} 表},labelsep=quad}  % 自己加
\captionsetup[figure][bi-second]{name=Figure} %设置双语言标题
\captionsetup[table][bi-second]{name=Table}


\setlength{\abovecaptionskip}{2ex}
\setlength{\belowcaptionskip}{-2ex}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%---------图/表/公式/引用编号设置--------%
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}  % \zihao{5}  添加这个字号设置可以实现引用table的时候字体变小
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\AtBeginEnvironment{tabular}{\zihao{5}}   % 全局设表格内字体




% 调整表格大小 30表示高度控制在30mm
%\resizebox{\textwidth}{30mm}{
%}

% 图标控制命令
% h 随文本
% t 置顶
% b 置底
% htb 顺序优先执行控制命令

% 表格模板： * 只在双栏模板中，对table和figure可以实现通栏效果
%\begin{table*}\label{tab:anthro}
%  \centering
%  \caption{xxxxxx}
%    \begin{tabular}{ccc}
%    \hline
%    \end{tabular}}
%\end{table*}

% 三线表       \usepackage{booktabs}  %  引入三线表宏包
%\begin{table}[htbp]
%	\centering
%	\caption{three-line table}
%	\begin{tabular}{cccc}
%		\toprule  % 顶部线
%		1&2&3&4 \\
%		\midrule  % 中部线
%		0.1&0.2&0.3&0.4 \\
%		\bottomrule  % 底部线
%	\end{tabular}
%\end{table}


% 单图
%\begin{figure*}
%\centering
%\includegraphics[width=0.5\columnwidth]{figure/structure_auto.jpg}
%\caption{自编码器结构}
%\label{fig:str_auto}
%\end{figure*}



%--------列表-----------%
\usepackage{paralist}
\let\itemize\compactitem
\let\enditemize\endcompactitem
\let\enumerate\compactenum
\let\endenumerate\endcompactenum
\let\description\compactdesc
\let\enddescription\endcompactdesc
\usepackage{enumitem}  % item不缩进，下面三行为改变item的间距
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
% 清单
%\begin{enumerate}
%\item
%\end{enumerate}

%------------公式------------%
%\usepackage{newtxmath}
%\usepackage{txfonts}
\usepackage{bm}   %公式加粗  -- JieruChen
%\usepackage{amssymb} %添加定义等号--JieruChen
\usepackage{amsmath} % 多行公式一个编号，且编号在中间，split--JieruChen
%\usepackage{wasysym}
\usepackage{dcolumn}
%\usepackage{amsmath,graphicx}


%\usepackage{amsfonts}
\usepackage[mathscr]{euscript} % 添加花体T  -- JieruChen
\usepackage{gensymb}
\usepackage{algorithm}
\usepackage{algpseudocode}
%\usepackage{amsmath}
\usepackage{textcomp}
\usepackage{lipsum}%生成随机段落 占位
\usepackage{mathrsfs}
%\usepackage{mathtime}
%\usepackage{newtxmath}
\usepackage{upgreek}
%\usepackage{txfonts}
%\usepackage{mathptmx}


%%--Phi
\usepackage{chemfig}  %　有机化学包
\usepackage[version=4]{mhchem}  % 引入宏包，版本请参考文档说明。

%\usepackage{mathptmx}
%\usepackage{amsmath, bm}
%\usepackage{newtxtext}
\usepackage{newtxmath}


%\setmathfont{XITS Math}%数学字体
% begin 添加伪代码algorithm -- JieruChen
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
% Use Input in the format of Algorithm
\renewcommand{\algorithmicensure}{\textbf{Output:}}
% Use Output in the format of Algorithm
% end 添加伪代码algorithm -- JieruChen
%\renewcommand\theequation{\arabic{section}.\arabic{subsection}.\arabic{equation}}%公式编号/试验-Phi

%-------奇怪的设置出现了-----%-
\newcommand{\mat}{\textbf}
\usepackage{verbatim} % 添加多行注释  -- JieruChen

%-----------参考文献----------%

\let\npu@bibliographystyle\bibliographystyle
\def\bibliographystyle#1{%
	%\def\Reference{\chapter{\npu@reference}}
%	\chapter{\bibname}
	\cleardoublepage
	\phantomsection
	\addcontentsline{toc}{chapter}{\npu@reference}%
	\npu@bibliographystyle{#1}}

\def\Appendix{\chapter{\npu@appendix}}
\def\Thanks{\chapter{\npu@thanks}}
\def\Work{\chapter{\npu@work} 
	\noindent
	\zihao{-4}}
\def\Conclusion{\chapter{\npu@conclusion}}
%\def\Appendix{\chapter{\npu@appendix}}
%\def\Thanks{\chapter{\npu@thanks}}
%\def\Work{\chapter{\npu@work}}
%\def\Conclusion{\chapter{\npu@conclusion}}

%\usepackage[unicode={true},dvipdfm]{hyperref} % 最好保证 hyperref 是最后加载的宏包
\usepackage[unicode={true}]{hyperref} % 最好保证 hyperref 是最后加载的宏包
%\usepackage[breaklinks,colorlinks,linkcolor=black,citecolor=black,urlcolor=black]{hyperref}
%\newcommand{\supercite}[1]{\textsuperscript{\cite{#1}}}     %引用格式上标 -- JieruChen
%\newcommand{\tcite}[1]{\textsuperscript{\cite{#1}}}         %引用格式上标 -- JieruChen
\renewcommand\@biblabel[1]{[#1]\hfill}  % 参考文献标号左对齐--PhiChen
\RequirePackage[
numbers,
sort&compress,
super,
square]{natbib} %参数代表：数字,排序与压缩,上标，方括号--Phi
\hypersetup{hidelinks}% 取消超链接红色方框	
\setlength{\bibsep}{0ex} 
%\hypersetup{		%设置方框颜色
%	colorlinks=true,
%	linkcolor=black
%}

%-----------声明-------------%
\def\statement{
	\begin{titlepage}
		\linespread{1.5}
		\parskip=20pt
		\vspace*{0pt}
		\songti\zihao{4}
		\centerline{\bf \npu@schoolname}
		\centerline{\bf \npu@p@statement}
		\songti\zihao{5}
		\parskip=13pt
		\npu@longp@statement\par
		\vskip 1cm
		\npu@a@signature\npu@comma\underline{\qquad\qquad\qquad} \hfill
		\npu@s@signature\npu@comma\underline{\qquad\qquad\qquad} \par
		\hskip 3cm \npu@ymd \hfill\hskip 3cm \npu@ymd
		\vspace*{30pt}
		\hbox to \hsize{\leaders\hbox to 1em{\hss--\hss}\hfill}
		
		\vspace*{50pt}
		\songti\zihao{4}
		\centerline{\bf \npu@schoolname}
		\centerline{\bf \npu@c@statement}
		\songti\zihao{5}
		\npu@longc@statement\par
		\hskip4cm
		\hfill\npu@a@signature\npu@comma\underline{\qquad\qquad\qquad}\par
		\hfill\hskip8.5cm \npu@ymd
\end{titlepage}}
\input{npuphd.cfg}

\endinput
