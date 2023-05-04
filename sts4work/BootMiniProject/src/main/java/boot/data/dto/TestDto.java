package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("TestDto")
public class TestDto {
	private String num;
	private String name;
	private int price;
	private Timestamp ipgoday;
}
