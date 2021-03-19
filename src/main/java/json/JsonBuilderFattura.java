package json;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import model.Fattura;
import model.Prodotto;

import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

public class JsonBuilderFattura implements com.google.gson.JsonSerializer<Fattura> {

    @Override
    public JsonElement serialize(Fattura fatt, Type arg1, JsonSerializationContext arg2) {
        // TODO Auto-generated method stub
        JsonObject obj = new JsonObject();
        HashMap<Prodotto, Integer> map = fatt.getCarrello().getOrdine();
        JsonArray list = new JsonArray();
        double prezzoTotale = 0.0;

        obj.addProperty("data", fatt.getData().toString());
        obj.addProperty("id", fatt.getCodice());

        for (Map.Entry<Prodotto, Integer> entry : map.entrySet()) {
            JsonObject ord = new JsonObject();
            Prodotto p = entry.getKey();
            Integer pqt = entry.getValue();
            double prezzoTotaleProd;

            prezzoTotaleProd = p.getPrezzo() * pqt;
            prezzoTotale += prezzoTotaleProd;

            ord.addProperty("idProd", p.getCodiceTel());
            ord.addProperty("prezzoTot", prezzoTotaleProd);
            ord.addProperty("prezzoUni", p.getPrezzo());
            //metti tutte le proprietà del prodotto
            ord.addProperty("nome", p.getNome());
            ord.addProperty("qt", pqt.toString());
            list.add(ord);
        }

        obj.addProperty("prezzoTotale", prezzoTotale);
        obj.add("list", list);

        return obj;
    }
}