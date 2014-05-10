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
 * Batch Class to Generate a Mapping File Between Darkstar SQL & POLUtils
 * 
 * For this to work properly in its entirety, we must be in a known good state.
 * 
 * This is necessary in order to be able to attempt to automate NPCs where our name
 * in the SQL does not match the name given in POLUtils.
 * 
 * Once we have a proper mapping, it will allow the other batch jobs to autofix these
 * cases
 * 
 * If a mapping is bad because we are currently in a bad state, it will not be able to
 * fix the problem, but should not make it worse either.
 * 
 * As we manually fix these cases in the npc_list, we should rerun this job to regenerate
 * the batch file until we are in a completely good state.
 * 
 */
public class GenerateNpcIdMappingFile {

	private static final Logger LOG = Logger.getLogger(GenerateNpcIdMappingFile.class);

	private Properties configProperties;
	private Properties mappingProperties;
	private int errors = 0;

	/**
	 * GenerateNpcIdMappingFile - Batch Entry Point
	 */
	public static void main(String[] args) {
		final GenerateNpcIdMappingFile generateNpcIdMappingFile = new GenerateNpcIdMappingFile();
		generateNpcIdMappingFile.generateNpcIdMappingFile();
	}

	/**
	 * Main Loop for Generating the Mapping File
	 */
	private void generateNpcIdMappingFile(){
		configProperties = DarkstarUtils.loadBatchConfiguration();
		mappingProperties = DarkstarUtils.loadMappingProperties(configProperties);

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
				generateMappingForZone(npcListSqlLines, polUtilsMobListFilePath, zoneId, zoneNameComment);
			}
		}

		DarkstarUtils.saveMappingProperties(configProperties, mappingProperties);
		
		LOG.info(String.format("A Total of <%d> Unhandled Errors Occurred.", errors));
	}

	/**
	 * Logic to Generate Mappings for a Single Zone
	 */
	private void generateMappingForZone(final List<String> npcListSqlLines, final String polUtilsMobListFilePath, final int zoneId, final String zoneNameComment){
		// We find the zone by scanning for the Zone Comment in NPC_LIST Sql. The comment value mappingng is configured in the batch properties
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

		// Loop Through Npcs
		for(int lineIndex = zoneStartingLine; lineIndex < npcListSqlLines.size(); lineIndex++) {
			try{
				String npcListSqlLine = npcListSqlLines.get(lineIndex);

				LOG.debug(String.format("Processing Line: %s", npcListSqlLine));

				if(npcListSqlLine.indexOf("-- -")>=0){
					LOG.info(String.format("Finished <%s>: Zone Ended.",zoneNameComment));
					break;
				}

				final String npcName = DarkstarUtils.findCurrentNpcNameInNpcList(npcListSqlLine);

				if(npcName==null){
					continue;
				}
				else if(DarkstarUtils.isCurrentNpcNameInPolUtilsMobList(polUtilsMobListString, npcName)){
					LOG.debug(String.format("No Mapping Necessary for <%s>", npcName));
					continue;
				}
				else {
					final int npcId = DarkstarUtils.findCurrentNpcIdInNpcList(npcListSqlLine);
					final int polUtilsNpcId = DarkstarUtils.reconstructPolUtilsNpcId(polUtilsHexPrefix, npcId);
					final String polUtilsNpcName = DarkstarUtils.findPolUtilsNpcNameById(polUtilsMobListString, polUtilsNpcId);

					if(polUtilsNpcName==null){
						LOG.info(String.format("Failed to Match <%d> (%d), Skipping...", npcId, polUtilsNpcId));
						continue;
					}

					LOG.info(String.format("Darkstar Npc Name <%s> -> POLUtils Npc Name <%s>",npcName, polUtilsNpcName));
					mappingProperties.setProperty(DarkstarUtils.getMappingKey(zoneId, npcName), polUtilsNpcName);
				}
			}
			catch(Exception e){
				LOG.error(String.format("Exception Thrown While Processing Npc Ids In Zone <%s>", zoneNameComment), e);
				errors++;
			}
		}
	}
}
