\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classes/csthesispaper}[2024/01/01 author: author]

\DeclareOption{s5paper}{\def\csthesis@spaper{}}
\DeclareOption{extramargin}{\def\csthesis@margin{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[twoside]{article}
\RequirePackage{multidocument}
\ifx\csthesisspaper\undefined\else
    \ifx\csthesis@margin\undefined\RequirePackage{s5paper}
    \else\RequirePackage[margin=5mm]{s5paper}\fi
\fi
\RequirePackage{csthesisutils}

\AtBeginDocument{\@mkboth{Paper\space\thedocument}{}}
%\AtEndDocument{\cleardoublepage}

% Inititalize
% ===========

\def\csthesispaper{}

% Macros
% ======

\newcount\c@address
\setcounter{address}{1}
\def\p@address#1{$^{#1}$}
\def\theaddress{\@arabic\c@address}
\def\address{\protected@edef\@currentlabel{$^{\@arabic\c@address}$}%
    \@ifnextchar[{\@addressii}{\@addressiii}}
\def\@addressii[#1]#2{\label{#1}\@addressiii{\@currentlabel#2}}
\def\@addressiii#1{%
    \expandafter\protected@edef\csname address@\@alph\c@address\endcsname{{#1}}%
    \advance\c@address1}
\def\address@print{
    \@tempcnta1\address@printi\vskip -1ex}
\def\address@printi{%
     \ifnum\@tempcnta=\c@address\else%
        \vskip 1ex\noindent\begin{minipage}{\linewidth}%
            \def\baselinestretch{1.0}\center\small\slshape\noindent%
            \expandafter\csname address@\@alph\@tempcnta\endcsname\relax%
        \end{minipage}\par\advance\@tempcnta1\address@printi\fi}
        
\def\reprint#1{\gdef\@reprint{\footnote{{#1}}}}
\def\@reprint{\@latex@warning@no@line{No \noexpand\reprint given}}
      
% Abstract & Keywords
% ===================
\expandafter\ifx\csname abstract\endcsname\relax%
    \def\abstractname{Abstract}
    \newenvironment{abstract}{%
        \list{}{\rightmargin0pt\leftmargin0pt}\item[]
        {\normalfont\bfseries\abstractname:\ }}
        {\endlist\par}
\else%
    \renewenvironment{abstract}{%
        \list{}{\rightmargin0pt\leftmargin0pt}\item[]
        {\normalfont\bfseries\abstractname:\ }}
        {\endlist\par}
\fi

\def\keywordname{Key words}
\newenvironment{keywords}{%
        \list{}{\rightmargin0pt\leftmargin0pt}\item[]
        {\normalfont\bfseries\keywordname:\ }}
        {\endlist\par}

% Title page
% ==========
\renewcommand\maketitle{%
  \renewcommand{\thefootnote}{\fnsymbol{footnote}}
    \thispagestyle{plain}%
    \begin{center}%
      \par\noindent\Huge\bfseries\mbox{Paper\space\thedocument}\normalfont%
      \par\vskip2em\par\noindent\Large\bfseries{\@title\ifx\@reprint\@empty\else\@reprint\fi}\normalfont%
      \par\vskip2em\par\noindent\large\@author\@thanks\normalfont%
    \end{center}%
    \par\vskip2em
    \address@print%
    \par\vskip1.75em%

  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \renewcommand{\thefootnote}{\arabic{footnote}}}

% Appendix
% ========
\renewcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\mbox{Appendix~\@Alph\c@section}}}
