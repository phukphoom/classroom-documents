package creational;

import javax.xml.parsers.ParserConfigurationException;

public class XMLBookMetadataExporter extends BookMetadataExporter{

    @Override
    public BookMetadataFormatter createFormatter(){
        BookMetadataFormatter formatter = null;

        try{
            formatter = new XMLBookMetadataFormatter();
        }
        catch (ParserConfigurationException e){
            e.printStackTrace();
        }

        return formatter;
    }
}
