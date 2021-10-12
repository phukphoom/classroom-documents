package creational;

import java.io.IOException;

public class CSVBookMetadataExporter extends BookMetadataExporter{

    @Override
    public BookMetadataFormatter createFormatter(){
        BookMetadataFormatter formatter = null;

        try{
            formatter = new CSVBookMetadataFormatter();
        }
        catch (IOException e){
            e.printStackTrace();
        }

        return formatter;
    }
}
