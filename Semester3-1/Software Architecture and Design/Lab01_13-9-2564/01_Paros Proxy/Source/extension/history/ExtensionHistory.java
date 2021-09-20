/*
 *
 * Paros and its related class files.
 * 
 * Paros is an HTTP/HTTPS proxy for assessing web application security.
 * Copyright (C) 2003-2004 Chinotec Technologies Company
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the Clarified Artistic License
 * as published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * Clarified Artistic License for more details.
 * 
 * You should have received a copy of the Clarified Artistic License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
package org.parosproxy.paros.extension.history;

import java.awt.EventQueue;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JCheckBoxMenuItem;
import javax.swing.JOptionPane;

import org.parosproxy.paros.control.Control;
import org.parosproxy.paros.control.Proxy;
import org.parosproxy.paros.core.proxy.CacheProcessingItem;
import org.parosproxy.paros.extension.ExtensionAdaptor;
import org.parosproxy.paros.extension.ExtensionHook;
import org.parosproxy.paros.extension.ExtensionHookView;
import org.parosproxy.paros.extension.SessionChangedListener;
import org.parosproxy.paros.model.HistoryList;
import org.parosproxy.paros.model.HistoryReference;
import org.parosproxy.paros.model.Session;
import org.parosproxy.paros.network.HttpHeader;
import org.parosproxy.paros.network.HttpMessage;
import org.parosproxy.paros.network.HttpRequestHeader;

/**
 *
 * To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Generation - Code and Comments
 */
public class ExtensionHistory extends ExtensionAdaptor implements SessionChangedListener {

    private static final int FILTER_NONE = 0;
    private static final int FILTER_REQUEST = 1;
    private static final int FILTER_RESPONSE = 2;
    
	private LogPanel logPanel = null;  //  @jve:decl-index=0:visual-constraint="161,134"
	private ProxyListenerLog proxyListener = null;
	private HistoryList historyList = null;
    private String filter = "";
    
    private EmbeddedBrowser browser = null;
    private static BrowserDialog browserDialog = null;
    	
	private HistoryFilterDialog filterDialog = null;
	private JCheckBoxMenuItem menuFilterHistoryByRequest = null;  //  @jve:decl-index=0:visual-constraint="68,100"
	private JCheckBoxMenuItem menuFilterHistoryByResponse = null;
	private int stateFilter = FILTER_NONE;

	
	private PopupMenuDeleteHistory popupMenuDeleteHistory = null;
	private PopupMenuPurgeHistory popupMenuPurgeHistory = null;
	private PopupMenuResend popupMenuResend = null;
	private ManualRequestEditorDialog resendDialog = null;
	

	private PopupMenuExportMessage popupMenuExportMessage = null;
	private PopupMenuExportMessage popupMenuExportMessage2 = null;
    private PopupMenuExportResponse popupMenuExportResponse = null;
    private PopupMenuExportResponse popupMenuExportResponse2 = null;
    private PopupMenuEmbeddedBrowser popupMenuEmbeddedBrowser = null;
    private PopupMenuEmbeddedBrowser popupMenuEmbeddedBrowser2 = null;
    private PopupMenuTag popupMenuTag = null;
    
    /**
     * 
     */
    public ExtensionHistory() {
        super();
 		initialize();
    }

    /**
     * @param name
     */
    public ExtensionHistory(String name) {
        super(name);
    }

	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private void initialize() {
        this.setName("ExtensionHistory");
			
	}
	
