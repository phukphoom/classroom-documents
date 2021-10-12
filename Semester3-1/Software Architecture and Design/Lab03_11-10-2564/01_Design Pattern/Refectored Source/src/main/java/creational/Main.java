package creational;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;

public class Main {

    public static void main(String[] args) {

        // Old usage
//        BookMetadataFormatter formatter = null;
//        try {
//            formatter = BookMetadataFormatterFactory.getBookMetadataFormatter(BookMetadataFormatterFactory.Format.CSV);
//            formatter.append(TestData.dragonBook);
//            formatter.append(TestData.dinosaurBook);
//            System.out.print(formatter.getMetadataString());
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (ParserConfigurationException e) {
//            e.printStackTrace();
//        }

        // Current usage [Design Pattern: Factory Method]
        System.out.println("\n>> CSV - Format <<");
        BookMetadataExporter csvExporter = new CSVBookMetadataExporter();
        csvExporter.add(TestData.sailboatBook);
        csvExporter.add(TestData.GoFBook);
        csvExporter.export(System.out);

        System.out.println("\n>> XML - Format <<");
        BookMetadataExporter xmlExporter = new XMLBookMetadataExporter();
        xmlExporter.add(TestData.sailboatBook);
        xmlExporter.add(TestData.GoFBook);
        xmlExporter.export(System.out);

        System.out.println("\n>> JSON - Format <<");
        BookMetadataExporter jsonExporter = new JSONBookMetadataExporter();
        jsonExporter.add(TestData.sailboatBook);
        jsonExporter.add(TestData.GoFBook);
        jsonExporter.export(System.out);
    }
}
