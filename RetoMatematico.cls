\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RetoMatematico}[2025/09/03 Plantilla de LaTeX oficial del grupo de Telegram "Retos Matemáticos".]

%%%%% Tamaño A4, con fuente de 11 pt. y con los números de ecuaciones a la derecha
\LoadClass[a4paper,11pt,reqno]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish]{babel}

%%%%% Dimensiones del documento.
\marginparwidth 0.5in 
\oddsidemargin 0.25in 
\evensidemargin 0.25in 
\marginparsep 0.25in
\topmargin -0.1in 
\textwidth 6in \textheight 8.1in

%%%%% Parámetros de la clase `RetoMatematico.cls'
\RequirePackage{xkeyval}

\def\ProblemaAutor{José Manuel Sánchez Muñoz}
\def\ProblemaFecha{14 de marzo de 2718}
\def\ProblemaPalabrasClave{}
\def\ProblemaResaltado{minted}

\define@key{RetoMatematico.cls}{autor}[1]{ \def\ProblemaAutor{#1} }
\define@key{RetoMatematico.cls}{fecha}[1]{ \def\ProblemaFecha{#1} }
\define@key{RetoMatematico.cls}{palabrasclave}[1]{ \def\ProblemaPalabrasClave{#1} }
\define@key{RetoMatematico.cls}{codigo}[1]{ \def\ProblemaResaltado{#1} }

\ProcessOptionsX

%%%%% Metadatos del documento
\RequirePackage{hyperref}
\hypersetup{
    pdftitle={Reto matemático: \ProblemaFecha},
    pdfsubject={Licenciado bajo Creative Commons Attribution Non Commercial Share Alike 4.0 International},
    pdfkeywords={\ProblemaPalabrasClave},
    pdfauthor={\ProblemaAutor},
    colorlinks,
    allcolors=gray,
%   hyperindex,
    breaklinks=true
}

%%%%% Título y fecha
\title{\vspace{-10mm} Retos Matemáticos}
\date{\ProblemaFecha}

%%%%% Fuentes de texto y ecuaciones
\RequirePackage{mathpazo}
\RequirePackage{}

%%%%% Colores y cajas
\RequirePackage{xcolor}
\definecolor{verdeodi}{RGB}{53,113,105}
\definecolor{azulico}{RGB}{121,205,244}

\RequirePackage[most]{tcolorbox}
\newtcolorbox{cajaejercicio}[1][]{
	enhanced,
	boxrule=1pt,arc=8pt,boxsep=0pt,
	left=0.8em,right=0.8em,top=1ex,bottom=1ex,colback=verdeodi!20,breakable,colframe=verdeodi,#1
}
\newcommand\cajaenfasis[2][]{\tikz[overlay]\node[fill=verdeodi!10,inner xsep=2pt, inner ysep=4pt, anchor=text, rectangle, rounded corners=3pt,#1] {\ #2\ \mbox{}};\phantom{#2}}

%%%%% Márgenes del documento
\RequirePackage{pgf}
\RequirePackage{tikz}
\usetikzlibrary{arrows}

\RequirePackage{ccicons}
\RequirePackage{qrcode}

\AddToHook{shipout/background}
{
\ifnum\value{page}=1
\begin{tikzpicture}[remember picture,overlay]
	\node[font=\sffamily,anchor=east,
	xshift=-0.45cm,yshift=5.44cm] at (current page.south east)
	{\parbox{5mm}{\color{verdeodi!40}\sf\footnotesize\ccLogo\\ \ccAttribution\\ \ccNonCommercial\\\ccShareAlike}};
	\node[font=\sffamily,anchor=east,
	xshift=-0.32cm,yshift=4.04cm] at (current page.south east)
	{\hypersetup{urlcolor=verdeodi!40}\qrcode[hyperlink, height=10mm]{https://n9.cl/tlg22}};
	\node[font=\sffamily,anchor=west,
	xshift=0.7cm,yshift=-5.75cm] at (current page.north west)
	{\rotatebox{90}{\color{verdeodi!40}\footnotesize ISSN: 2952--0746}};
\end{tikzpicture}
\else
\begin{tikzpicture}[remember picture,overlay]
	\node[font=\sffamily,anchor=east,
	xshift=-0.7cm,yshift=-5.44cm] at (current page.east)
	{\color{verdeodi!30} \rotatebox{270}{\sf {\raggedleft \footnotesize \ccLogo\,\ccAttribution\,\ccNonCommercial\,\ccShareAlike{} \href{https://t.me/Retos_Matematicos}{\color{verdeodi!30} Retos Matemáticos: \texttt{https:/\!/t.me/Retos\_Matematicos}}}}};
	\node[font=\sffamily,anchor=west,
	xshift=0.7cm,yshift=5.75cm] at (current page.west)
	{\color{verdeodi!30}\rotatebox{90}{\sf{\raggedleft \footnotesize ISSN: 2952--0746; \ProblemaFecha}}};
\end{tikzpicture}
\fi
}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}

%%%%% Cuerpo del documento, ejercicio, forma, énfasis y resolutores
\newcommand{\documento}[1]{
\begin{document}
    \maketitle
    \thispagestyle{empty}
    #1
\end{document}
}

\newcommand{\ejercicio}[2]{
\begin{cajaejercicio}
\noindent\textbf{Ejercicio:} #1
\end{cajaejercicio}
\noindent{\sf \textcolor{verdeodi}{#2}}
}

\newcounter{forma}
\setcounter{forma}{0}
\newcommand{\forma}{
    \addtocounter{forma}{1}
    \section*{\tikz\node[left color=verdeodi!20,inner sep=3pt]{\normalfont\large\bfseries\sf\color{verdeodi} \theforma\textsuperscript{a} Forma\phantom{xxxxxxxxxxxxxxx}};}
}

\RequirePackage{empheq}
\newcommand{\enfasis}[1]{
    \begin{empheq}[box=\cajaenfasis]{equation*}
        \color{verdeodi} #1
    \end{empheq}
}

\newcommand{\resolutores}[1]{
\vspace{3mm}
\noindent {\color{verdeodi}\sf Resuelto por {#1}\!\!.}
}

%%%%% Detalles tipográficos: separación entre títulos, no indentar notas a pie de página...
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{12pt}{8pt}
\RequirePackage{titling}
\preauthor{}
\postauthor{}

\makeatletter
\renewcommand\@makefntext[1]{%
\setlength\parindent{1em}%
\noindent
\makebox[0.7em][r]{\textsuperscript{\@thefnmark}~}{#1}}
\makeatother