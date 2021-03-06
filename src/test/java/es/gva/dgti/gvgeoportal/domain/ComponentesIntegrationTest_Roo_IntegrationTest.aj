// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain;

import es.gva.dgti.gvgeoportal.domain.ComponentesDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.ComponentesIntegrationTest;
import es.gva.dgti.gvgeoportal.service.domain.ComponentesService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ComponentesIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ComponentesIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ComponentesIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ComponentesIntegrationTest: @Transactional;
    
    @Autowired
    ComponentesDataOnDemand ComponentesIntegrationTest.dod;
    
    @Autowired
    ComponentesService ComponentesIntegrationTest.componentesService;
    
    @Test
    public void ComponentesIntegrationTest.testCountAllComponenteses() {
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", dod.getRandomComponentes());
        long count = componentesService.countAllComponenteses();
        Assert.assertTrue("Counter for 'Componentes' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ComponentesIntegrationTest.testFindComponentes() {
        Componentes obj = dod.getRandomComponentes();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to provide an identifier", id);
        obj = componentesService.findComponentes(id);
        Assert.assertNotNull("Find method for 'Componentes' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Componentes' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ComponentesIntegrationTest.testFindAllComponenteses() {
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", dod.getRandomComponentes());
        long count = componentesService.countAllComponenteses();
        Assert.assertTrue("Too expensive to perform a find all test for 'Componentes', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Componentes> result = componentesService.findAllComponenteses();
        Assert.assertNotNull("Find all method for 'Componentes' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Componentes' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ComponentesIntegrationTest.testFindComponentesEntries() {
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", dod.getRandomComponentes());
        long count = componentesService.countAllComponenteses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Componentes> result = componentesService.findComponentesEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Componentes' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Componentes' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ComponentesIntegrationTest.testFlush() {
        Componentes obj = dod.getRandomComponentes();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to provide an identifier", id);
        obj = componentesService.findComponentes(id);
        Assert.assertNotNull("Find method for 'Componentes' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyComponentes(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Componentes' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ComponentesIntegrationTest.testUpdateComponentesUpdate() {
        Componentes obj = dod.getRandomComponentes();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to provide an identifier", id);
        obj = componentesService.findComponentes(id);
        boolean modified =  dod.modifyComponentes(obj);
        Integer currentVersion = obj.getVersion();
        Componentes merged = componentesService.updateComponentes(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Componentes' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ComponentesIntegrationTest.testSaveComponentes() {
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", dod.getRandomComponentes());
        Componentes obj = dod.getNewTransientComponentes(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Componentes' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Componentes' identifier to be null", obj.getId());
        try {
            componentesService.saveComponentes(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Componentes' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ComponentesIntegrationTest.testDeleteComponentes() {
        Componentes obj = dod.getRandomComponentes();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Componentes' failed to provide an identifier", id);
        obj = componentesService.findComponentes(id);
        componentesService.deleteComponentes(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Componentes' with identifier '" + id + "'", componentesService.findComponentes(id));
    }
    
}
