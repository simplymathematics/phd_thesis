\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classes/csthesissummary}[2024/01/01 author: author]

\DeclareOption{s5paper}{\def\csthesis@s5paper{}}
\DeclareOption{extramargin}{\def\csthesis@margin{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions
                                         
\LoadClass[twoside,openright]{report}
\ifx\csthesisspaper\undefined\else
    \ifx\csthesis@margin\undefined\RequirePackage{s5paper}
    \else\RequirePackage[margin=5mm]{s5paper}\fi
\fi
\RequirePackage{multidocument}
\RequirePackage{csthesisutils}

\AtBeginDocument{\sharetoc}
\AtEndDocument{\cleardoublepage}
    
% Inititalize
% ===========

\def\csthesissummary{}
      
% Table of Contents
% =================
\renewcommand\tableofcontents{%
    \@latex@error%
    {A Thesis summary can not have its own table of contents. Use \noexpand\includetoc
    in main thesis file}%
    {A Thesis summary can not have its own table of contents}}
