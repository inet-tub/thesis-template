\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{inetthesis}[2024/09/20 INET Thesis Class]

\LoadClass{scrreprt}[
a4paper,
]

\usepackage{kvoptions}

\DeclareStringOption[english]{babel}[english]
\ProcessKeyvalOptions*

\usepackage[\inetthesis@babel]{babel}
\usepackage{datetime2}
\usepackage{hyperref}
\usepackage{cleveref}
\usepackage{amsthm}
\usepackage{thmtools}
\usepackage{graphicx}

\newcommand*{\supervisor}[1]{\def\@supervisor{#1}}
\supervisor{}
\newcommand*{\secondsupervisor}[1]{\def\@secondsupervisor{#1}}
\secondsupervisor{}
\newcommand*{\birthdate}[1]{\def\@birthdate{#1}}
\birthdate{}
\newcommand*{\placeofbirth}[1]{\def\@placeofbirth{#1}}
\placeofbirth{}
\newcommand*{\authorname}[1]{\def\@authorname{#1}}
\authorname{}

\renewcommand\maketitle{\begin{titlepage}
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil

\begin{center}%

\parbox{10cm}{\centering\huge\bfseries \@title \par}\\
\vspace{1em}
{\Large
\vspace{1em}
\@authorname}\\
\vspace{1em}
Geb. \@birthdate\ in \@placeofbirth\\
\vspace{1em}
{\large \@date}
\vspace{8em}

{\large Masterarbeit}\\
\vspace{1em}
{\large Gutachter \@supervisor}\\
\vspace{1em}
{\large Zweitgutachter \@secondsupervisor}\\
\vspace{1em}
\centerline{{\large\scshape Institut für Telekommunikationssysteme}}
\centerline{{\large\scshape Fachgruppe Internet Architecture and Management}}
\vspace{10em}

\centerline{{\large\scshape Fakult\"at IV Elektrotechnik und Informatik der}}
\vspace{1em}
\centerline{{\large\scshape Technischen Universit\"at Berlin}}
\vspace{3em}
\centerline{\includegraphics[width=0.2\textwidth]{tu-berlin-logo}\qquad\includegraphics[width=0.2\textwidth]{inet-logo}}

\end{center}

\vfil\null
\end{titlepage}

  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\declaretheoremstyle[
headfont=\normalfont\itshape,
notefont=\normalfont\itshape,
notebraces={(}{)},
bodyfont=\normalfont,
qed=\qedsymbol,
headpunct=.,
]{proof}

\declaretheorem[
name=Theorem,
style=plain,
numbered=unless unique,
]{theorem}
\declaretheorem[
name=Lemma,
style=plain,
numberwithin=chapter,
]{lemma}
\declaretheorem[
name=Proposition,
style=plain,
sibling=lemma,
]{proposition}
\declaretheorem[
name={\ifx\inetthesis@babel{ngerman}{Korollar}\else\ifx\inetthesis@babel{german}{Korollar}\else{Corollary}\fi\fi},
style=plain,
sibling=lemma,
]{corollary}

\declaretheorem[
name=Definition
style=definition,
sibling=lemma
]{definition}
\declaretheorem[
name={\ifx\inetthesis@babel{ngerman}{Notiz}\else\ifx\inetthesis@babel{german}{Notiz}\else{Note}\fi\fi},
style=remark,
numbered=no,
]{note}
\declaretheorem[
name={\ifx\inetthesis@babel{ngerman}{Bemerkung}\else\ifx\inetthesis@babel{german}{Bemerkung}\else{Remark}\fi\fi},
style=remark,
sibling=lemma,
]{remark}

\declaretheorem[
name={\ifx\inetthesis@babel{ngerman}{Beweis}\else\ifx\inetthesis@babel{german}{Beweis}\else{Proof}\fi\fi},
style=proof,
numbered=no,
]{prf}

\renewenvironment{proof}{\begin{prf}}{\end{prf}}


