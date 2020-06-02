package DB;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderState {
    String OrderNo;
    String StoreNo;
    String StoreName;
    String MenuName;
    String UserNo;
    int Amount;
    int NumOfOrders;
    int OrderAmount;
    int TOTAL_ORDER_AMOUNT;
    int TableNo;
    int NumOfUsers;
}