	/**
	 * This method initializes logPanel	
	 * 	
	 * @return com.proofsecure.paros.extension.history.LogPanel	
	 */    
	LogPanel getLogPanel() {
		if (logPanel == null) {
			logPanel = new LogPanel();
			logPanel.setName("History");
            logPanel.setExtension(this);
		}
		return logPanel;
	}
	public void hook(ExtensionHook extensionHook) {
	    super.hook(extensionHook);
        extensionHook.addSessionListener(this);
        extensionHook.addProxyListener(getProxyListenerLog());

	    if (getView() != null) {
		    ExtensionHookView pv = extensionHook.getHookView();
		    pv.addStatusPanel(getLogPanel());
		    //pv.addWorkPanel(getRequestPanel());
		    //pv.addWorkPanel(getResponsePanel());
		    getLogPanel().setDisplayPanel(getView().getRequestPanel(), getView().getResponsePanel());
		    

//            extensionHook.getHookMenu().addViewMenuItem(getPopupMenuEmbeddedBrowser2());
            extensionHook.getHookMenu().addViewMenuItem(extensionHook.getHookMenu().getMenuSeparator());
	        extensionHook.getHookMenu().addViewMenuItem(getMenuFilterHistoryByRequest());
	        extensionHook.getHookMenu().addViewMenuItem(getMenuFilterHistoryByResponse());

	        extensionHook.getHookMenu().addPopupMenuItem(getPopupMenuResend());
            extensionHook.getHookMenu().addPopupMenuItem(getPopupMenuTag());

            extensionHook.getHookMenu().addPopupMenuItem(getPopupMenuEmbeddedBrowser());

//	        extensionHook.getHookMenu().addPopupMenuItem(getPopupMenuExportMessage());
//          extensionHook.getHookMenu().addPopupMenuItem(getPopupMenuExportResponse());

	        extensionHook.getHookMenu().addPopupMenuItem(getPopupMenuDeleteHistory());
	        extensionHook.getHookMenu().addPopupMenuItem(getPopupMenuPurgeHistory());

	        // same as PopupMenuExport but for File menu
	        extensionHook.getHookMenu().addFileMenuItem(getPopupMenuExportMessage2());
            extensionHook.getHookMenu().addFileMenuItem(getPopupMenuExportResponse2());

            if (isEnableForNativePlatform()) {
                // preload for faster loading
                getBrowserDialog();
            }
	    }

	}
	
	public void sessionChanged(final Session session)  {
	    if (EventQueue.isDispatchThread()) {
		    sessionChangedEventHandler(session);

	    } else {
	        
	        try {
	            EventQueue.invokeAndWait(new Runnable() {
	                public void run() {
	        		    sessionChangedEventHandler(session);
	                }
	            });
	        } catch (Exception e) {
	            
	        }
	    }

	    
	}
	
	private void sessionChangedEventHandler(Session session) {
	    

	    getHistoryList().clear();
	    getLogPanel().getListLog().setModel(getHistoryList());
		getView().getRequestPanel().setMessage("","", true);
		getView().getResponsePanel().setMessage("","", false);

		try {
		    List list = getModel().getDb().getTableHistory().getHistoryList(session.getSessionId(), HistoryReference.TYPE_MANUAL);

		    buildHistory(getHistoryList(), list);
		} catch (SQLException e) {}
	    
	}
	
	
	private ProxyListenerLog getProxyListenerLog() {
        if (proxyListener == null) {
            proxyListener = new ProxyListenerLog(getModel(), getView(), getHistoryList());
        }
        return proxyListener;
	}
	
	public HistoryList getHistoryList() {
	    if (historyList == null) {
	        historyList = new HistoryList();
	    }
	    return historyList;
	}
	
	private void searchHistory(String filter, boolean isRequest) {
	    Session session = getModel().getSession();
        
	    synchronized (historyList) {
	        try {
	            List list = getModel().getDb().getTableHistory().getHistoryList(session.getSessionId(), HistoryReference.TYPE_MANUAL, filter, isRequest);
	            
	            buildHistory(getHistoryList(), list);
	        } catch (SQLException e) {}
	    }

	    
	}
	
