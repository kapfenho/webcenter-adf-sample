package com.h3g.owc.custom.gsuportal.portal.pagebacking;

import javax.faces.context.FacesContext;

public class AnnouncementEventHandler {
    public AnnouncementEventHandler() {
        super();
    }

    public void handleAnnouncementQueryRefreshEvent(String newQuery) {
        System.out.println("Refreshing AnnouncementBacking currentQueryString to: " + newQuery);
        FacesContext ctx = FacesContext.getCurrentInstance();
        AnnouncementBacking backing = (AnnouncementBacking)ctx.getApplication().evaluateExpressionGet(ctx, "#{viewScope.announcementBacking}", AnnouncementBacking.class);
        if (backing != null) {
            backing.setCurrentQueryString(newQuery);
        } else {
            System.out.println("EL expression evaluates to null, could not update announcementBacking!");
        }
        // TODO : force Content Presenter refresh?
    }
}
