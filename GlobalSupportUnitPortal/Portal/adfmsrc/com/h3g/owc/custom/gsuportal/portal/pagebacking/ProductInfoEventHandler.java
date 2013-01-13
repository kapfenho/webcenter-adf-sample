package com.h3g.owc.custom.gsuportal.portal.pagebacking;

import javax.faces.context.FacesContext;

public class ProductInfoEventHandler {
  public ProductInfoEventHandler() {
    super();
  }


  public void handleProductChangedEvent(String newProductName) {
      System.out.println("Refreshing ProductInfoBacking productName to: " + newProductName);
      FacesContext ctx = FacesContext.getCurrentInstance();
      ProductInfoBacking backing = (ProductInfoBacking)ctx.getApplication().evaluateExpressionGet(ctx, "#{viewScope.productInfoBacking}", ProductInfoBacking.class);
      if (backing != null) {
          backing.setProductName(newProductName);
      } else {
          System.out.println("EL expression evaluates to null, could not update ProductInfoBacking!");
      }
      // TODO : force Content Presenter refresh?
  }
}
