package org.darkstar.batch;

/** 
 * Copyright (c) 2010-2014 Darkstar Dev Teams
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
 * along with this program.  If not, see http://www.gnu.org/licenses/
 * 
 * This file is part of DarkStar-server source code.
 */

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.darkstar.batch.utils.DarkstarUtils;

/**
 * Class to Perform a Batch Update of Text IDs after a Version Update
 * 
 * Requires a POLUtils Dump of dialog tables for reference. This job
 * makes comparisons between the comment in the TextID file and the
 * dialog tables in POLUtils to find the updated Text ID
 * 
 * Accuracy varies with two factors:
 * 
 * 1) Accuracy of the comment in the TextID files. Typos will break the
 * comparison
 * 
 * 2) State of bad chars & etc. in the dialog table dumps. This job will
 * try to strip them out of both sides for comparison, but that may leave
 * the sting without enough context to make it unique. In this case, its
 * possible the wrong ID would be selected.
 * 
 * Ids not concretely matched can be prepended with FIXME: for manual review.
 * 
 * Please check for these after the job and fix them before committing.
 */
public class TextIdUpdate {
	
	private static final Logger LOG = Logger.getLogger(TextIdUpdate.class);

	private Map<String,Integer> fixmeCountMap;
	private Properties configProperties;
	private int errors = 0;
	private int guesses = 0;	
	private boolean markGuesses;
	private boolean writeFilteredDialogTables;
	
	/**
	 * Batch Entry Point for Text ID Updates
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {		
		final TextIdUpdate textIdUpdate = new TextIdUpdate();
		textIdUpdate.updateTextIds();
	}
	
	/**
	 * Method to Run a Mass Text ID Update
	 */
	private void updateTextIds(){
		configProperties = DarkstarUtils.loadBatchConfiguration();
		markGuesses = Boolean.valueOf(configProperties.getProperty("textIdMarkGuesses","true"));
		writeFilteredDialogTables = Boolean.valueOf(configProperties.getProperty("writeFilteredDialogTables","true"));
		fixmeCountMap = new HashMap<>();

		final int minZone = Integer.valueOf(configProperties.getProperty("minZoneId", "0"));
		final int maxZone = Integer.valueOf(configProperties.getProperty("maxZoneId", "255"));

		for (int zoneId = minZone; zoneId <= maxZone; zoneId++){
			if(DarkstarUtils.isZoneMapped(configProperties, zoneId)){
				LOG.info(String.format("Processing Zone ID <%d>...", zoneId));
				updateTextIdsForZone(zoneId);
			}
			else {				
				LOG.info(String.format("Zone ID <%d> Is Not Configured, Skipping...", zoneId));
			}
		}

		LOG.info(String.format("A Total of <%d> Guesses Occurred.", guesses));
		
		if(markGuesses){
			LOG.info("Guesses are marked with \"FIXME:\". Please Manually Review Them Before Commiting");
			LOG.info("Here are the \"FIXME:\" Counts:");
			
			final Set<String> fixmeKeySet = fixmeCountMap.keySet();			
			for(final String fixmeKey : fixmeKeySet){
				final Integer fixmeValue = fixmeCountMap.get(fixmeKey);
				
				if(fixmeValue!=null && fixmeValue > 0){
					LOG.info(String.format("File <%s> contains <%d> FIXMEs", fixmeKey, fixmeValue));
				}
			}			
		}
		
		LOG.info(String.format("A Total of <%d> Unhandled Errors Occurred.", errors));
	}
	
