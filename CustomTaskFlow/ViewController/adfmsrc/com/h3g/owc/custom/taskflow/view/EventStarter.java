package com.h3g.owc.custom.taskflow.view;

import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

import oracle.adf.model.binding.DCBindingContainer;

import oracle.binding.BindingContainer;

import oracle.jbo.uicli.binding.JUCtrlActionBinding;
import oracle.jbo.uicli.binding.JUEventBinding;

public class EventStarter {
    public EventStarter() {
        super();
    }
    /*
     * devguide_11115.pdf, page 1015 --> manually creating events
    public Object myActionPerformed() {
    // Add event code here...
    }
    }
     */

    public void valueChange(ValueChangeEvent valueChangeEvent) {
        System.out.println("Invoking Contextual Event... NOT");

        FacesContext fc = FacesContext.getCurrentInstance();
        BindingContainer bc =
        (BindingContainer)fc.getApplication().evaluateExpressionGet(fc,
        "#{bindings}",
        BindingContainer.class);
        JUEventBinding jeb = (JUEventBinding)bc.getControlBinding("eventBinding");
        jeb.getListener();
/*
        JUCtrlActionBinding actionBnd = (JUCtrlActionBinding)bc.getControlBinding("eventBinding");
        ((DCBindingContainer)bc).getEventDispatcher().queueEvent(actionBnd.
        getEventProducer(),"Hello world!");
        ((DCBindingContainer)bc).getEventDispatcher().processContextualEvents();
        */
    }
}
