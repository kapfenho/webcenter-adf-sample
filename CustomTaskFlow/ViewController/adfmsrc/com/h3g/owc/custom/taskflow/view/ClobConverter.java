package com.h3g.owc.custom.taskflow.view;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

import javax.faces.convert.ConverterException;

import oracle.jbo.domain.ClobDomain;


public class ClobConverter implements Converter {
    public ClobConverter() {
        super();
    }

    public Object getAsObject(FacesContext context,
                              UIComponent component, String value) {
        if (context == null || component == null) {
            throw new NullPointerException("FacesContext and UIComponent can not be null");
        }

        if (value == null) {
            return null;
        }
        try {
            return new ClobDomain(value);
        } catch (Exception ex) {
            final String message =
                String.format("Unable to convert boolean value \"%s\" into a oracle.jbo.domain.Number",
                              value);
            throw new ConverterException(message, ex);
        }
    }

    public String getAsString(FacesContext context,
                              UIComponent component, Object value) {
        if (context == null || component == null) {
            throw new NullPointerException("FacesContext and UIComponent can not be null");
        }
        return value.toString();
    }
}
