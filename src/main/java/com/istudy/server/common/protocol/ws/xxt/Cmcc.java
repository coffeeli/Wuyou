package com.istudy.server.common.protocol.ws.xxt;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;

/**
 * This class was generated by Apache CXF 2.7.8
 * 2014-01-16T15:46:31.166+08:00
 * Generated source version: 2.7.8
 * 
 */
@WebService(targetNamespace = "http://www.cmcc.com/edu/", name = "cmcc")
@XmlSeeAlso({ObjectFactory.class})
@SOAPBinding(parameterStyle = SOAPBinding.ParameterStyle.BARE)
public interface Cmcc {

    @WebResult(name = "Response", targetNamespace = "http://www.cmcc.com/edu/", partName = "parameters")
    @WebMethod(operationName = "EDU", action = "http://www.cmcc.com/edu/EDU")
    public Response edu(
        @WebParam(partName = "parameters", name = "Request", targetNamespace = "http://www.cmcc.com/edu/")
        Request parameters
    );
}