% Intro Options
\ProvidesClass{deedy-resume-openfont}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode}

\usepackage{lipsum}
\usepackage{xparse}

\usepackage{bibentry}

\def\bibliographystyle#1{%
  \ifx\@begindocumenthook\@undefined\else
    \expandafter\AtBeginDocument
  \fi  
    {\if@filesw
       \immediate\write\@auxout{\string\bibstyle{#1}}%
     \fi}}

% Color definitions
\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{525151} 
\definecolor{headings}{HTML}{222222}
\definecolor{subheadings}{HTML}{222222}

\usepackage{hyperref}
\hypersetup{
	colorlinks=false,
	urlbordercolor=black
}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary, Path = fonts/lato/]{Lato-Reg}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}
\newcommand{\custombold}[1]{\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Reg}\selectfont #1 \normalfont}

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm} % start everyth
\newcommand{\lastupdated}{\begin{textblock}{60}(165,0)
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont 
Last Updated on
\today
\end{textblock}}

\newsavebox{\fminipagebox}
\NewDocumentEnvironment{fminipage}{m O{\fboxsep}}
 {\par\kern#2\noindent\begin{lrbox}{\fminipagebox}
  \begin{minipage}{#1}\ignorespaces}
 {\end{minipage}\end{lrbox}%
  \makebox[#1]{%
    \kern\dimexpr-\fboxsep-\fboxrule\relax
    \fbox{\usebox{\fminipagebox}}%
    \kern\dimexpr-\fboxsep-\fboxrule\relax
  }\par\kern#2
 }

% Name command
\newcommand{\namesection}[6]{
	\begin{minipage}[t][56pt][c]{0.5\textwidth}
		\sffamily
		%\vspace{1in}
		\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{40pt}{48pt}\selectfont #1 
		\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{40pt}{48pt}\selectfont #2
	\end{minipage}
	\begin{minipage}[t][56pt][c]{.5\textwidth}
		\begin{flushright}
			\raggedleft
			%\vspace{-30pt}
			\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{14pt}{17pt}\selectfont #3 \\
			\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{14pt}{17pt}\selectfont #4 \\
			\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{14pt}{17pt}\selectfont #5 \\
			\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{14pt}{17pt}\selectfont #6
		\end{flushright}
	\end{minipage}
	\\
	\\
	%\vspace{15pt}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	%\vspace{-15pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{\color{headings}
\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{} {0em}{}

% Subeadings command
\titleformat{\subsection}{\color{subheadings}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{subheadings}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries{#1} \normalfont}

%\titleformat{\subsection}{\color{subheadings}
%\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}
%\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
%\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
%\newcommand{\runsubsection}[1]{\color{subheadings}
%\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{8pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}

