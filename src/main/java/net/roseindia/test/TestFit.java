import static org.junit.Assert.*;

import org.junit.Test;
import net.roseindia.java.*;
public class TestFit {

	@Test
	public void test() {
		fit obj=new fit();
		org.junit.Assert.assertEquals(obj.call("1"),true);
	}
}
