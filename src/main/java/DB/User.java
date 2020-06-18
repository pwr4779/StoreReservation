package DB;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class User {
    String UserName;
    String UserID;
    String UserPassword;
    String UserAddr;
    String UserPhone;
    String UserBirth;
    String UserHobby;
    String UserPreferenceStore;
    String sanctionsDate;


}
