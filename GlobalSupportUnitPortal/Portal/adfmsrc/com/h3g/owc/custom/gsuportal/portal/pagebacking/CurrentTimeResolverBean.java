package com.h3g.owc.custom.gsuportal.portal.pagebacking;

import java.util.Calendar;

public class CurrentTimeResolverBean {
  public CurrentTimeResolverBean() {
    super();
  }
  
  public Calendar currentCalendar = Calendar.getInstance();

  public Calendar getCurrentCalendar() {
    return currentCalendar;
  }
}
