%--------------------------- header --------------------------
% KISALaTeX v1.0
% By:
% Mikel Barrenetxea <mikelbarrene@gmail.com>
% Version 1.0 released on 31/05/2019
%

%-------------------------- Identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Classes/KISALaTeX}[2019/05/27 KISA LaTeX thesis class]

%-------------------------- initial code -----------------------
%------------------------------book ---------------------------
\LoadClass[a4paper]{book} 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
%Useful packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{color}
\RequirePackage{datetime}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{emptypage}

%Bibliography
\renewcommand{\bibname}{References}
% NOTE: this command may be overridden by later defined bibliography style 

% Figure options
\RequirePackage[ pdftex, plainpages = false, pdfpagelabels, 
             bookmarks,
             bookmarksopen = true,
             bookmarksnumbered = true,
             breaklinks = true,
             linktocpage,
             pagebackref,
             colorlinks = true,
             linkcolor = black,
             urlcolor  = black,
             citecolor = black,
             anchorcolor = black,
             hyperindex = false,
             hyperfigures
             ]{hyperref} 
\DeclareGraphicsExtensions{.png, .jpg, .pdf}
\graphicspath{{Figures/PNG/}{Figures/PDF/}{Figures/}}

% Page settings (a4 paper)
\RequirePackage[a4paper,centering]{geometry}
\setlength{\headheight}{14.5pt}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[LO]{\nouppercase \rightmark}
\fancyhead[RO]{\thepage}
\fancyhead[LE]{\thepage}
\fancyhead[RE]{\nouppercase \leftmark}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}



%-------------------------- commands -----------------------

% Declarations
% Supervisor name
\def\supervisor#1{\gdef\@supervisor{#1}}
% The name of the department (eg. DIBRIS)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of the faculty
\def\faculty#1{\gdef\@faculty{#1}}
% The name of the university  (eg. University of Genova)
\def\university#1{\gdef\@university{#1}}
% The year and month the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}


% Special pages (single column always)
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% TITLE PAGE
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \begin{center}
    {\begin{minipage}{\textwidth}
      \hrule
      \vskip 2mm
      \raisebox{-0.5\height}{\includegraphics[height=18mm,width=45mm,keepaspectratio=true]{ehu}}
      \hfill
      \raisebox{-0.5\height}{\includegraphics[height=18mm,width=45mm,keepaspectratio=true]{informatika}}
      \hfill
      \raisebox{-0.5\height}{\includegraphics[height=18mm,width=45mm,keepaspectratio=true]{KISA}}
      \vskip 2mm
      \hrule
    \end{minipage}}
    \vskip 10mm
    {{Konputazio Zientziak eta Adimen Artifizialaren Saila}}
    \vskip 1mm
    {{Departamento de Ciencias de la Computación e Inteligencia Artificial}}
    \vskip 10mm
    {\Large {Master thesis}}
    \vfill
    { \LARGE {\bfseries {\@title}}}
    \vfill
    {by}
    \vskip 5mm
    {{\Large \@author}}
    \vfill
    {Supervised by}
    \vskip 5mm
    {{\Large \@supervisor} \vskip 2mm {\@collegeordept,} \par {\@faculty, \@university}}
    \vfill
    {\@degreedate}
  \end{center}
  \newpage\null\thispagestyle{empty}\newpage
\end{alwayssingle}}
