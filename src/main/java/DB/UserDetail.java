package DB;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserDetail {
    String UserNo;
    int ACPoint;
    int NumOfOrders;
    String Grade;
    
}
