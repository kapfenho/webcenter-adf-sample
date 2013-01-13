package com.h3g.owc.custom.taskflow.view.pagebacking;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import oracle.adf.model.BindingContext;

import oracle.binding.BindingContainer;
import oracle.binding.OperationBinding;


public class CommonPageBacking {
  public CommonPageBacking() {
    super();
  }

  public void deleteAndCommit(ActionEvent actionEvent) {
    BindingContainer bindings = (BindingContainer)BindingContext.getCurrent().getCurrentBindingsEntry();

    OperationBinding operationBinding = bindings.getOperationBinding("Delete");
    Object result = operationBinding.execute();

    if (!operationBinding.getErrors().isEmpty()) 
      listErrors(operationBinding.getErrors());
    else {
      operationBinding = bindings.getOperationBinding("Commit");
      result = operationBinding.execute();
      
      System.out.println("Commit result : " + result);

      if (!operationBinding.getErrors().isEmpty()) {
        System.out.println("Commit not possible!");
        listErrors(operationBinding.getErrors());
        operationBinding = bindings.getOperationBinding("Rollback");
        operationBinding.execute();
      }
    }
  }
  
  private void listErrors(List<Throwable> exceptionList) {
    for (Throwable t : exceptionList)
    {
      System.out.println(t.getMessage());
      FacesContext context = FacesContext.getCurrentInstance();
      context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Delete not possible", "Received error: " + t.getMessage()));
    }
  }
}
