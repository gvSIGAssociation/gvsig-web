// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.web;

import es.gva.dgti.gvgeoportal.domain.components.ConfVistasPredefinidas;
import es.gva.dgti.gvgeoportal.service.domain.ConfVistasPredefinidasService;
import es.gva.dgti.gvgeoportal.web.ConfVistasPredefinidasController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ConfVistasPredefinidasController_Roo_Controller {
    
    @Autowired
    ConfVistasPredefinidasService ConfVistasPredefinidasController.confVistasPredefinidasService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ConfVistasPredefinidasController.create(@Valid ConfVistasPredefinidas confVistasPredefinidas, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, confVistasPredefinidas);
            return "confvistaspredefinidases/create";
        }
        uiModel.asMap().clear();
        confVistasPredefinidasService.saveConfVistasPredefinidas(confVistasPredefinidas);
        return "redirect:/confvistaspredefinidases/" + encodeUrlPathSegment(confVistasPredefinidas.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ConfVistasPredefinidasController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ConfVistasPredefinidas());
        return "confvistaspredefinidases/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ConfVistasPredefinidasController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("confvistaspredefinidas", confVistasPredefinidasService.findConfVistasPredefinidas(id));
        uiModel.addAttribute("itemId", id);
        return "confvistaspredefinidases/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ConfVistasPredefinidasController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("confvistaspredefinidases", ConfVistasPredefinidas.findConfVistasPredefinidasEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) confVistasPredefinidasService.countAllConfVistasPredefinidases() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("confvistaspredefinidases", ConfVistasPredefinidas.findAllConfVistasPredefinidases(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "confvistaspredefinidases/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ConfVistasPredefinidasController.update(@Valid ConfVistasPredefinidas confVistasPredefinidas, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, confVistasPredefinidas);
            return "confvistaspredefinidases/update";
        }
        uiModel.asMap().clear();
        confVistasPredefinidasService.updateConfVistasPredefinidas(confVistasPredefinidas);
        return "redirect:/confvistaspredefinidases/" + encodeUrlPathSegment(confVistasPredefinidas.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ConfVistasPredefinidasController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, confVistasPredefinidasService.findConfVistasPredefinidas(id));
        return "confvistaspredefinidases/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ConfVistasPredefinidasController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ConfVistasPredefinidas confVistasPredefinidas = confVistasPredefinidasService.findConfVistasPredefinidas(id);
        confVistasPredefinidasService.deleteConfVistasPredefinidas(confVistasPredefinidas);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/confvistaspredefinidases";
    }
    
    void ConfVistasPredefinidasController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("confVistasPredefinidas_auditcreation_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("confVistasPredefinidas_auditlastupdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    String ConfVistasPredefinidasController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
