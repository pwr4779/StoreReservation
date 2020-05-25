package DB;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Data
@AllArgsConstructor
public class Store {
    String StoreNo;
    String StoreAddr;
    String StorePhone;
    int StoreTable;
    String StoreOpen;
    String StoreClose;
    String StoreName;
    String AlterNo;
    String AlterDate;
}
