package creational;

public class JSONBookMetadataExporter extends BookMetadataExporter{

    @Override
    public BookMetadataFormatter createFormatter(){
        return new JSONBookMetadataFormatter();
    }
}
