// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.gva.dgti.gvgeoportal.web;

import es.gva.dgti.gvgeoportal.domain.SistemaCoordenadas;
import es.gva.dgti.gvgeoportal.service.domain.ServicioWebService;
import es.gva.dgti.gvgeoportal.service.domain.SistemaCoordenadasService;
import es.gva.dgti.gvgeoportal.web.SistemaCoordenadasController;
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

privileged aspect SistemaCoordenadasController_Roo_Controller {
    
    @Autowired
    SistemaCoordenadasService SistemaCoordenadasController.sistemaCoordenadasService;
    
    @Autowired
    ServicioWebService SistemaCoordenadasController.servicioWebService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SistemaCoordenadasController.create(@Valid SistemaCoordenadas sistemaCoordenadas, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sistemaCoordenadas);
            return "sistemacoordenadases/create";
        }
        uiModel.asMap().clear();
        sistemaCoordenadasService.saveSistemaCoordenadas(sistemaCoordenadas);
        return "redirect:/sistemacoordenadases/" + encodeUrlPathSegment(sistemaCoordenadas.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SistemaCoordenadasController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SistemaCoordenadas());
        return "sistemacoordenadases/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SistemaCoordenadasController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("sistemacoordenadas", sistemaCoordenadasService.findSistemaCoordenadas(id));
        uiModel.addAttribute("itemId", id);
        return "sistemacoordenadases/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SistemaCoordenadasController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sistemacoordenadasitems", SistemaCoordenadas.findSistemaCoordenadasEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) sistemaCoordenadasService.countAllSistemaCoordenadas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sistemacoordenadasitems", SistemaCoordenadas.findAllSistemaCoordenadas(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "sistemacoordenadases/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SistemaCoordenadasController.update(@Valid SistemaCoordenadas sistemaCoordenadas, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sistemaCoordenadas);
            return "sistemacoordenadases/update";
        }
        uiModel.asMap().clear();
        sistemaCoordenadasService.updateSistemaCoordenadas(sistemaCoordenadas);
        return "redirect:/sistemacoordenadases/" + encodeUrlPathSegment(sistemaCoordenadas.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SistemaCoordenadasController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, sistemaCoordenadasService.findSistemaCoordenadas(id));
        return "sistemacoordenadases/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SistemaCoordenadasController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SistemaCoordenadas sistemaCoordenadas = sistemaCoordenadasService.findSistemaCoordenadas(id);
        sistemaCoordenadasService.deleteSistemaCoordenadas(sistemaCoordenadas);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sistemacoordenadases";
    }
    
    void SistemaCoordenadasController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("sistemaCoordenadas_auditcreation_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("sistemaCoordenadas_auditlastupdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void SistemaCoordenadasController.populateEditForm(Model uiModel, SistemaCoordenadas sistemaCoordenadas) {
        uiModel.addAttribute("sistemaCoordenadas", sistemaCoordenadas);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("serviciosweb", servicioWebService.findAllServiciosWeb());
    }
    
    String SistemaCoordenadasController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
