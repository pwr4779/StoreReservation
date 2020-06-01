package DB;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Order {
    String OrderNo;
    String StoreNo;
    String UserNo;
    int TotalAmount;
    int TableNo;
    int NumOfUsers;
}
