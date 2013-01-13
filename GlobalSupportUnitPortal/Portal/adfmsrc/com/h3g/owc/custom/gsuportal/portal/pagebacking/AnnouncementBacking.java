package com.h3g.owc.custom.gsuportal.portal.pagebacking;


import com.h3g.owc.custom.taskflow.view.ContentQueryGenerator;

import java.text.MessageFormat;

public class AnnouncementBacking {
    String currentQueryString = MessageFormat.format(ContentQueryGenerator.CMIS_QUERY_ANNOUNCEMENT, "");
    
    public AnnouncementBacking() {
        super();
    }

    public void setCurrentQueryString(String currentQueryString) {
        this.currentQueryString = currentQueryString;
    }

    public String getCurrentQueryString() {
        return currentQueryString;
    }
}
