package com.h3g.owc.custom.taskflow.view;

public class BasicEventConsumer {
    public BasicEventConsumer() {
        super();
    }
    
    public void consumeEvent(String parameter) {
        System.out.println("Consuming event with param: " + parameter);
    }
}