	private void buildHistory(HistoryList historyList, List dbList) {

	    HistoryReference historyRef = null;
	    synchronized (historyList) {
	        historyList.clear();
	        
	        for (int i=0; i<dbList.size(); i++) {
	            int historyId = ((Integer) dbList.get(i)).intValue();

	            try {
	                    historyRef = new HistoryReference(historyId);
	                    historyList.addElement(historyRef);
	            } catch (Exception e) {};
	        }
	    }

   }
	/**
	 * This method initializes filterDialog	
	 * 	
	 * @return com.proofsecure.paros.extension.history.SearchDialog	
	 */    
	private HistoryFilterDialog getFilterDialog() {
		if (filterDialog == null) {
			filterDialog = new HistoryFilterDialog(getView().getMainFrame(), true);
		}
		return filterDialog;
	}
	/**
	 * This method initializes menuFilterHistoryByRequest	
	 * 	
	 * @return javax.swing.JMenuItem	
	 */    
	private JCheckBoxMenuItem getMenuFilterHistoryByRequest() {
		if (menuFilterHistoryByRequest == null) {
			menuFilterHistoryByRequest = new JCheckBoxMenuItem();
			menuFilterHistoryByRequest.setText("Filter History by Request...");
			menuFilterHistoryByRequest.addActionListener(new java.awt.event.ActionListener() { 

				public void actionPerformed(java.awt.event.ActionEvent e) {    

				    int result = showFilterDialog(true);
				    switch(result)
				    {
				    case -1:	menuFilterHistoryByRequest.setSelected(false);
				    			menuFilterHistoryByResponse.setSelected(false);
				    			stateFilter = FILTER_NONE;
				    			break;
				    case 0:		menuFilterHistoryByRequest.setSelected(false);
				    			menuFilterHistoryByResponse.setSelected(false);
				        		if (stateFilter == FILTER_REQUEST) {
				        			menuFilterHistoryByRequest.setSelected(true);
				        		} else if (stateFilter == FILTER_RESPONSE) {
				        		    menuFilterHistoryByResponse.setSelected(true);
				        		}
				        		break;
				    case 1:		menuFilterHistoryByRequest.setSelected(true);
				    			menuFilterHistoryByResponse.setSelected(false);
				    			stateFilter = FILTER_REQUEST;
				    			break;
				    }
				}
			});

		}
		return menuFilterHistoryByRequest;
	}
	
	private int showFilterDialog(boolean isRequest) {
		HistoryFilterDialog dialog = getFilterDialog();
		dialog.setModal(true);
		int exit = dialog.showDialog();
		int result = 0;		// cancel, state unchanged
		if (exit == JOptionPane.OK_OPTION) {
		    filter = dialog.getPattern();
		    getProxyListenerLog().setFilter(filter);
		    searchHistory(filter, isRequest);
		    result = 1;		// applied
		    
		} else if (exit == JOptionPane.NO_OPTION) {
		    filter = "";
		    getProxyListenerLog().setFilter(filter);
		    searchHistory(filter, isRequest);
		    result = -1;	// reset
		}
		
		return result;
	}
	
