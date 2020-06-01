package DB;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Menu {
    String MenuNo;
    String MenuName;
    int Amount;
}