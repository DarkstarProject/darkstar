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
import java.util.List;
import java.util.Properties;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.darkstar.batch.utils.DarkstarUtils;

/**
 * Batch Class Update Npc Updates for Darkstar after a Version Update
 * 
 * This Job requires both a POLUtils Dump and a Npc Id Mapping File for NPCs
 * where the naming between Darkstar SQL & POLUtils is different.
 * 
 * For these npcs, accuracy will depend on accuracy of the mapping file. If the mapping
 * file is generated right before the version update, it should keep things from getting worse,
 * but may not auto-fix everything if mapped entries are bad.
 * 
 * After such cases are manually fixed, the mapping file should be regenerated, and they should
 * then be auto-fixable in the future.
 * 
 */
public class NpcIdUpdate {

	private static final Logger LOG = Logger.getLogger(NpcIdUpdate.class);
	
	private Properties configProperties;
	private Properties mappingProperties;
	private Properties npcIdShiftProperties;
	private int errors = 0;
	private int guesses = 0;	
	private boolean markGuesses;

	/**
	 * NpcIdUpdate - Batch Entry Point
	 */
	public static void main(String[] args) {
		final NpcIdUpdate npcIdUpdate = new NpcIdUpdate();
		npcIdUpdate.updateNpcIds();
	}

	/**
	 * Main Loop for Generating the Mapping File
	 */
	private void updateNpcIds(){
		configProperties = DarkstarUtils.loadBatchConfiguration();
		mappingProperties = DarkstarUtils.loadMappingProperties(configProperties);
		markGuesses = Boolean.valueOf(configProperties.getProperty("npcIdMarkGuesses","false"));
		npcIdShiftProperties = new Properties();

		final int minZone = Integer.valueOf(configProperties.getProperty("minZoneId", "0"));
		final int maxZone = Integer.valueOf(configProperties.getProperty("maxZoneId", "255"));

		final List<String> npcListSqlLines = DarkstarUtils.getNpcListFileLines(configProperties);

		for (int zoneId = minZone; zoneId <= maxZone; zoneId++){
			final String polUtilsMobListFilePath = DarkstarUtils.getMobListPathByZoneId(configProperties, zoneId);
			final String zoneNameComment = DarkstarUtils.getNpcListSqlZoneCommentByZoneId(configProperties, zoneId);

			if(zoneNameComment==null){
				LOG.info(String.format("Zone ID <%d> Is Not Configured, Skipping...", zoneId));
			}
			else {
				LOG.info(String.format("Processing Zone ID <%d>...", zoneId));
				updateNpcIdsForZone(npcListSqlLines, polUtilsMobListFilePath, zoneId, zoneNameComment);
			}
		}

		LOG.info(String.format("A Total of <%d> Guesses Occurred.", guesses));
		
		if(markGuesses){
			LOG.info("Guesses are marked with \"FIXME:\" in the SQL. Please search for and fix these before committing.");	
		}
		
		LOG.info(String.format("A Total of <%d> Unhandled Errors Occurred.", errors));
		
		DarkstarUtils.saveNpcListSqlFile(configProperties, npcListSqlLines);
		DarkstarUtils.saveNpcIdShiftProperties(configProperties, npcIdShiftProperties);
	}

