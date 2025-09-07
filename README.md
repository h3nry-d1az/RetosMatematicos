<div align="center">

<img src="https://github.com/user-attachments/assets/c67a0bf4-7436-4ed4-a2f9-67181ff65575" width="50%"></img>
	
<i><b>Plantilla de LaTeX del grupo de Telegram «Retos Matemáticos».</b></i>
</div>
<hr>

El código de este repositorio es aquel empleado para la elaboración de las soluciones finales de los retos propuestos en el grupo de Telegram [«Retos Matemáticos»](https://t.me/Retos_Matematicos), de [José Manuel Sánchez Muñoz](https://github.com/josemanuelsan1973).

Asimismo, la plantilla original - que constituye la inmensa mayoría del contenido de este paquete - es producto de él, mi trabajo solo ha sido su reorganización y la creación de archivos `.cls` y  `.sty` reutilizables y amigables para aquel poco versado en $\LaTeX$, o que simplemente busque mayor comodidad.

# Preliminares

Esta sección tiene como propósito servir de introducción a $\LaTeX$ y, con suerte, una solución o alivio a los dolores de cabeza que puede conllevar su configuración.

A quienes quieran saltarse este paso y simplemente comenzar a crear documentos, pueden abrirse una cuenta en [Overleaf](https://www.overleaf.com/) y saltar a la sección [Recursos para aprender LaTeX](https://github.com/h3nry-d1az/RetoMatematico.cls#recursos-para-aprender-latex).

## Instalación
En primera instancia, uno ha de instalar una *distribución* de $\LaTeX$, pues este no es un único compilador monolítico, sino que cada sistema operativo tiene una o varias implementaciones distintas de los a su vez varios sabores de $\TeX$ (véase la sección [*Compiladores*](https://github.com/h3nry-d1az/RetoMatematico.cls#compiladores)).

Se suele recomendar $\text{Mik}\TeX$, pues se encuentra disponible para Windows, MacOS y Linux, y su instalación es relativamente sencilla; puede descargarlo a través de su página principal [[1]](https://miktex.org/download). No obstante, destacan también $\TeX\ \text{Live}$ en Linux y $\text{Mac}\TeX$ en MacOS como las más notables alternativas. 

## Editor de código
Seguidamente, es necesario un programa con el que crear el propio documento: un editor de código, o mejor todavía, un IDE (siglas en inglés de entorno de desarrollo integrado).

El software por antonomasia para esta labor es [TeXstudio](https://www.texstudio.org/), de instalación prácticamente inmediata y que funciona nada más tenerlo en el equipo, la recomendación a todo principiante.

No obstante, las alternativas son numerosas e incluso más potentes en ciertos aspectos. [Visual Studio Code](https://code.visualstudio.com/) es también muy amigable para los novatos, aunque no se puede decir que es un editor de $\LaTeX$ per se, sino que permite editar código de una infinidad de lenguajes. Por este motivo, para configurar $\LaTeX$ correctamente en el mismo hará falta bajar las extensiones [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) y opcionalmente [LTeX](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex), este último dedicado a detectar errores ortográficos. Es probable que la instalación de LTeX falle - al menos, he visto numerosos casos así -, pero como siempre la solución está en Stack Overflow [[2]](https://stackoverflow.com/questions/78905169/vs-code-ltex-extension-fails-to-run-with-java-in-latex-profile).

Por último, para el lector versado en editores de código más avanzados como (Neo)Vim o Emacs, existen extensiones muy buenas para ambos [[3](https://github.com/lervag/vimtex), [4](https://www.gnu.org/software/auctex/)]. Esta opción **NO** se recomienda a principiantes.

## Compiladores


## Recursos para aprender $\LaTeX$
$\LaTeX$ es un lenguaje increíblemente potente, con funcionalidades que van desde la tipografía más simple hasta, bueno, hasta ser un lenguaje Turing-completo. Por tanto, existen guías de $\LaTeX$ para todos los niveles, aunque comenzar a usarlo es rápido y satisfactorio, y apenas en unas horas puede tenerse una base más o menos sólida sobre este. Algunos de los mejores libros y tutoriales sobre este ámbito son los siguientes:
* [The Not So Short Introduction to LaTeX 2ε](https://tug.ctan.org/info/lshort/english/lshort.pdf) : Completísimo y gratis, una lectura esencial.
* [Learn LaTeX in 30 minutes](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes): Rápido y al grano, del propio Overleaf.
* [Wikibooks: LaTeX](http://en.wikibooks.org/wiki/LaTeX): No está completo del todo, pero lo que hay es fenomenal.

# Cómo usar
Primeramente, descargue la plantilla haciendo clic en el botón `Code` en la parte derecha arriba del contenido del repositorio y posteriormente `Download ZIP` (y luego descomprima el archivo `.zip` en una carpeta nueva), o en su defecto haga clic en el botón `Use this template`.

Un ejemplo mínimo funcional se encuentra en el archivo `main.tex`, luego basta eliminar las líneas $9\text{-}66$ y comenzar a escribir.

## Parámetros
La clase `RetoMatematico` puede ser llamada con tres parámetros distintos:

```latex
\documentclass[
    autor={Yo}
	fecha={dd de mm de AAAA},
	palabrasclave={RetoSecundaria, mmmAAAA, álgebra, difX},
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

* `\ejercicio{⟨enunciado⟩}{⟨proponente⟩}`: Crea una caja con el enunciado del ejercicio y seguidamente el proponente del mismo.†
* `\forma`: Ejecutarlo por primera vez genera *1ª Forma*, por segunda vez *2ª Forma*...
* `\[n]seccion{⟨título⟩}`: Genera una sección arbitraria, numerada si el comando posee la `n` opcional.
* `\enfasis{⟨ecuación⟩}`: Produce una ecuación en una caja verde que le da énfasis.
* `\resolutores{⟨resolutores⟩}`: Escribe *Resuelto por*, seguido de quienes hayan resuelto el problema.

**†** Existe además el entorno `cajaejercicio` que genera una caja de ejercicio sin ningún contenido en su interior.

## El paquete `RetoExtra.sty`

Puede cargas algunas funciones y paquetes adicionales a través del módulo separado `RetoExtra`, tal que así:
```latex
\usepackage{RetoExtra}
```

Las definiciones del mismo son las siguientes:

### Tipografía
* Paquete `mathtools`: Herramientas de tipografía diversas.
* Paquete `multicol`: Varias columnas de texto.
* Paquete `setspace`: Altera el interlineado del documento.
* Paquete `hanging`: Permite sangría.
* Comando `\inlineequation`: Ecuación en línea que puede ser referenciada.
* Paquete `cleveref`: Mejores referencias.
* Paquete `polynom`: Operaciones con polinomios
* Paquete `systeme`: Mejores sistemas de ecuaciones.
* Paquete `cancel`: Cancelar términos en expresiones.
* Paquete `enumitem`: Enumeraciones personalizables.
* Paquete `xfrac`: Fracciones oblicuas.
* Paquete `natbib`: Gran soporte para bibliografías
* Paquete `lipsum`: El conocido "lorem ipsum dolor sit amen".

### Símbolos y fuentes
* Paquete `upgreek`: Letras griegas no italizadas.
* Paquete `esvect`: Mejores vectores.
* Paquete `eurosym`: Símbolo de euro.
* Paquete `yhmath`: Fuentes matemáticas extendidas.
* Paquete `wrapfig`: Permite que el texto rodee a la figura.
* Comandos `\newint` y `\otraint`: Mejores integrales.
* Comando `\stretchint{⟨proporción⟩}`: Alargar (sin engordar) una integral.

### Gráficos
* Paquete `auto-pst-pdf`: Permite compilar PStricks con $\text{pdf}\LaTeX$.
* Paquete `pgfplots`: Gráficos de funciones en 2D y 3D.
* Paquete `pst-eucl`: Geometría euclídea con PSTricks.
* Paquete `pstricks-add`: Parches varios a PSTricks.
* Comando `\pstBarycenter{⟨A⟩}{⟨B⟩}{⟨C⟩}{⟨nombre⟩}`: Macro para hallar el baricentro de un triángulo $\triangle ABC$.
* Comando `\pstcenter{⟨A⟩}{⟨B⟩}{⟨C⟩}{⟨D⟩}{⟨nombre⟩}`: Macro para hallar el centro de un cuadrilátero $ABCD$.
* Paquete `colortbl`: Colores en tablas.

<br>
<br>

*Licenciado bajo Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International*
