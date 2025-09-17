<div align="center">

<img src="https://github.com/user-attachments/assets/c67a0bf4-7436-4ed4-a2f9-67181ff65575" width="50%"></img>
	
<i><b>Plantilla de LaTeX del grupo de Telegram «Retos Matemáticos».</b></i>
</div>
<hr>

El código de este repositorio es aquel empleado para la elaboración de las soluciones finales de los retos propuestos en el grupo de Telegram [«Retos Matemáticos»](https://t.me/Retos_Matematicos), de [José Manuel Sánchez Muñoz](https://github.com/josemanuelsan1973).

Asimismo, la plantilla original - que constituye la inmensa mayoría del contenido de este paquete - es producto de él, mi trabajo solo ha sido su reorganización y la creación de archivos `.cls` y  `.sty` reutilizables y amigables para aquel poco versado en $\LaTeX$, o que simplemente busque mayor comodidad.

RetoMatematico.cls, entre otras características, cambia las dimensiones del documento a papel *letter*, la fuente a *Palatino Linotype* - a través del paquete `mathpazos` - y coloca márgenes con el ISSN y el enlace del grupo. Para una vista más detallada, consulte el documento de ejemplo que puede encontrar en la sección *Releases*.

# Cómo usar
Primeramente, descargue la plantilla haciendo clic en el botón `Code` en la parte derecha arriba del contenido del repositorio y posteriormente `Download ZIP` (y luego descomprima el archivo `.zip` en una carpeta nueva), o en su defecto haga clic en el botón `Use this template`. Alternativamente, también puede obtenerla del [repositorio de CTAN del paquete](https://ctan.org/pkg/retosmatematicos).

Un ejemplo mínimo funcional se encuentra en el archivo `main.tex`, luego basta eliminar las líneas $13\text{-}149$ y comenzar a escribir.

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

## El paquete RetoExtra

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
* Paquete `siunitx`: Permite una mejor tipografía de magnitudes y unidades.

### Símbolos y fuentes
* Paquete `upgreek`: Letras griegas no italizadas.
* Paquete `esvect`: Mejores vectores.
* Paquete `eurosym`: Símbolo de euro.
* Paquete `yhmath`: Fuentes matemáticas extendidas.
* Paquete `wrapfig`: Permite que el texto rodee a la figura.
* Comandos `\newint` y `\otraint`: Mejores integrales.
* Comando `\stretchint{⟨proporción⟩}`: Alargar (sin engordar) una integral.

### Gráficos
* Paquete `pgfplots`: Gráficos de funciones en 2D y 3D.
* Paquete `colortbl`: Colores en tablas.

# Las clases RetoTikZ y RetoPSTricks

Por último, para la creación de figuras mediante $\text{Ti}k{Z}$ y PSTricks se ponen a disposición del usuario las clases `RetoTikZ` y `RetoPSTricks` respectivamente, las cuales no toman ningún argumento y definen los estilos de los diagramas. Además, en el caso de esta última se definen también varias macros de utilidad:

* Comando `\pstBarycenter{⟨A⟩}{⟨B⟩}{⟨C⟩}{⟨nombre⟩}`: Macro para hallar el baricentro de un triángulo $\triangle ABC$.
* Comando `\pstcenter{⟨A⟩}{⟨B⟩}{⟨C⟩}{⟨D⟩}{⟨nombre⟩}`: Macro para hallar el centro de un cuadrilátero $ABCD$.

Un ejemplo se encuentra en la carpeta [imágenes](imagenes/ejemplo-pstricks.tex).

> **Nota:** Las figuras que se quieran incluir en el documento final probablemente hayan de ser creadas en archivos separados para posteriormente incluir el PDF resultante en el principal.

<br>
<br>

*Licenciado bajo Creative Commons Attribution-ShareAlike 4.0 International*