	/**
	 * This method initializes menuFilterHistoryByResponse	
	 * 	
	 * @return javax.swing.JMenuItem	
	 */    
	private JCheckBoxMenuItem getMenuFilterHistoryByResponse() {
		if (menuFilterHistoryByResponse == null) {
			menuFilterHistoryByResponse = new JCheckBoxMenuItem();
			menuFilterHistoryByResponse.setText("Filter History by Response...");
			menuFilterHistoryByResponse.addActionListener(new java.awt.event.ActionListener() { 
				public void actionPerformed(java.awt.event.ActionEvent e) {
				    int result = showFilterDialog(false);
				    switch(result) {
			    case -1:	menuFilterHistoryByRequest.setSelected(false);
			    			menuFilterHistoryByResponse.setSelected(false);
			    			stateFilter = FILTER_NONE;
			    			break;

			    case 0:		menuFilterHistoryByRequest.setSelected(false);
			    			menuFilterHistoryByResponse.setSelected(false);
			        		if (stateFilter == FILTER_REQUEST) {
			        			menuFilterHistoryByRequest.setSelected(true);
			        		} else if (stateFilter == FILTER_RESPONSE) {
			        		    menuFilterHistoryByResponse.setSelected(true);
			        		}
			        		break;
			    case 1:		menuFilterHistoryByRequest.setSelected(false);
			    			menuFilterHistoryByResponse.setSelected(true);
			    			stateFilter = FILTER_RESPONSE;
			    			break;
			    }

				}
			});
		}
		return menuFilterHistoryByResponse;
	}
	/**
	 * This method initializes popupMenuDeleteHistory	
	 * 	
	 * @return org.parosproxy.paros.extension.history.PopupMenuDeleteHistory	
	 */    
	private PopupMenuDeleteHistory getPopupMenuDeleteHistory() {
		if (popupMenuDeleteHistory == null) {
			popupMenuDeleteHistory = new PopupMenuDeleteHistory();
			popupMenuDeleteHistory.setExtension(this);
		}
		return popupMenuDeleteHistory;
	}
	/**
	 * This method initializes popupMenuPurgeHistory	
	 * 	
	 * @return org.parosproxy.paros.extension.history.PopupMenuPurgeHistory	
	 */    
	private PopupMenuPurgeHistory getPopupMenuPurgeHistory() {
		if (popupMenuPurgeHistory == null) {
			popupMenuPurgeHistory = new PopupMenuPurgeHistory();
			popupMenuPurgeHistory.setExtension(this);

		}
		return popupMenuPurgeHistory;
	}
	/**
	 * This method initializes popupMenuResend	
	 * 	
	 * @return org.parosproxy.paros.extension.history.PopupMenuResend	
	 */    
	private PopupMenuResend getPopupMenuResend() {
		if (popupMenuResend == null) {
			popupMenuResend = new PopupMenuResend();
			popupMenuResend.setExtension(this);
		}
		return popupMenuResend;
	}
	/**
	 * This method initializes resendDialog	
	 * 	
	 * @return org.parosproxy.paros.extension.history.ResendDialog	
	 */    
	ManualRequestEditorDialog getResendDialog() {
		if (resendDialog == null) {
			resendDialog = new ManualRequestEditorDialog(getView().getMainFrame(), false, false, this);
			resendDialog.setSize(500, 600);
			resendDialog.setTitle("Resend");
		}
		return resendDialog;
	}
	
	/**
	 * This method initializes popupMenuExport	
	 * 	
	 * @return org.parosproxy.paros.extension.history.PopupMenuExport	
	 */    
	private PopupMenuExportMessage getPopupMenuExportMessage() {
		if (popupMenuExportMessage == null) {
			popupMenuExportMessage = new PopupMenuExportMessage();
			popupMenuExportMessage.setExtension(this);

		}
		return popupMenuExportMessage;
	}
	/**
	 * This method initializes popupMenuExport1	
	 * 	
	 * @return org.parosproxy.paros.extension.history.PopupMenuExport	
	 */    
	private PopupMenuExportMessage getPopupMenuExportMessage2() {
		if (popupMenuExportMessage2 == null) {
			popupMenuExportMessage2 = new PopupMenuExportMessage();
			popupMenuExportMessage2.setExtension(this);
		}
		return popupMenuExportMessage2;
	}

    /**
     * This method initializes popupMenuExportResponse	
     * 	
     * @return org.parosproxy.paros.extension.history.PopupMenuExportResponse	
     */
    private PopupMenuExportResponse getPopupMenuExportResponse() {
        if (popupMenuExportResponse == null) {
            popupMenuExportResponse = new PopupMenuExportResponse();
            popupMenuExportResponse.setExtension(this);
        }
        return popupMenuExportResponse;
    }

    /**
     * This method initializes popupMenuExportResponse2	
     * 	
     * @return org.parosproxy.paros.extension.history.PopupMenuExportResponse	
     */
    private PopupMenuExportResponse getPopupMenuExportResponse2() {
        if (popupMenuExportResponse2 == null) {
            popupMenuExportResponse2 = new PopupMenuExportResponse();
            popupMenuExportResponse2.setExtension(this);

        }
        return popupMenuExportResponse2;
    }

