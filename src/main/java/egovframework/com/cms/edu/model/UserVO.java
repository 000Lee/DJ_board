package egovframework.com.cms.edu.model;

import lombok.Data;
import java.util.Date;

@Data
public class UserVO {
    private Long id;
    private String username;
    private String password;
    private String name;
    private Date createdAt;
    private Boolean isAdmin;  // 관리자 여부
}

