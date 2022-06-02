% \iffalse meta-comment
%% File: snedecorbeamer.cls
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
%% Snedecor LaTeX class file for presentation
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{snedecorbeamer}[2022-05-06 The Snedecor bundle class for nice presentations]

% Base class -------------------------------------------------------------------
%% Pass unhandled options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}