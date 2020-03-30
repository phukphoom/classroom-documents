# Getting Started with JavaFX [ Windows ]
**1. Download JavaFX SDK to your computer**
>Link to download JavaFX : https://gluonhq.com/products/javafx/

**2. Set JavaFX Lib Path**

 ```set PATH_TO_FX="path\to\javafx-sdk-[version]\lib"```

**3. Compile your code**

```javac --module-path %PATH_TO_FX% --add-modules javafx.controls [Filename].java```

**4. Run your code**

```java --module-path %PATH_TO_FX% --add-modules javafx.controls [Filename]```