	/**
	 * Logic to Update Npc Ids for a Single Zone
	 */
	private void updateNpcIdsForZone(final List<String> npcListSqlLines, final String polUtilsMobListFilePath, final int zoneId, final String zoneNameComment){
		// We find the zone by scanning for the Zone Comment in NPC_LIST Sql. The comment value mapping is configured in the batch properties
		final int zoneStartingLine = DarkstarUtils.findZoneInNpcListSql(zoneNameComment, npcListSqlLines);

		if(zoneStartingLine == -1){
			LOG.info(String.format("Unable to Find Zone Comment <%s> in Npc List SQL, Skipping...", zoneNameComment));
			return;
		}

		// Read in Relevant Pol Utils File to Match With
		final File polUtilsMobListFile = new File(polUtilsMobListFilePath);
		String polUtilsMobListString;

		try {
			polUtilsMobListString = FileUtils.readFileToString(polUtilsMobListFile, "UTF-8");
		} 
		catch (final IOException e) {
			LOG.error(String.format("Error Reading Mob List for Zone <%s>, Skipping...", zoneNameComment), e);
			errors++;
			return;
		}

		polUtilsMobListString = DarkstarUtils.collapseAndFormatXmlString(polUtilsMobListString);

		// Capture Hex Prefix for the Zone, Used in Matching Our Ids to POLUtils
		final String polUtilsHexPrefix = DarkstarUtils.findPolUtilsNpcHexPrefix(polUtilsMobListString);

		// Keep track of the shift trend
		int shiftTrend = 0;
		
		// Loop Through Npcs		
		for(int lineIndex = zoneStartingLine; lineIndex < npcListSqlLines.size(); lineIndex++) {
			try{
				String npcListSqlLine = npcListSqlLines.get(lineIndex);

				LOG.debug(String.format("Processing Line: %s", npcListSqlLine));

				if(npcListSqlLine.indexOf("-- -")>=0){
					LOG.info(String.format("Finished <%s>: Zone Ended.",zoneNameComment));
					break;
				}
				else if("".equals(npcListSqlLine.trim()) || npcListSqlLine.startsWith("--")){
					continue;
				}
				
				final int npcId = DarkstarUtils.findCurrentNpcIdInNpcList(npcListSqlLine);
				final int polUtilsNpcId = DarkstarUtils.reconstructPolUtilsNpcId(polUtilsHexPrefix, npcId);				
				String npcName = DarkstarUtils.findCurrentNpcNameInNpcList(npcListSqlLine);
				int shiftedPolUtilsId = polUtilsNpcId + shiftTrend;
				
				// If we can't find the npc at all, we'll reference the mapping file.
				if(!DarkstarUtils.isCurrentNpcNameInPolUtilsMobList(polUtilsMobListString, npcName)){
					npcName = mappingProperties.getProperty(DarkstarUtils.getMappingKey(zoneId, npcName), npcName);				
				}
				
				// If we still can't find it, we have to guess best off the current trend.
				if(!DarkstarUtils.isCurrentNpcNameInPolUtilsMobList(polUtilsMobListString, npcName)){											
					final int shiftedId = DarkstarUtils.convertPolUtilsNpcIdToDarkstar(shiftedPolUtilsId);					

					if(npcId==shiftedId){
						LOG.info(String.format("Pre-Scan: Unable To Locate Npc Name <%s>, Shift Trend is <0> so we're leaving it alone!", npcName));
					}
					else {
						LOG.info(String.format("Pre-Scan: Unable To Locate Npc Name <%s>, Using Trend Shift <%d>: %d -> %d", npcName, shiftTrend, npcId, shiftedId));
						npcIdShiftProperties.setProperty(String.valueOf(polUtilsNpcId),String.valueOf(shiftedPolUtilsId));
						DarkstarUtils.replaceNpcId(npcListSqlLines, lineIndex, shiftedId);
						guesses++;
					}
					continue;
				}
				
				// We're gonna try looking up the ID with the offset of the current shifting 
				// trend, and see if the name matches. If it does, we'll go with that.
				// If it doesn't, we start scanning...				
				String polUtilsNpcName = null;
				
				// First Strategy is forward scanning off of the current shifting trend
				LOG.debug("Starting Forward Scan...");
				for(int scanningId = shiftedPolUtilsId; scanningId < (shiftedPolUtilsId+2); scanningId++){					
					int scannedPolUtilsIndex = DarkstarUtils.findPolUtilsIndexById(polUtilsMobListString, scanningId);
					String scannedPolUtilsNpcName = DarkstarUtils.findPolUtilsNpcNameById(polUtilsMobListString, scanningId, scannedPolUtilsIndex);

					if(scannedPolUtilsNpcName==null){
						continue;
					}
					
					if(DarkstarUtils.isNpcNameAMatch(npcName, scannedPolUtilsNpcName)){
						polUtilsNpcName = scannedPolUtilsNpcName;
						shiftedPolUtilsId = scanningId;
						break;
					}					
				}
				
				// If that doesn't work, we'll scan backwards. Occasionally this happens when there are jumps between sequential ids, and the zone stopped shifting at that point.
				LOG.debug("Starting Backward Scan...");
				if(polUtilsNpcName == null){					
					for(int scanningId = shiftedPolUtilsId; scanningId > (shiftedPolUtilsId-2); scanningId--){
						int scannedPolUtilsIndex = DarkstarUtils.findPolUtilsIndexById(polUtilsMobListString, scanningId);
						String scannedPolUtilsNpcName = DarkstarUtils.findPolUtilsNpcNameById(polUtilsMobListString, scanningId, scannedPolUtilsIndex);
						
						if(scannedPolUtilsNpcName==null){
							continue;
						}
						
						if(DarkstarUtils.isNpcNameAMatch(npcName, scannedPolUtilsNpcName)){
							polUtilsNpcName = scannedPolUtilsNpcName;
							shiftedPolUtilsId = scanningId;
							break;
						}					
					}					
				}
				
				
				final int shiftedId = DarkstarUtils.convertPolUtilsNpcIdToDarkstar(shiftedPolUtilsId);
				shiftTrend = shiftedId - npcId;
				
				// If it ended up the same, leave it alone to avoid log spam
				if(npcId==shiftedId){
					continue;
				}
				// If we haven't found it we'll have to guess...				
				else if(polUtilsNpcName==null){				
					LOG.info(String.format("Post-Scan: Unable To Locate Npc Name <%s>, Using Trend Shift <%d>: %d -> %d", npcName, shiftTrend, npcId, shiftedId));
					npcIdShiftProperties.setProperty(String.valueOf(polUtilsNpcId),String.valueOf(shiftedPolUtilsId));
					DarkstarUtils.replaceNpcId(npcListSqlLines, lineIndex, shiftedId);
					guesses++;
					continue;
				}
				// Otherwise we use the value we found
				else {
					LOG.info(String.format("Matched: Npc Name <%s>, %d -> %d", npcName, npcId, shiftedId));
					npcIdShiftProperties.setProperty(String.valueOf(polUtilsNpcId),String.valueOf(shiftedPolUtilsId));
					DarkstarUtils.replaceNpcId(npcListSqlLines, lineIndex, shiftedId);					
				}
			}
			catch(Exception e){
				LOG.error(String.format("Exception Thrown While Processing Npc Ids In Zone <%s>", zoneNameComment), e);
				errors++;
			}
		}
	}
}
