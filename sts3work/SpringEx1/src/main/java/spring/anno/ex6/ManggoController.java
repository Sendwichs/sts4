package spring.anno.ex6;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ManggoController {
	// @Autowired // �������̽� Maggo�� ������ Ŭ������ pmanggo �Ѱ��� ���� �ڵ������� �Ǵµ�
	// ���� ������ Ŭ������ ���� ���� ���� ��쿡�� �ڵ� ���Կ� ������ �߻�
	// ��Ȯ�� bean�� �̸����� �����Ϸ��� @Resource(name="��Ȯ�� �̸�")

	//	@Resource(name="pmanggo")
	 @Resource(name="taiwanManggo")
	Manggo manggo;

	public void writeManggo() {
		System.out.println("���� �����ϴ� ������");
		manggo.writeManggoName();
	}

}