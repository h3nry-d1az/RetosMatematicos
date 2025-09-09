\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RetoTikZ}[2025/09/09 Clase para la creación de gráficos externos con TikZ. Suplemento a RetoMatematico.cls]
% CLASE PARA INCLUIR GRÁFICOS EXTERNOS CREADOS CON TikZ

\LoadClass[tikz,border=1mm]{standalone}

% para versiones antiguas de LaTeX
\RequirePackage{xparse}
\RequirePackage[utf8]{inputenc}

% paquetes de la AMS
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}

% fuentes y codificación
\RequirePackage{mathpazo} % con serifas
\RequirePackage{avant}    % sin serifas
\RequirePackage[T1]{fontenc}

% grosores de línea, puntos, etc.
\definecolor{verdeodi}{RGB}{053,113,105}
\tikzset
{%
  every picture/.style={line cap=round,line join=round},
  ultra thin/.style={line width=0.2pt},
  very thin/.style={line width=0.4pt},
  thin/.style={line width=0.6pt},
  semithick/.style={line width=0.8pt},
  thick/.style={line width=1pt},
  very thick/.style={line width=1.2pt},
  ultra thick/.style={line width=1.4pt},
  punto/.style={draw,circle,very thin,fill=white,inner sep=1.25pt},
}