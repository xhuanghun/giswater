/*
 * This file is part of Giswater
 * Copyright (C) 2013 Tecnics Associats
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Author:
 *   David Erill <derill@giswater.org>
 */
package org.giswater.gui.panel;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.border.TitledBorder;

import net.miginfocom.swing.MigLayout;

import org.giswater.controller.HecRasController;
import org.giswater.dao.MainDao;
import org.giswater.gui.frame.HecRasFrame;
import org.giswater.util.PropertiesMap;
import org.giswater.util.Utils;


public class HecRasPanel extends JPanel implements ActionListener {

	private static final long serialVersionUID = -2576460232916596200L;
	private static final ResourceBundle BUNDLE = ResourceBundle.getBundle("form"); 

	private HecRasController controller;	
	private HecRasFrame hecRasFrame;
	private JPanel panelFileManager;
	private JButton btnFileAsc;
	private JButton btnLoadRaster;
	private JButton btnExportSdf;
	private JTextArea txtFileAsc;
	private JTextArea txtFileSdf;
	private JButton btnFileSdf;
	private JButton btnClose;

	private static final Font FONT_14 = new Font("Tahoma", Font.BOLD, 14);
	
	
	public HecRasPanel() {
		try {
			initConfig();
		} catch (MissingResourceException e) {
			Utils.showError(e);
			System.exit(ERROR);
		}
	}

	public void setControl(HecRasController nodeController) {
		this.controller = nodeController;
	}

	public HecRasFrame getFrame() {
		return hecRasFrame;
	}

	public void setFrame(HecRasFrame hecRasFrame) {
		this.hecRasFrame = hecRasFrame;
	}

	public JDialog getDialog() {
		return new JDialog();
	}

	
	public void enableButtons(boolean isEnabled) {
		
		txtFileSdf.setEnabled(isEnabled);	
		btnFileSdf.setEnabled(isEnabled);	
		btnExportSdf.setEnabled(isEnabled);
		
		// Check if we have to enable Load Raster button
		PropertiesMap prop = MainDao.getPropertiesFile();
		boolean isLoad = Boolean.parseBoolean(prop.getProperty("LOAD_RASTER", "false"));
		if (isEnabled && isLoad){
			btnLoadRaster.setEnabled(true);
			txtFileAsc.setEnabled(true);
			btnFileAsc.setEnabled(true);
		} 
		else{
			btnLoadRaster.setEnabled(false);
			txtFileAsc.setEnabled(false);
			btnFileAsc.setEnabled(false);
		}
		
	}
	

	public String getFileSdf() {
		String file = txtFileSdf.getText().trim();
		return file;
	}	
	
	public void setFileSdf(String path) {
		txtFileSdf.setText(path);
	}
	
	public String getFileAsc() {
		String file = txtFileAsc.getText().trim();
		return file;
	}	
	
	public void setFileAsc(String path) {
		txtFileAsc.setText(path);
	}	

	
	private void initConfig() throws MissingResourceException {

		setLayout(new MigLayout("", "[5px:n][:572.00px:531px,grow]", "[5px:n][][]"));
		
		panelFileManager = new JPanel();
		panelFileManager.setBorder(new TitledBorder(null, "File manager", TitledBorder.LEADING, TitledBorder.TOP, FONT_14, null));
		add(panelFileManager, "cell 1 1,grow");
		panelFileManager.setLayout(new MigLayout("", "[50px:n][grow][10px:n][][]", "[40px:n][10px:n][40px:n]"));
		
		JLabel lblAscFile_1 = new JLabel();
		panelFileManager.add(lblAscFile_1, "cell 0 0,alignx right");
		lblAscFile_1.setText(BUNDLE.getString("HecRasPanel.lblAscFile_1.text"));
		
		JScrollPane scrollPane_2 = new JScrollPane();
		panelFileManager.add(scrollPane_2, "cell 1 0,grow");
		
		txtFileAsc = new JTextArea();
		scrollPane_2.setViewportView(txtFileAsc);
		txtFileAsc.setLineWrap(true);
		txtFileAsc.setFont(new Font("Tahoma", Font.PLAIN, 11));
		
		btnFileAsc = new JButton();
		panelFileManager.add(btnFileAsc, "cell 3 0");
		btnFileAsc.setActionCommand("chooseFileAsc");
		btnFileAsc.setText("...");
		btnFileAsc.setFont(new Font("Tahoma", Font.BOLD, 12));
		
		btnLoadRaster = new JButton(BUNDLE.getString("HecRasPanel.btnLoadRaster.text"));
		panelFileManager.add(btnLoadRaster, "cell 4 0");
		btnLoadRaster.setMaximumSize(new Dimension(105, 23));
		btnLoadRaster.setMinimumSize(new Dimension(110, 23));
		btnLoadRaster.setActionCommand("loadRaster");
		
		JLabel lblAscFile = new JLabel();
		panelFileManager.add(lblAscFile, "cell 0 2,alignx right");
		lblAscFile.setText(BUNDLE.getString("HecRasPanel.lblAscFile.text"));
		
		JScrollPane scrollPane_3 = new JScrollPane();
		panelFileManager.add(scrollPane_3, "cell 1 2,grow");
		
		txtFileSdf = new JTextArea();
		scrollPane_3.setViewportView(txtFileSdf);
		txtFileSdf.setLineWrap(true);
		txtFileSdf.setFont(new Font("Tahoma", Font.PLAIN, 11));
		
		btnFileSdf = new JButton();
		panelFileManager.add(btnFileSdf, "cell 3 2");
		btnFileSdf.setText("...");
		btnFileSdf.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnFileSdf.setActionCommand("chooseFileSdf");
		
		btnExportSdf = new JButton(BUNDLE.getString("HecRasPanel.btnExportSdf.text")); 
		panelFileManager.add(btnExportSdf, "cell 4 2");
		btnExportSdf.setMinimumSize(new Dimension(110, 23));
		btnExportSdf.setMaximumSize(new Dimension(105, 23));
		btnExportSdf.setActionCommand("exportSdf");
		
		btnClose = new JButton(BUNDLE.getString("Generic.btnClose.text")); 
		add(btnClose, "cell 1 2,alignx right");
		btnClose.setMinimumSize(new Dimension(60, 23));
		btnClose.setMaximumSize(new Dimension(105, 23));
		btnClose.setActionCommand("closePanel");

		setupListeners();

	}

	
	// Setup component's listener
	private void setupListeners() {
		
		btnLoadRaster.addActionListener(this);
		btnExportSdf.addActionListener(this);
		btnFileAsc.addActionListener(this);
		btnFileSdf.addActionListener(this);
		
		btnClose.addActionListener(this);		

	}
	

	@Override
	public void actionPerformed(ActionEvent e) {
		controller.action(e.getActionCommand());
	}

	
}