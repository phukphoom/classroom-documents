package creational;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.ArrayList;

public class JSONBookMetadataFormatter implements BookMetadataFormatter {

    private JSONArray jsonBuffer;

    public JSONBookMetadataFormatter(){
        reset();
    }

    @Override
    public BookMetadataFormatter reset() {
        this.jsonBuffer = new JSONArray();

        return this;
    }

    @Override
    public BookMetadataFormatter append(Book b) {
        JSONObject jsonObject = new JSONObject ();

        jsonObject.put(Book.Metadata.ISBN.value,b.getISBN());

        JSONArray jsonAuthors = new JSONArray();
        for (String author:b.getAuthors()) {
            jsonAuthors.add(author);
        }
        jsonObject.put(Book.Metadata.AUTHORS.value, jsonAuthors);

        jsonObject.put(Book.Metadata.TITLE.value,b.getTitle());

        jsonObject.put(Book.Metadata.PUBLISHER.value,b.getPublisher());

        this.jsonBuffer.add(jsonObject);

        return this;
    }

    @Override
    public String getMetadataString() {
        JSONObject jsonReturn = new JSONObject();
        jsonReturn.put("Books",jsonBuffer);

        return jsonReturn.toString();
    }
}
