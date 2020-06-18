package DB;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Payment {
    String orderNo;
    String saleCode;
    String saleCoupon;
    String finalPayAmount;
    String Install_month;
    String usingPoint;
}
