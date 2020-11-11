/////////////////////////////////////////////////////////////////////***
//
// UtilApp-Call | send_email.gs | RC2
//
/////////////////////////////////////////////////////////////////////***
//
// Send Emails on Google Form Submit, get content, parse and send
// to given Address List
//
//
// by T. Ledermueller (derlemue.com) | License: GNU GPL-3.0
//
/////////////////////////////////////////////////////////////////////***

///
///	Trigger to fire when new row is added to Google Sheet
///
	function onFormSubmit(e){
	Logger.log("[METHOD] onFormSubmit");
	emailSenderBR();
	}

///	Script to parse Email from Sheet and send by alias
///
	function emailSenderCall(){

/// set variables (shortcuts for Google App Script Classes)
		var email_draft = HtmlService.createTemplateFromFile("email_text");
		var ws_input = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Input");
		var ws_mail = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Mail_Util");

/// set variables (define sources on Google Sheet)  
/// set range from column A-Q and set row from "last"-"last"  
		var data_input = ws_input.getRange("A" + ws_input.getLastRow() + ":Q" + ws_input.getLastRow()).getValues();

/// set range from column A-C and set row from 2-"last"
		var data_mail = ws_mail.getRange("A2:C" + ws_mail.getLastRow()).getValues();

/// set variables (link name and cloumn in Google Sheet "Input")
		var vTimestamp = 0;
		var vCase = 1;
		var vReporter = 2;
		var lastRow = ws_input.getLastRow();
		var vDate = new Date(ws_input.getSheetValues(lastRow, 4, 1, 1));
		var vDateTemp = Utilities.formatDate(vDate, "Europe/Berlin", "dd.MM.yyyy");
		var vTime1 = new Date(ws_input.getSheetValues(lastRow, 5, 1, 1));
		var vTime2 = new Date(ws_input.getSheetValues(lastRow, 6, 1, 1));
		var vBuilding = 6;
		var vMedium = 7;
		var vMachine = 8;
		var vError = 9;
		var vCause = 10;
		var vAction =11;
		var vInterrup = 12;
		var vOtherService = 13;
		var vLogBook = 14;
		var vComment = 15;
		var vInfoSpread = 16;
  
/// set variables (link name and cloumn in Google Sheet "Mail_Util")
		var vAddr = 1;
		var vName = 0;

/// Show Variables in Log for debug 
		Logger.log("Last Row");
		Logger.log(lastRow);
		Logger.log("vDate Var");
		Logger.log(vDate);
		Logger.log("vDateTemp Var");
		Logger.log(vDateTemp);
		Logger.log("vReporter Var");
		Logger.log(vReporter);
		Logger.log("vTime1 & vTime2 Var");
		Logger.log(vTime1);
		Logger.log(vTime2);  
		Logger.log("Script Finished");

/// Parse Emails from Google Sheet  
/// get Email address and name from Google Sheet "Mail_Util", repeat for each row)
		data_mail.forEach(function get1(row){  
			var vAdd = row[vAddr];
			var vNameTemp = row[vName];
			Logger.log(vAdd);
    
/// get variables for Email body from Google Sheet "Input" (last row) and send to Email draft (email_text.html)
			data_input.forEach(function get2(row){
				email_draft.vReporter = row[vReporter];
				email_draft.vCase = row[vCase];
				email_draft.vDate = Utilities.formatDate(vDate, "Europe/Berlin", "dd.MM.yyyy");
				email_draft.vTime1 = Utilities.formatDate(vTime1, "Europe/Berlin", "HH:mm");
				email_draft.vTime2 = Utilities.formatDate(vTime2, "Europe/Berlin", "HH:mm");
				email_draft.vBuilding = row[vBuilding];
				email_draft.vMachine = row[vMachine];
				email_draft.vMedium = row[vMedium];
				email_draft.vError = row[vError];
				email_draft.vCause = row[vCause];
				email_draft.vAction = row[vAction];
				email_draft.vInterrup = row[vInterrup];
				email_draft.vOtherService = row[vOtherService];
				email_draft.vInfoSpread = row[vInfoSpread];
				email_draft.vName = vNameTemp
				email_draft.vDuration = calcTime()
  
/// get variables for Email subject, assemble Email and send by alias
				var vInfoSpreadTemp = row[vInfoSpread];
				var vBody = email_draft.evaluate().getContent();
				var vBuildingTemp = row[vBuilding]
				Logger.log(vBody);
				var vSub = "Einsatz im Gebäude: " + vBuildingTemp + " | Verteiler: " + vInfoSpreadTemp
                		var vBody = email_draft.evaluate().getContent();
             			GmailApp.sendEmail(vAdd, vSub, 'HTML seems to be unsupported by your Email', {htmlBody: vBody})
			})
		})
	};
