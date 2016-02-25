/*******************************************************************************
 * gvGeoportal is sponsored by the General Directorate for Information
 * Technologies (DGTI) of the Regional Ministry of Finance and Public
 * Administration of the Generalitat Valenciana (Valencian Community,
 * Spain), managed by gvSIG Association and led by DISID Corporation.
 * 
 * Copyright (C) 2016 DGTI - Generalitat Valenciana
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************/
package es.gva.dgti.gvgeoportal.security;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.cxf.binding.soap.SoapMessage;
import org.apache.cxf.headers.Header;
import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.ws.security.wss4j.WSS4JOutInterceptor;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class ExtLoadWSS4JOutInterceptor extends WSS4JOutInterceptor {

    private String traceabilityId;

    private static final Logger LOGGER = Logger
            .getLogger(ExtLoadWSS4JOutInterceptor.class);

    public ExtLoadWSS4JOutInterceptor() {
        super();
    }

    public ExtLoadWSS4JOutInterceptor(Map<String, Object> props) {
        super(props);
    }

    public String getTraceabilityId() {
        return traceabilityId;
    }

    public void setTraceabilityId(String traceabilityId) {
        this.traceabilityId = traceabilityId;
    }

    @Override
    public void handleMessage(SoapMessage mc) throws Fault {
        // Create Header object (Id_trazabilidad)
        DocumentBuilder builder = null;
        try {
            builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document doc = builder.newDocument();
            Element idTrazabilidad = doc.createElement("Id_trazabilidad");
            idTrazabilidad.setAttribute("xmlns",
                    "http://dgti.gva.es/interoperabilidad");

            Calendar nowDate = Calendar.getInstance();
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String nowDateString = format.format(nowDate.getTime());

            idTrazabilidad.appendChild(doc.createTextNode(this.traceabilityId
                    .concat(nowDateString)));
            QName qnameIdTrazabilidad = new QName("Id_trazabilidad");

            Header header = new Header(qnameIdTrazabilidad, idTrazabilidad);
            mc.getHeaders().add(header);
        }
        catch (ParserConfigurationException ex) {
            LOGGER.warn(ex.getLocalizedMessage(), ex);
        }

        super.handleMessage(mc);
    }

}
