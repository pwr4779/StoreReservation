package DB;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GradeHistory {
    String UserNo;
    String GrantDate;
    String Grade;
    String ExpireDate;
}
