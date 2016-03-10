\ProvidesClass{friggeri-cv-a4}[2015/10/22 CV class]

\ProvidesClass{friggeri-cv-a4}[2015/10/22 CV class]
%\RequirePackage[quiet]{fontspec}
%\RequirePackage{xcolor}
%\RequirePackage{tikz}
%\RequirePackage{parskip}
%\RequirePackage[absolute,overlay]{textpos}
%\RequirePackage[backend=biber, style=verbose, maxnames=99, sorting=ydnt]{biblatex}


\NeedsTeXFormat{LaTeX2e}

\DeclareOption{nocolors}{\def\@cv@nocolors{}}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% set A4 paper format
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}

\ProcessOptions



%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FF9900}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{669900}
\definecolor{blue}{HTML}{428BCA}
\definecolor{coolblack}{rgb}{0.0, 0.18, 0.39}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\ifdefined\@cv@nocolors
  \colorlet{green}{gray}
  \colorlet{rdfgreen}{gray}
  \colorlet{orange}{gray}
  \colorlet{rdforange}{gray}
  \colorlet{purple}{gray}
  \colorlet{rdfpurple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
\fi


%%%%%%%%%
% Fonts %
%%%%%%%%%
\usepackage[quiet]{fontspec}
\usepackage{txfonts}
\newfontfamily\bodyfont
[BoldFont=Lato-Bold.ttf,
ItalicFont=Lato-LightItalic.ttf,
BoldItalicFont=Lato-BoldItalic.ttf]
{Lato-Regular.ttf}
\newfontfamily\thinfont[]{Lato-Hairline.ttf}
\newfontfamily\headingfont[]{Lato-Black.ttf}

\usepackage{fontawesome}
\newfontfamily\FA[]{fontawesome-webfont.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=Lato-Bold.ttf,
ItalicFont=Lato-LightItalic.ttf,
BoldItalicFont=Lato-BoldItalic.ttf
]
{Lato-Regular.ttf}


%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
%\setmathfont{texgyreheros-regular.otf}
%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%
\newcommand{\heartify}[1]{%
  {\color{red} $\varheartsuit$} #1
}

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{12pt}{12pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{30}{40pt}\color{header}%
      \MakeLowercase{{\thinfont #1}{\bodyfont  #2}{\fontsize{14pt}{20pt}\thinfont #3}}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{10pt}{12pt}\color{header}%
      \thinfont #4%
    };
  \end{tikzpicture}
  \vspace{1cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}



\renewcommand{\section}[1]{
  \par\vspace*{0pt}
  {%
    \Large\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace*{0pt}
}

\renewcommand{\subsection}[1]{
  \par\vspace*{0pt}
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace*{0pt}
}

\renewcommand{\subsubsection}[2]{
  \par\vspace*{0pt}
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace*{0pt}
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\iffalse
\newcommand{\entry}[4]{%
  \parbox[t]{.5cm}{#1}&\parbox[t]{14cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}
\fi

\newcommand{\entry}[5]{%
  \parbox[t]{.5cm}{#1}&\parbox[t]{14cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    \emph{#4} \\
  #5\vspace{\parsep}%
  }\\}



%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.3}(.5, 1.6)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}



%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\iffalse
\RequirePackage[backend=biber, style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\fi

\iffalse
\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifblank{#3}{}{#3\space}#1%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\defbibheading{bibheading}[\bibname]{%
   \subsubsection*{#1}
   \markboth{#1}{#1}
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=bibheading]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}

\fi

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=5.4cm,top=1cm,right=.5cm,bottom=0.25cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks, unicode=true]{hyperref}
\hypersetup{
    colorlinks=true,       
    linkcolor= coolblack,          
    citecolor= coolblack,         
    filecolor= coolblack,       
    urlcolor = coolblack, 
    bookmarks=true,
    pdfborder={0 0 0}}
 
% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother

\usepackage{pifont}
\usepackage[utf8]{inputenc}