    /**
     * This method initializes popupMenuEmbeddedBrowser	
     * 	
     * @return org.parosproxy.paros.extension.history.PopupMenuEmbeddedBrowser	
     */
    private PopupMenuEmbeddedBrowser getPopupMenuEmbeddedBrowser() {
        if (popupMenuEmbeddedBrowser == null) {
            popupMenuEmbeddedBrowser = new PopupMenuEmbeddedBrowser();
            popupMenuEmbeddedBrowser.setExtension(this);

        }
        return popupMenuEmbeddedBrowser;
    }

    /**
     * This method initializes popupMenuEmbeddedBrowser2	
     * 	
     * @return org.parosproxy.paros.extension.history.PopupMenuEmbeddedBrowser	
     */
    private PopupMenuEmbeddedBrowser getPopupMenuEmbeddedBrowser2() {
        if (popupMenuEmbeddedBrowser2 == null) {
            popupMenuEmbeddedBrowser2 = new PopupMenuEmbeddedBrowser();
            popupMenuEmbeddedBrowser2.setExtension(this);

        }
        return popupMenuEmbeddedBrowser2;
    }

    private PopupMenuTag getPopupMenuTag() {
        if (popupMenuTag == null) {
            popupMenuTag = new PopupMenuTag();
            popupMenuTag.setExtension(this);

        }
        return popupMenuTag;
    }
    
    boolean browserDisplay(HistoryReference ref, HttpMessage msg) {
        
        boolean isShow = false;
        String contentType = msg.getResponseHeader().getHeader(HttpHeader.CONTENT_TYPE);
        if (contentType != null) {
            if (contentType.indexOf("text/html") >= 0 || contentType.indexOf("text/plain") >= 0) {
                isShow = true;
            } else if (msg.getResponseHeader().isImage()) {
                isShow = true;
            } else if (contentType.indexOf("application/pdf") >= 0)  {
                isShow = true;
            }
        }

        if (!isShow) {
            return isShow;
        }
        
        try {
            if (!getBrowserDialog().isVisible()) {
                getBrowserDialog().setVisible(true);
            }
            
            browser = getBrowserDialog().getEmbeddedBrowser();
            browser.stop();
            browser.setVisible(true);
            CacheProcessingItem item = new CacheProcessingItem(ref, msg);
            Proxy proxy = Control.getSingleton().getProxy();
            proxy.setEnableCacheProcessing(true);
            proxy.addCacheProcessingList(item);
            
            getBrowserDialog().setURLTitle(msg.getRequestHeader().getURI().toString());
            if (msg.getRequestHeader().getMethod().equalsIgnoreCase(HttpRequestHeader.POST)) {
                browser.setURL(new java.net.URL(msg.getRequestHeader().getURI().toString()), msg.getRequestBody().toString());
            } else {
                browser.setURL(new java.net.URL(msg.getRequestHeader().getURI().toString()));
            }
        } catch (Exception e) {
            
        }
        
        return isShow;
    }
    
    /**
     * This method initializes browserDialog    
     *  
     * @return org.parosproxy.paros.extension.history.BrowserDialog 
     */
    BrowserDialog getBrowserDialog() {
        if (browserDialog == null) {
            browserDialog = new BrowserDialog(getView().getMainFrame(), false);
        }
        return browserDialog;
    }
    
    private static Pattern patternWindows = Pattern.compile("window", Pattern.CASE_INSENSITIVE);
//  private static Pattern patternLinux = Pattern.compile("linux", Pattern.CASE_INSENSITIVE);

    static boolean isEnableForNativePlatform() {
      String os_name = System.getProperty("os.name");
      Matcher matcher = patternWindows.matcher(os_name);
      if (matcher.find()) {
          return true;
      }
      
      return false;

  }  
         }
