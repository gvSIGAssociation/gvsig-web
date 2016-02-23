package es.gva.dgti.gvgeoportal.domain;
import org.junit.Test;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = CapasServicioWeb.class, remove = false, persist = false, findAllMaximum = 2000)
public class CapasServicioWebIntegrationTest {

    @Test
    public void testMarkerMethod() {
    }
}
