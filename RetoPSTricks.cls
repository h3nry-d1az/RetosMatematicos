\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RetoPSTricks}[2025/09/09 Clase para la creación de gráficos externos con PSTricks. Suplemento a RetoMatematico.cls]
% CLASE PARA INCLUIR GRÁFICOS EXTERNOS CREADOS CON PSTricks

\LoadClass[border=1mm]{standalone}

\RequirePackage{auto-pst-pdf}
\RequirePackage{pst-eucl} % Geometría euclídea con PSTricks
\RequirePackage{pstricks-add} % Parches varios a PSTricks
% Macro para hallar el baricentro de un triángulo ABC
\newcommand{\pstBarycenter}[4]{%
	% #1 = A, #2 = B, #3 = C, #4 = nombre del baricentro
	\pstMiddleAB[PointName=none,PointSymbol=none]{#2}{#3}{M#4}% Punto medio de BC
	\pstMiddleAB[PointName=none,PointSymbol=none]{#1}{#3}{N#4}% Punto medio de AC
	\pstInterLL[PointName=none,PointSymbol=none]{#1}{M#4}{#2}{N#4}{#4}% Intersección de dos medianas = baricentro
}
% Macro para hallar el centro de un cuadrilátero ABCD
\newcommand{\pstcenter}[5]{%
	% #1 = A, #2 = B, #3 = C, #4 = D, #5 = nombre del centro
	\pstMiddleAB[PointName=none,PointSymbol=none]{#1}{#2}{M#1#2}% Punto medio de AB
	\pstMiddleAB[PointName=none,PointSymbol=none]{#2}{#3}{M#2#3}% Punto medio de BC
	\pstMiddleAB[PointName=none,PointSymbol=none]{#3}{#4}{M#3#4}% Punto medio de CD
	\pstMiddleAB[PointName=none,PointSymbol=none]{#4}{#1}{M#4#1}% Punto medio de DA
	\pstInterLL[PointName=none,PointSymbol=none]{M#1#2}{M#3#4}{M#2#3}{M#4#1}{#5}
}

\RequirePackage{mathpazo}
\RequirePackage{xcolor}
\definecolor{verdeodi}{RGB}{53,113,105}
\psset{
	unit=3cm,
	algebraic=true,
	dimen=middle,
	dotstyle=o,dotsize=4pt 0,
	linewidth=0.6pt,
	arrowsize=3pt 2,
	arrowinset=0.25,
	linejoin=1
}