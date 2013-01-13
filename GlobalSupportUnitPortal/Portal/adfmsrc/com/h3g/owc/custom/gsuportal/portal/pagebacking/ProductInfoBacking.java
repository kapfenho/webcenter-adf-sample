package com.h3g.owc.custom.gsuportal.portal.pagebacking;

public class ProductInfoBacking {
  String productName = null;
  
  public ProductInfoBacking() {
    super();
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public String getProductName() {
    return productName;
  }
  
  public static final String QUERY_BASE = "select * from ora:t:IDC:GlobalProfile where ora:p:xIdcProfile = ''Product''";
  
  public String getContentQuery() {
    String result = productName == null 
            ?  QUERY_BASE 
            :  QUERY_BASE + " and ora:p:xgsuProduct LIKE ''" + productName +  "''" ;
    
    System.out.println(result);
    
    return result;
  }
}
