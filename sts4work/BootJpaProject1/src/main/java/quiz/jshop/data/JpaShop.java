package quiz.jshop.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
//자동으로 mysql에 mycar라는 테이블이 만들어진다 -> 변수가 변경될 경우는 자동수정
@Table(name = "jpashop")
@Data
public class JpaShop {

	@Id // 각 엔터티를 구별할 수 있는 식별아이디를 갖도록 설계(시퀀스)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int num;
	@Column
	private String sangpum;
	@Column
	private int price;
	@Column
	private String photo;
	@Column
	private String ipgoday;
	@CreationTimestamp // 엔티티가 생성되는 시점의 시간 자동등록
	@Column(updatable = false) // 수정 시 이 컬럼은 수정하지 않겠다 -> 안주면 수정 시 null
	private Timestamp writeday;

}
