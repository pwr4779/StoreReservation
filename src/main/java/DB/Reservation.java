package DB;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Reservation {
    String ReservationNo;
    String UserNo;
    String StoreNo;
    String VistDate;
    String NumOfUsers;
    String Cancelcheck;
    String visitcheck;
    String Noshowcheck;
}
