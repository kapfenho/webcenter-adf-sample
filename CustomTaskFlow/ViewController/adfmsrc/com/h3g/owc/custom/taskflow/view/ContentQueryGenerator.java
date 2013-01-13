package com.h3g.owc.custom.taskflow.view;

import java.text.MessageFormat;


public class ContentQueryGenerator {
    String productName = null;
    String platformName = null;
    String vendorName = null;
    
    public static final String CMIS_QUERY_ANNOUNCEMENT = "select * from ora:t:IDC:GlobalProfile where ora:p:xIdcProfile = ''Announcement'' {0} order by ora:p:dInDate DESC";
    public static final String CMIS_QUERY_FILTER = "and {0} LIKE ''{1}''";
    public static final String CMIS_PROPERT_VENDOR = "ora:p:xgsuVendor";
    public static final String CMIS_PROPERT_PLATFORM = "ora:p:xgsuPlatform";
    public static final String CMIS_PROPERT_PRODUCT = "ora:p:xgsuProduct";
    
    
    public ContentQueryGenerator() {
        super();
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public void setPlatformName(String platformName) {
        this.platformName = platformName;
    }

    public String getPlatformName() {
        return platformName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getVendorName() {
        return vendorName;
    }
    
    public String getAnnouncementQuery() {
        String whereStatement =    this.vendorName   != null ? MessageFormat.format(CMIS_QUERY_FILTER, new Object[] {CMIS_PROPERT_VENDOR, this.vendorName})
                                :  this.platformName != null ? MessageFormat.format(CMIS_QUERY_FILTER, new Object[] {CMIS_PROPERT_PLATFORM, this.platformName})
                                :  this.productName  != null ? MessageFormat.format(CMIS_QUERY_FILTER, new Object[] {CMIS_PROPERT_PRODUCT, this.productName})
                                :  "";
        return MessageFormat.format(CMIS_QUERY_ANNOUNCEMENT, 
                                    new Object[] {whereStatement});
    }
    
    public String getVendorQuery() {
        return null;
    }
    
    public String getProductQuery() {
        return null;
    }
    
    public String fireQueryRefreshedEvent() {
        String newQuery = this.getAnnouncementQuery();
        System.out.println("Query refreshed to: " + newQuery);
        return newQuery;
    }
}
