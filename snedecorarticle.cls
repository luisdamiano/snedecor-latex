% \iffalse meta-comment
%% File: snedecorarticle.cls
% Copyright
% 2022 Luis Damiano
%      https://github.com/luisdamiano/snedecor-latex
%
% This file is part of the `Snedecor bundle'.
% -------------------------------------------
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Luis Damiano.
%
% The list of all files belonging to the `Snedecor Bundle' is
% given in the file `manifest.txt'.
% \fi

%%
%% Snedecor LaTeX class file for articles
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{snedecorarticle}[2022-05-06 The Snedecor bundle class for nice articles]

% Base class -------------------------------------------------------------------
%% Pass unhandled options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Font -------------------------------------------------------------------------
% %% Font family
% \RequirePackage{libertinus}
% \RequirePackage[T1]{fontenc}

% %% Font size
% \renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

% Line spacing
\RequirePackage{setspace}
\doublespacing{}

% Layout -----------------------------------------------------------------------
%% Labels
\RequirePackage[notref, notcite]{showkeys}
\renewcommand\showkeyslabelformat[1]{\fbox{\normalfont\tiny\ttfamily#1}}

%% Margins
\RequirePackage{geometry}
\geometry{left=1in,right=1in,bottom=1in,top=1in}

%% Line number
%\usepackage[switch]{lineno}
\RequirePackage[mathlines]{lineno}
\setrunninglinenumbers{}
\leftlinenumbers{}
\renewcommand{\linenumberfont}{\tiny\sffamily\color{black!50}}
\linenumbers{}

% Headers ----------------------------------------------------------------------
% \RequirePackage{fancyhdr}
% \thispagestyle{fancy}
% \fancyhf{}
% %\fancyfoot{}
% \fancyhf[LH]{%
%   \infohl{Info}
%   \warnhl{Warning}
%   \alerthl{Alert}
%   \TODO{todo}
% }
% \fancyhf[CF]{\thepage}
% \renewcommand{\headrulewidth}{0pt}
% \renewcommand{\footrulewidth}{0pt}

% Tables -----------------------------------------------------------------------
\RequirePackage{booktabs}

% Figures ----------------------------------------------------------------------
\RequirePackage{graphicx}

% Captions ---------------------------------------------------------------------
\RequirePackage{caption}
\captionsetup{labelfont=bf}

% Colors -----------------------------------------------------------------------
\RequirePackage{xcolor}

% Math -------------------------------------------------------------------------
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mathtools} % provides: coloneqq

%% Double stroke
\RequirePackage{dsfont} % provides: mathds

%% Bold math
\RequirePackage{bm}
%% https://tex.stackexchange.com/a/222749/225233
\def\BB#1{\mathbb{#1}}
\def\Bx#1{\bm{#1}}
\def\dx#1{\,\mathrm{d}#1}

%% Numbers
\def\Reals{\mathbb{R}}
% \def\RealsP{\Reals^+}
\def\Ints{\mathbb{N}}

%% Punctuation
\def\funcolon{\mathpunct{:}}
\def\colonfun{\mathpunct{:}}

%% Operators
\DeclareMathOperator{\argmin}{arg\,min}
\DeclareMathOperator{\argmax}{arg\,max}
\DeclareMathOperator{\diag}{\text{diag}}

\DeclareMathOperator{\evsym}{E}
\newcommand\EV[1]{\evsym\left\langle#1\right\rangle}
\DeclareMathOperator{\vsym}{V}
\newcommand\VV[1]{\vsym\left\langle#1\right\rangle}
\DeclareMathOperator{\covsym}{Cov}
\newcommand\COV[1]{\covsym\left\langle#1\right\rangle}

% Number lines inside equations ------------------------------------------------
%% https://tex.stackexchange.com/a/461192/225233
\usepackage{etoolbox}
%% Patch 'normal' math environments:
\newcommand*\linenomathpatch[1]{%
  \cspreto{#1}{\linenomath}%
  \cspreto{#1*}{\linenomath}%
  \csappto{end#1}{\endlinenomath}%
  \csappto{end#1*}{\endlinenomath}%
}
%% Patch AMS math environments:
\newcommand*\linenomathpatchAMS[1]{%
  \cspreto{#1}{\linenomathAMS}%
  \cspreto{#1*}{\linenomathAMS}%
  \csappto{end#1}{\endlinenomath}%
  \csappto{end#1*}{\endlinenomath}%
}

%% Definition of \linenomathAMS depends on whether the mathlines option is
%% provided
\expandafter\ifx\linenomath\linenomathWithnumbers{}
\let\linenomathAMS\linenomathWithnumbers{}
%% The following line gets rid of an extra line numbers at the bottom:
\patchcmd\linenomathAMS{\advance\postdisplaypenalty\linenopenalty}{}{}{}
\else
\let\linenomathAMS\linenomathNonumbers{}
\fi

\linenomathpatch{equation}
\linenomathpatchAMS{gather}
\linenomathpatchAMS{multline}
\linenomathpatchAMS{align}
\linenomathpatchAMS{alignat}
\linenomathpatchAMS{flalign}
\linenomathpatchAMS{intertext} % Doesn't work: lines are not numbered
\linenomathpatchAMS{shortintertext} % Doesn't work: lines are not numbered

%% Disable line numbering during measurement step of multline
\makeatletter
\patchcmd{\mmeasure@}{\measuring@true}{
  \measuring@true{}
  \ifnum-\linenopenaltypar>\interdisplaylinepenalty{}
  \advance\interdisplaylinepenalty-\linenopenalty{}
  \fi
}{}{}
\makeatother

% Editing ----------------------------------------------------------------------
\RequirePackage{todonotes}
\setuptodonotes{
  backgroundcolor=orange!30,
  textcolor=black,
  linecolor=orange,
  bordercolor=orange!50,
  noshadow
}
\makeatletter
\renewcommand{\@todonotes@textwidth}{2cm}
\makeatother
\providecommand{\TODO}[1]{\todo{\setstretch{1}\tiny\ttfamily\selectfont#1\par}}

\RequirePackage{mdframed}
\def\msgbox#1{
  \begin{mdframed}[linewidth=.5pt]
    #1
  \end{mdframed}
}
\def\infobox#1{
  \begin{mdframed}[backgroundcolor=green!40,linewidth=0.1pt]
    #1
  \end{mdframed}
}
\def\warnbox#1{
  \begin{mdframed}[backgroundcolor=yellow!40,linewidth=0.1pt]
    #1
  \end{mdframed}
}
\def\alertbox#1{
  \begin{mdframed}[backgroundcolor=red!40,linewidth=0.1pt]
    #1
  \end{mdframed}
}

\RequirePackage{soul}
\def\infohl#1{\sethlcolor{green}\hl{#1}}
\def\warnhl#1{\sethlcolor{yellow}\hl{#1}}
\def\alerthl#1{\sethlcolor{red}\hl{#1}}

% References -------------------------------------------------------------------
\RequirePackage{hyperref}
\hypersetup{
  colorlinks,
  citecolor=violet,
  linkcolor=orange,
  urlcolor=blue
}

\RequirePackage{cleveref}

% Debug
% ------------------------------------------------------------------------
\overfullrule=1in
\RequirePackage[l2tabu, orthodox]{nag}

\usepackage{lipsum}\usepackage[base]{babel} % need to go together
%\usepackage{lua-visual-debug}