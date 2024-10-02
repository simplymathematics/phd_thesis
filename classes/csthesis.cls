\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classes/csthesis}[2024/01/01 author: author]

\DeclareOption{s5paper}{\def\csthesis@spaper{}}
\DeclareOption{extramargin}{\def\csthesis@margin{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions

\LoadClass[twoside,openright]{report}
\ifx\csthesisspaper\undefined\else
    \ifx\csthesis@margin\undefined\RequirePackage{s5paper}
    \else\RequirePackage[margin=5mm]{s5paper}\fi
\fi
\RequirePackage{style/multidocument}
\ifx\csthesis@margin\undefined\RequirePackage{style/divider}
\else\RequirePackage[margin=5mm]{style/divider}\fi
\RequirePackage{style/csthesisutils}  

\AtEndDocument{\cleardoublepage}
    
% Inititalize
% ===========
\def\csthesis{}

\ifx\pdftexversion\undefined\ClassError{csthesis}{The csthesis class can only be used with pdflatex.}{}\fi%
    
% Parts
% =====
\renewcommand\part[1]{%
    \global\advance\c@part 1%
    \if@filesw
        \immediate\write\@auxout{\string\@writefile{toc}{\noexpand\contentsline{part}{Part\space\thepart}{#1}{}}}\fi\ignorespaces%
    \expandafter\xdef\csname part@\thepart\endcsname{#1}}
\def\parttitlepage{%
    \cleardoublepage
    \font\part@font cmb10 at 36 pt
    \thispagestyle{plain}
    \vspace*{30mm}
    \begin{center}
        \@tempcnta \c@part\relax
        \bgroup\part@font Part \@Roman\@tempcnta\egroup
        \vfill
        \begingroup\par\sffamily\Large\bfseries\csname part@\thepart\endcsname\endgroup
        \vfill\vfill
    \end{center}\cleardoublepage}
    
% Commands
% ========
\long\gdef\summary#1{%
    \begin{multidocument}{#1}}
\gdef\endsummary{\end{multidocument}%
    \setcounter{document}{0}}
    
\long\gdef\paper#1{
    \@tempcnta\c@document
    \advance\@tempcnta1
    \divider[\@Roman\@tempcnta]
    \begin{multidocument}{#1}
    \addcontentsline{toc}{paper}{Paper\space\thedocument}}
\gdef\endpaper{\end{multidocument}}

% Table of Contents
% =================


% l@paper
\newcommand*\l@paper[2]{%
          \ifnum \c@tocdepth >\m@ne
            \addpenalty{-\@highpenalty}%
            \vskip \ifx\@hasparts\undefined 1em\else 0.5em\fi \@plus\p@
            \setlength\@tempdima{1.5em}%
            \begingroup
              \parindent \ifx\@hasparts\undefined \z@\else1.5em\fi \rightskip\@pnumwidth
              \parfillskip -\@pnumwidth
              \leavevmode \bfseries
              \advance\leftskip\@tempdima
              \hskip -\leftskip
              #1~\nobreak\hfill%
              \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
              \penalty\@highpenalty
            \endgroup
          \fi}

% Paperlist
% =========
\newcommand{\paperlabel}{\mbox{Paper~\mbox{\Roman{enumi}}\hfill}\stepcounter{enumi}}
\newenvironment{paperlist}[1][1]{%
  \begin{list}
      {}{%
      \settowidth{\@tempdima}{Paper VIII}%
      \setcounter{enumi}{#1}%
      \setlength{\leftmargin}{19mm}%
      \setlength{\labelwidth}{\@tempdima}%
      \setlength{\labelsep}{2mm}%
      \setlength{\itemindent}{0mm}%
      \renewcommand{\makelabel}{\paperlabel}%
      }%
}{\end{list}}

\newenvironment{paperlistExtra}[1][1]{%
  \begin{list}
      {}{%
      \settowidth{\@tempdima}{Paper VIII}%
      %\setcounter{enumi}{4}%
      \setlength{\leftmargin}{19mm}%
      \setlength{\labelwidth}{\@tempdima}%
      \setlength{\labelsep}{2mm}%
      \setlength{\itemindent}{0mm}%
      \renewcommand{\makelabel}{\paperlabel}%
      }%
}{\end{list}}