	/**
	 * Method to Update Text IDs for a Single Zone
	 * @param zoneId Zone ID to Update
	 */
	private void updateTextIdsForZone(final int zoneId){
		final String textIdFilePath = DarkstarUtils.getTextIdFilePath(configProperties, zoneId);
		final File textIdFile = new File(textIdFilePath);
		final File polUtilsDialogTableFile = new File(DarkstarUtils.getDialogTablePathByZoneId(configProperties, zoneId));;
		
		// Read the Dialog Table File, and Keep Both & Original Read of it and a Filtered Read
		String polUtilsString;

		try {
			// Shifting Encoding to Avoid Issues w/ Regex Replace All
			polUtilsString = FileUtils.readFileToString(polUtilsDialogTableFile, "Shift_JIS");
			polUtilsString = DarkstarUtils.collapseAndFormatXmlString(polUtilsString);
			byte[] polUtilsShiftJisBytes = polUtilsString.getBytes("Shift_JIS");			
			Charset shiftJis = Charset.forName("Shift_JIS");
			Charset ansi = Charset.forName("Cp1252");			
			CharBuffer shiftJisCharBuffer = shiftJis.decode(ByteBuffer.wrap(polUtilsShiftJisBytes));
			ByteBuffer ansiByteBuffer = ansi.encode(shiftJisCharBuffer);			
			polUtilsString = new String(ansiByteBuffer.array(), "Cp1252");
		} 
		catch (IOException e) {
			LOG.error(String.format("Zone ID <%d> -> Could Not Read Dialog Table, Skipping...", zoneId), e);
			errors++;
			return;
		}
				
		final String filteredPolUtilsString = DarkstarUtils.filterBadCharacters(polUtilsString);
		
		// Optional: Write Filtered Dialog Tables. Helps you figure out how you can make a TextID auto-update in the future.
		if(writeFilteredDialogTables){
			DarkstarUtils.writeFilteredDialogTable(configProperties, filteredPolUtilsString, zoneId);
		}
		
		// Read the Text ID File
		List<String> textIdLines;
		
		try {
			textIdLines = FileUtils.readLines(textIdFile, "UTF-8");
		} 
		catch (IOException e) {
			LOG.error(String.format("Zone ID <%d> -> Could Not Read Text ID File, Skipping...", zoneId), e);
			errors++;
			return;
		}
		
		int zoneGuesses = 0;
		
		for(int lineIndex = 0; lineIndex < textIdLines.size(); lineIndex++) {
			String textIdLine =  textIdLines.get(lineIndex);
			
			// If we don't have all 3 of these markers on a line, then the line is not a text id definition.
			if(textIdLine.indexOf("=")==-1 || textIdLine.indexOf(";")==-1 || textIdLine.indexOf("--")==-1) {  
				continue; 
			}
			
			// Search for Markers on this Line
			final int lineEqual = textIdLine.indexOf("=");
			final int semiColon = textIdLine.indexOf(";", lineEqual);
			final int commentIndex = textIdLine.indexOf("--");
			
			// Capture the Comment
			final String variable = textIdLine.substring(0,lineEqual).trim();
			
			// Capture the Current Id
			final int id = Integer.valueOf(textIdLine.substring(lineEqual+1,semiColon).trim());			
					
			// Capture the Comment			
			final String comment = textIdLine.substring(commentIndex+2).trim();
			
			// Ignore Unknowns & Current ID 0's
			if("??? message".equals(comment) || "[UNKNOWN]".equals(comment) || id==0){
				continue;
			}
			
			// Apply some basic filtering. These are showing up as a single ? in POLUtils right now,
			// while they are filled out in most of our Text ID Luas. So we need to sync up before
			// comparing. Since this is very common, we will not treat this as triggering a guess.
			String searchComment = comment;
			searchComment = searchComment.replaceAll("(<<<)","<");
			searchComment = searchComment.replaceAll("(>>>)",">");
			searchComment = searchComment.replace('<', '?');
			searchComment = searchComment.replace('>', '?');
						
			// Hack for Case Mismatching on This, Us Vs. POLUtils in a lot of cases
			if("CHEST_FAIL".equals(variable)){
				searchComment = searchComment.toLowerCase(Locale.US);
			}
									
			// We're going to capture where the current position in Dialog Utils, and start our search from there. 
			// Helps keep the right ID when there a multiple similar lines
			final String lastSearchIndexString = DarkstarUtils.FIELD_INDEX_OPENING_TAG+id+DarkstarUtils.FIELD_CLOSING_TAG;
			int lastIndex = polUtilsString.indexOf(lastSearchIndexString);
			int lastFilteredIndex = filteredPolUtilsString.indexOf(lastSearchIndexString);
			
			// Run initial search. If this matches, its considered a match & not a guess.
			boolean guess = false;
			boolean filtered = false;
			LOG.debug("Searching: "+searchComment);			

			int polUtilsIndex = polUtilsString.indexOf(searchComment, lastIndex);
			
			// If we couldn't find it, we'll have to apply bad char filtering
			if(polUtilsIndex == -1){				
				searchComment = DarkstarUtils.filterBadCharacters(searchComment).trim();
				LOG.debug("Searching (Filtered): "+searchComment);
				polUtilsIndex = filteredPolUtilsString.indexOf(searchComment, lastFilteredIndex);
				guess = false;
				filtered = true;
			}
			
			// If we couldn't find it again, see if there's a manually specified version in the properties file
			if(polUtilsIndex == -1){
				searchComment = configProperties.getProperty(variable);
				
				if(searchComment!=null){
					LOG.debug("Searching (Manual): "+searchComment);
					polUtilsIndex = filteredPolUtilsString.indexOf(searchComment, lastFilteredIndex);
					guess = false; // Doesn't count as a guess since someone manually set the criteria
					filtered = true;
				}				
			}
			
			// If we've found something...
			if(polUtilsIndex >= 0){
				// Capture the New ID Value
				int fieldIndex;
				int fieldEndIndex;
				int fieldValue;

				if(filtered){
					fieldIndex = filteredPolUtilsString.lastIndexOf(DarkstarUtils.FIELD_INDEX_OPENING_TAG, polUtilsIndex);
					fieldEndIndex = filteredPolUtilsString.indexOf(DarkstarUtils.FIELD_CLOSING_TAG, fieldIndex);
					fieldValue = Integer.valueOf(filteredPolUtilsString.substring(fieldIndex+DarkstarUtils.FIELD_INDEX_OPENING_TAG.length(), fieldEndIndex));
				}
				else {
					fieldIndex = polUtilsString.lastIndexOf(DarkstarUtils.FIELD_INDEX_OPENING_TAG, polUtilsIndex);
					fieldEndIndex = polUtilsString.indexOf(DarkstarUtils.FIELD_CLOSING_TAG, fieldIndex);
					fieldValue = Integer.valueOf(polUtilsString.substring(fieldIndex+DarkstarUtils.FIELD_INDEX_OPENING_TAG.length(), fieldEndIndex));
				}

				// If the new Id & Old Id are the same, leave it alone
				if(id == fieldValue){
					guess = false;
					LOG.debug(String.format("%s: %d -> %d, Same Id Detected, Leaving it alone...", variable, id, fieldValue));
				}
				// If its shifted too much, mark it for manual review if we're marking guesses in case something weird happened
				else if(markGuesses && (Math.abs(fieldValue - id) > 10)){
					textIdLine.replaceAll("("+id+")", String.valueOf(fieldValue));					
					textIdLine = DarkstarUtils.FIX_ME + textIdLine;
					textIdLines.set(lineIndex, textIdLine);
					LOG.info(String.format("%s: %d -> %d, Large Change Detected, Marking for Manual Review With FIXME...", variable, id, fieldValue));
					guess = true;
				}
				// Update it
				else {
					textIdLine = textIdLine.replaceAll("("+id+")", String.valueOf(fieldValue));
					textIdLines.set(lineIndex, textIdLine);
					LOG.info(String.format("%s: %d -> %d", variable, id, fieldValue));
				}
			}
			// If we've got nothing and we're marking stuff, flag it with FIXME for manual review. Otherwise we're leaving it alone.
			else if(markGuesses){
				textIdLine = DarkstarUtils.FIX_ME + textIdLine;
				textIdLines.set(lineIndex, textIdLine);
				LOG.info(String.format("%s: %d -> ???, Couldn't Find Any Matches, Marking for Manual Review With FIXME...", variable, id));
				guess = true;
			}
			else {
				LOG.info(String.format("%s: %d -> ???, Couldn't Find Any Matches, So We Left it Alone...", variable, id));
			}
			
			if(guess){
				zoneGuesses++;
			}			
		}	
		
		// Write Text ID File
		try {
			FileUtils.writeLines(textIdFile, textIdLines);
		} 
		catch (IOException e) {
			LOG.error(String.format("Zone ID <%d> -> Could Write Text ID File, Skipping...", zoneId), e);
			errors++;
			return;
		}
		
		// Record Fixme / Guess Data
		fixmeCountMap.put(textIdFilePath, zoneGuesses);
		guesses += zoneGuesses;
		
	}

}
