package run.kabuctl.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class DemoController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping(value = "/api/v1/get-all")
    public List<Map<String, Object>> getAll() {
        return jdbcTemplate.queryForList("SELECT * from users_tokenization");
    }
}
