# Ejecutar Pruebas con Karate

Este proyecto utiliza Karate para ejecutar pruebas automatizadas. A continuación, se detallan los pasos para ejecutar las pruebas y generar los reportes correspondientes.

## Requisitos Previos

- Java JDK 8 o superior
- Maven

## Ejecución de Pruebas

Para ejecutar las pruebas, sigue estos pasos:

1. Clona el repositorio en tu máquina local.
2. Navega al directorio del proyecto.
3. Ejecuta el siguiente comando de Maven:

```bash
   ./gradlew test -Dkarate.options="--tags @E2E"
```
Este comando ejecutará las pruebas definidas en el proyecto y generará los reportes correspondientes.

## Generación de Reportes
Después de ejecutar las pruebas, los reportes se generarán automáticamente en el directorio build. Para visualizar los reportes, abre el archivo index.html en un navegador web.

 ## Código de Ejemplo
A continuación se muestra un ejemplo de cómo se configuran y ejecutan las pruebas en este proyecto:

public class ManagementRunner {
```java
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:usuarios").outputCucumberJson(true).tags("@E2E").parallel(1);

        generateReport(results.getReportDir());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "RetoTecnico");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
```
Este código ejecuta las pruebas en paralelo y genera un reporte en formato JSON, el cual es posteriormente utilizado para generar un reporte HTML utilizando ReportBuilder.

Notas Adicionales
Asegúrate de tener todas las dependencias necesarias en tu archivo pom.xml.
Puedes ajustar la configuración de las pruebas y los reportes según tus necesidades específicas.