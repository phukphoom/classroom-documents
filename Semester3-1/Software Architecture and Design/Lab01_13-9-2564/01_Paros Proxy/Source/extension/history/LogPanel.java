/*
 * Created on 2004¦~7¤ë4¤é
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

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.InputEvent;
import java.util.Vector;

import org.parosproxy.paros.extension.AbstractPanel;
import org.parosproxy.paros.model.HistoryReference;
import org.parosproxy.paros.network.HttpHeader;
import org.parosproxy.paros.network.HttpMessage;
import org.parosproxy.paros.network.HttpStatusCode;
import org.parosproxy.paros.view.HttpPanel;
import org.parosproxy.paros.view.View;

/**
 *
 * To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Generation - Code and Comments
 */
public class LogPanel extends AbstractPanel implements Runnable {
	private javax.swing.JScrollPane scrollLog = null;
	private javax.swing.JList listLog = null;
	
	private HttpPanel requestPanel = null;
	private HttpPanel responsePanel = null;
    private ExtensionHistory extension = null;
	
	/**
	 * This is the default constructor
	 */
	public LogPanel() {
		super();
		initialize();
	}
	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private  void initialize() {
		this.setLayout(new BorderLayout());
		this.setSize(600, 200);
		this.add(getScrollLog(), java.awt.BorderLayout.CENTER);
	}
    
    void setExtension(ExtensionHistory extension) {
        this.extension = extension;
    }
    
	/**

	 * This method initializes scrollLog	

	 * 	

	 * @return javax.swing.JScrollPane	

	 */    
	private javax.swing.JScrollPane getScrollLog() {
		if (scrollLog == null) {
			scrollLog = new javax.swing.JScrollPane();
			scrollLog.setViewportView(getListLog());
			scrollLog.setHorizontalScrollBarPolicy(javax.swing.JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
			scrollLog.setVerticalScrollBarPolicy(javax.swing.JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
			scrollLog.setPreferredSize(new java.awt.Dimension(800,200));
			scrollLog.setName("scrollLog");
		}
		return scrollLog;
	}

	/**

	 * This method initializes listLog	

	 * 	

	 * @return javax.swing.JList	

	 */    
	public javax.swing.JList getListLog() {
		if (listLog == null) {
			listLog = new javax.swing.JList();
			listLog.setDoubleBuffered(true);
            listLog.setCellRenderer(getLogPanelCellRenderer());
			listLog.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_INTERVAL_SELECTION);
			listLog.setName("ListLog");
			listLog.setFont(new java.awt.Font("Default", java.awt.Font.PLAIN, 12));
			listLog.addMouseListener(new java.awt.event.MouseAdapter() { 
				public void mousePressed(java.awt.event.MouseEvent e) {    
				    if ((e.getModifiers() & InputEvent.BUTTON3_MASK) != 0) {  // right mouse button
				        View.getSingleton().getPopupMenu().show(e.getComponent(), e.getX(), e.getY());
				        return;
				    }	
				    
				    if ((e.getModifiers() & InputEvent.BUTTON1_MASK) != 0 && e.getClickCount() > 1) {  // double click
						requestPanel.setTabFocus();
						return;
				    }
				}
			});
			
			listLog.addListSelectionListener(new javax.swing.event.ListSelectionListener() { 

				public void valueChanged(javax.swing.event.ListSelectionEvent e) {
				    if (listLog.getSelectedValue() == null) {
				        return;
				    }
                    
					final HistoryReference historyRef = (HistoryReference) listLog.getSelectedValue();

                    readAndDisplay(historyRef);

				}


			});

		}
		return listLog;
	}
	
//    private void readAndDisplay(HistoryReference historyRef) {
//
//        HttpMessage msg = null;
//        try {
//            msg = historyRef.getHttpMessage();
//            if (msg.getRequestHeader().isEmpty()) {
//                requestPanel.setMessage(null, true);
//            } else {
//                requestPanel.setMessage(msg, true);
//            }
//            
//            if (msg.getResponseHeader().isEmpty()) {
//                responsePanel.setMessage(null, false);
//            } else {
//                responsePanel.setMessage(msg, false);
//            }
//        } catch (Exception e1) {
//            e1.printStackTrace();
//        }
//        
//    }

    

    
    private Vector displayQueue = new Vector();
    private Thread thread = null;
    private LogPanelCellRenderer logPanelCellRenderer = null;  //  @jve:decl-index=0:visual-constraint="10,304"
    
    private void readAndDisplay(final HistoryReference historyRef) {

        synchronized(displayQueue) {
            if (!ExtensionHistory.isEnableForNativePlatform() || !extension.getBrowserDialog().isVisible()) {
                // truncate queue if browser dialog is displayed to have better response
                if (displayQueue.size()>0) {
                    // replace all display queue because the newest display overrides all previous one
                    // pending to be rendered.
                    displayQueue.clear();
                }
            }
            displayQueue.add(historyRef);

        }
        
        if (thread != null && thread.isAlive()) {
            return;
        }
        
        thread = new Thread(this);

        thread.setPriority(Thread.NORM_PRIORITY);
        thread.start();
    }
    
    
    public void setDisplayPanel(HttpPanel requestPanel, HttpPanel responsePanel) {
        this.requestPanel = requestPanel;
        this.responsePanel = responsePanel;

    }
    
    private void displayMessage(HttpMessage msg) {
        
        if (msg.getRequestHeader().isEmpty()) {
            requestPanel.setMessage(null, true);
        } else {
            requestPanel.setMessage(msg, true);
        }
        
        if (msg.getResponseHeader().isEmpty()) {
            responsePanel.setMessage(null, false);
        } else {
            responsePanel.setMessage(msg, false);
        }
    }

    public void run() {
        HistoryReference ref = null;
        int count = 0;
        
        do {
            synchronized(displayQueue) {
                count = displayQueue.size();
                if (count == 0) {
                    break;
                }
                
                ref = (HistoryReference) displayQueue.get(0);
                displayQueue.remove(0);
            }
            
            try {
                final HistoryReference finalRef = ref;
                final HttpMessage msg = ref.getHttpMessage();
                EventQueue.invokeAndWait(new Runnable() {
                    public void run() {
                        displayMessage(msg);
                        checkAndShowBrowser(finalRef, msg);
                        listLog.requestFocus();

                    }
                });
                
            } catch (Exception e1) {
                e1.printStackTrace();
            }
            
            // wait some time to allow another selection event to be triggered
            try {
                Thread.sleep(200);
            } catch (Exception e) {}
        } while (true);
        
        
    }
    
    private void checkAndShowBrowser(HistoryReference ref, HttpMessage msg) {
        if (!ExtensionHistory.isEnableForNativePlatform() || !extension.getBrowserDialog().isVisible()) {
            return;
        }
        
        extension.browserDisplay(ref, msg);
    }
    /**
     * This method initializes logPanelCellRenderer	
     * 	
     * @return org.parosproxy.paros.extension.history.LogPanelCellRenderer	
     */
    private LogPanelCellRenderer getLogPanelCellRenderer() {
        if (logPanelCellRenderer == null) {
            logPanelCellRenderer = new LogPanelCellRenderer();
            logPanelCellRenderer.setSize(new java.awt.Dimension(328,21));
            logPanelCellRenderer.setBackground(java.awt.Color.white);
            logPanelCellRenderer.setFont(new java.awt.Font("MS Sans Serif", java.awt.Font.PLAIN, 12));
        }
        return logPanelCellRenderer;
    }

    
}

