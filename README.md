# Proyecto MIPS

Este repositorio contiene la implementación de un decodificador y un datapath para un procesador MIPS. El proyecto está dividido en dos partes principales: el decodificador y el datapath.

## Estructura del Proyecto

```
.
├── .gitattributes
├── Decod/
│   ├── Decodificador.pyw
│   ├── instruccionesBinarias.txt
│   ├── Instruciones tipoi.txt
│   ├── Instruciones tipoj.txt
│   ├── intrucciones tipo r.txt
│   ├── test.txt
│   └── Decodificador.zip
├── Doc/
│   ├── FASE3_PROYECTOFINAL.docx
│   └── FASE3_PROYECTOFINAL.pdf
├── FASE3_PROYECTOFINAL.pdf
├── Mips/
│   ├── 26_28_Shift_Left_2.v
│   ├── ADD.v
│   ├── Buffer 1_IFID.v
│   ├── Buffer 2_IDEX.v
│   ├── Buffer 3_EXMEM.v
│   ├── Buffer 4_MEMWB.v
│   ├── Fase 2_tb.v
│   ├── Inicialización BR.txt
│   ├── Inicialización Memoria de Datos.txt
│   ├── Inicialización Memoria de Instrucciones.txt
│   ├── MyADD_4.v
│   ├── MyALU.v
│   ├── MyALUControl.v
│   ├── MyBR.v
│   ├── MyControlUnit.v
│   ├── MyDatapath.v
│   ├── MyDatapathMux.v
│   ├── MyDatapathMux5bits.v
│   ├── MyIMem.v
│   ├── MyMem.v
│   ├── MyPC.v
│   ├── Shift_Left_2.v
│   ├── Sign_extend.v
│   └── transcript
├── Mips.zip
```

## Decodificador

El decodificador está implementado en Python utilizando Tkinter para la interfaz gráfica. El archivo principal es [`Decodificador.pyw`](Decod/Decodificador.pyw).

### Uso

1. Ejecuta el archivo `Decodificador.pyw`.
2. Selecciona un archivo ASM utilizando el botón "Buscar archivo".
3. Visualiza el contenido del archivo en la vista previa.
4. Haz clic en "Exportar" para convertir el archivo ASM a instrucciones binarias y guardarlas en `instruccionesBinarias.txt`.

## Datapath

El datapath está implementado en Verilog. Los archivos principales se encuentran en el directorio `Mips/`.

### Archivos Principales

- [`MyDatapath.v`](Mips/MyDatapath.v): Implementación del datapath.
- [`MyControlUnit.v`](Mips/MyControlUnit.v): Unidad de control.
- [`MyALU.v`](Mips/MyALU.v): Unidad aritmético-lógica.
- [`MyMem.v`](Mips/MyMem.v): Memoria de datos.
- [`MyIMem.v`](Mips/MyIMem.v): Memoria de instrucciones.

### Simulación

Para simular el datapath, utiliza el archivo de testbench [`Fase 2_tb.v`](Mips/Fase 2_tb.v).

## Documentación

La documentación del proyecto se encuentra en el directorio `Doc/` y contiene los archivos `FASE3_PROYECTOFINAL.docx` y `FASE3_PROYECTOFINAL.pdf`.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para discutir cualquier cambio que desees realizar.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para obtener más detalles.
