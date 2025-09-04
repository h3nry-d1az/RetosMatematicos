<div align="center"><i><b>Plantilla de LaTeX del grupo de Telegram «Retos Matemáticos»</b></i></div>
<br>
<hr>
<br>

El código de este repositorio es aquel empleado para la elaboración de las soluciones finales de los retos propuestos en el grupo de Telegram [«Retos Matemáticos»](https://t.me/Retos_Matematicos), de José Manuel Sánchez Muñoz.

Asimismo, la plantilla original - que constituye la inmensa mayoría del contenido de este paquete - es producto de él, mi trabajo solo ha sido su reorganización y la creación de archivos `.cls` y  `.sty` reutilizables y amigables para aquel poco versado en $\LaTeX$, o que simplemente busque mayor comodidad.

Esta plantilla ha de utilizarse preferiblemente con $\text{pdf}\ \LaTeX$, aunque debería de ser también compatible con $\text{Lua} \LaTeX$.

# Instalación
Primeramente, descargue la plantilla haciendo clic en el botón `Code` en la parte derecha arriba del contenido del repositorio y posteriormente `Download ZIP` (y luego descomprima el archivo `.zip` en una carpeta nueva), o en su defecto haga clic en el botón `Use this template`.

Un ejemplo mínimo funcional se encuentra en el archivo `main.tex`, luego basta eliminar las líneas $9\text{-}66$ y comenzar a escribir.

# Cómo usar
En primera instancia, la clase `RetoMatematico` puede ser llamada con tres parámetros distintos:

```latex
\documentclass[
    autor={Yo}
	fecha={dd de mm de AAAA},
	palabrasclave={RetoSecundaria, mmAAAA, álgebra, difX},
	codigo=minted
]{RetoMatematico}
```
Aquí:

* `autor` representa el autor del documento. Su valor por defecto es `José Manuel Sánchez Muñoz`.<sup>*</sup>
* `fecha` contiene la fecha de publicación del reto.
* `palabrasclave` denota las categorías en las que se inscribe el reto.<sup>*</sup>
* `codigo` ha de tener el tipo de resaltado de sintaxis que se utilice al incluir código, existen varias opciones para su valor:

    * `ninguno` (por defecto): No se va a incluir código en el documento y por tanto no se carga ningún paquete ni se crea ningún entorno.
    * `verbatim`: Utiliza el habitual `verbatim` con numeración por la parte izquierda, la sintaxis del entorno `codigo` será entonces:
    ```latex
    \begin{codigo}
    if __name__ == '__main__':
        print('¡Hola mundo!')
    \end{codigo}
    ```
    ```
    1. if __name__ == '__main__':
    2.     print('¡Hola mundo!')
    ```
    * `minted`: Emplea el más sofisticado paquete homónimo; para su instalación es necesario tener Python y PIP en el dispositivo y ejecutar 
    ```sh
    pip install latexminted
    ```
    (`pip3` en Linux), así como llamar al compilador de $\LaTeX$ con `-shell-escape`. La sintaxis del entorno `codigo` será entonces:
    ```latex
    \begin{codigo}{python}
    if __name__ == '__main__':
        print('¡Hola mundo!')
    \end{codigo}
    ```
    ```python
    1. if __name__ == '__main__':
    2.     print('¡Hola mundo!')
    ```

<b>*</b> Este dato puede verse únicamente en los metadatos del documento, los cuales son accesibles, por ejemplo, presionando <kbd>Ctrl</kbd>+<kbd>D</kbd> en Adobe Acrobat.

## Macros básicas

Además, `RetoMatematico.cls` provee varios comandos que abstraen las distintas estructuras dentro de una solución:

* `\ejercicio{⟨enunciado⟩}{⟨proponente⟩}`: Crea una caja con el enunciado del ejercicio y seguidamente el proponente del mismo.
* `\forma`: Ejecutarlo por primera vez genera *1ª Forma*, por segunda vez *2ª Forma*...
* `\[n]seccion{⟨título⟩}`: Genera una sección arbitraria, numerada si el comando posee la `n` opcional.
* `\enfasis{⟨ecuación⟩}`: Produce una ecuación en una caja verde que le da énfasis.
* `\resolutores{⟨resolutores⟩}`: Escribe *Resuelto por*, seguido de quienes hayan resuelto el problema.

## El paquete `RetoExtra.sty`

Puede cargas algunas funciones y paquetes adicionales a través del módulo separado `RetoExtra`, tal que así:
```latex
\usepackage{RetoExtra}
```

Las definiciones del mismo son las siguientes:

### Tipografía
* `mathtools`: Herramientas de tipografía diversas
* `multicol`: Varias columnas de texto
* `setspace`: Altera el interlineado del documento
\RequirePackage[notquote]{hanging`: Sangría
\makeatletter%%%%%%%%para referenciar ecuaciones en línea
% Ecuación en línea que puede ser referenciada
\newcommand*{\inlineequation}[2][]{%
  \begingroup
    \refstepcounter{equation}%
    \ifx\\#1\\%
    \else
      \label{#1}%
    \fi
    \relpenalty=10000 %
    \binoppenalty=10000 %
    \ensuremath{%
      #2%
    }%
    \hfill~\@eqnnum
  \endgroup
}
\makeatother
\RequirePackage[capitalize]{cleveref`: Mejores referencias
\crefname{equation}{Ec.}{Ecs.}
* `polynom`: Operaciones con polinomios
* `systeme`: Mejores sistemas de ecuaciones
* `cancel`: Cancelar términos en expresiones
* `enumitem`: Enumeraciones personalizables
* `xfrac`: Fracciones oblicuas
* `natbib`: Gran soporte para bibliografías
* `lipsum`: El clásico <<lorem ipsum>>

%%%%% Símbolos y fuentes
* `upgreek`: Letras griegas no italizadas
* `esvect`: Mejores vectores
* `eurosym`: Símbolo de euro
* `yhmath`: Fuentes matemáticas extendidas
* `wrapfig`: Permite que el texto rodee a la figura
% Mejores integrales
\newlength {\longexp}
\newcommand{\newint}[2]{\int_{\lower0.7ex\hbox{$\scriptstyle#1$}}^{\raise0.7ex\hbox{$\scriptstyle#2$}}}
\NewDocumentCommand{\otraint}{e{^_}}
{%
  \mathop{}\!%
  \int%
  \IfValueT{#2}{_{\kern-0.2em\lower0.8ex\hbox{$\scriptstyle#2$}}}%
  \IfValueT{#1}{^{\kern-0.0em\raise0.5ex\hbox{$\scriptstyle#1$}}\settowidth{\longexp}{$#1$}\hspace{-0.75\longexp}}%
  \!\mathop{}%
}
* `scalerel}
\def\stretchint#1{\vcenter{\hbox{\stretchto[440]{\displaystyle\int}{#1}}}`: Alargar (sin engordar) una integral

%%%%% Gráficos
* `pgfplots`: Gráficos de funciones en 2D y 3D
* `pst-eucl`: Geometría euclídea con PSTricks
* `pstricks-add`: Parches varios a PSTricks
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
* `colortbl`: Colores en tablas

<br>
<br>

*Licenciado bajo Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International*