// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.domain.components;

import es.gva.dgti.gvgeoportal.domain.components.ConfCapasTematicasDataOnDemand;
import es.gva.dgti.gvgeoportal.domain.components.ConfCapasTematicasIntegrationTest;
import es.gva.dgti.gvgeoportal.service.domain.ConfCapasTematicasService;
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

privileged aspect ConfCapasTematicasIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ConfCapasTematicasIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ConfCapasTematicasIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ConfCapasTematicasIntegrationTest: @Transactional;
    
    @Autowired
    ConfCapasTematicasDataOnDemand ConfCapasTematicasIntegrationTest.dod;
    
    @Autowired
    ConfCapasTematicasService ConfCapasTematicasIntegrationTest.confCapasTematicasService;
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testCountAllConfCapasTematicases() {
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", dod.getRandomConfCapasTematicas());
        long count = confCapasTematicasService.countAllConfCapasTematicases();
        Assert.assertTrue("Counter for 'ConfCapasTematicas' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testFindConfCapasTematicas() {
        ConfCapasTematicas obj = dod.getRandomConfCapasTematicas();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to provide an identifier", id);
        obj = confCapasTematicasService.findConfCapasTematicas(id);
        Assert.assertNotNull("Find method for 'ConfCapasTematicas' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ConfCapasTematicas' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testFindAllConfCapasTematicases() {
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", dod.getRandomConfCapasTematicas());
        long count = confCapasTematicasService.countAllConfCapasTematicases();
        Assert.assertTrue("Too expensive to perform a find all test for 'ConfCapasTematicas', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ConfCapasTematicas> result = confCapasTematicasService.findAllConfCapasTematicases();
        Assert.assertNotNull("Find all method for 'ConfCapasTematicas' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ConfCapasTematicas' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testFindConfCapasTematicasEntries() {
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", dod.getRandomConfCapasTematicas());
        long count = confCapasTematicasService.countAllConfCapasTematicases();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ConfCapasTematicas> result = confCapasTematicasService.findConfCapasTematicasEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ConfCapasTematicas' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ConfCapasTematicas' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testFlush() {
        ConfCapasTematicas obj = dod.getRandomConfCapasTematicas();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to provide an identifier", id);
        obj = confCapasTematicasService.findConfCapasTematicas(id);
        Assert.assertNotNull("Find method for 'ConfCapasTematicas' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyConfCapasTematicas(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ConfCapasTematicas' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testUpdateConfCapasTematicasUpdate() {
        ConfCapasTematicas obj = dod.getRandomConfCapasTematicas();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to provide an identifier", id);
        obj = confCapasTematicasService.findConfCapasTematicas(id);
        boolean modified =  dod.modifyConfCapasTematicas(obj);
        Integer currentVersion = obj.getVersion();
        ConfCapasTematicas merged = (ConfCapasTematicas)confCapasTematicasService.updateConfCapasTematicas(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ConfCapasTematicas' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testSaveConfCapasTematicas() {
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", dod.getRandomConfCapasTematicas());
        ConfCapasTematicas obj = dod.getNewTransientConfCapasTematicas(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ConfCapasTematicas' identifier to be null", obj.getId());
        try {
            confCapasTematicasService.saveConfCapasTematicas(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'ConfCapasTematicas' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ConfCapasTematicasIntegrationTest.testDeleteConfCapasTematicas() {
        ConfCapasTematicas obj = dod.getRandomConfCapasTematicas();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ConfCapasTematicas' failed to provide an identifier", id);
        obj = confCapasTematicasService.findConfCapasTematicas(id);
        confCapasTematicasService.deleteConfCapasTematicas(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'ConfCapasTematicas' with identifier '" + id + "'", confCapasTematicasService.findConfCapasTematicas(id));
    }
    
}
