import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

/**
 * Quick and Dirty Script to Try and Update NPC IDs
 * This is wrapped around a BAT file to be used as a shell script
 * Lots of things could be cleaned up and improved here.
 */
public class DarkstarNpcIdUpdate {

	private static final StringBuilder log = new StringBuilder();

	public static void main(String[] args) throws IOException{
		if(args.length!=4) throw new RuntimeException("Invalid Arguments");

		final String zoneName = args[0];
		log("Zone: "+zoneName);
		String trustedNpcName = args[1];
		log("Trusted NPC: "+trustedNpcName);
		final String npcIdFilePath = args[2];
		log("NPC ID File: "+npcIdFilePath);
		final String polUtilsFilePath = args[3];
		log("POL Utils File Path: "+polUtilsFilePath);

		final File npcIdFile = new File(npcIdFilePath);
		final File polUtilsFile = new File(polUtilsFilePath);
		final File logFile = new File("darkstar-npcid-updates.log");

		if(!npcIdFile.exists() || !npcIdFile.canRead() || !npcIdFile.canWrite()){
			throw new RuntimeException("Failed to access Npc Id File");
		}

		if(!polUtilsFile.exists() || !polUtilsFile.canRead()){
			throw new RuntimeException("Failed to access POLUtils File");
		}

		if(!logFile.exists()){
			logFile.createNewFile();
		}

		final InputStream npcIdStream = new FileInputStream(npcIdFile);
		byte[] npcIdData = new byte[npcIdStream.available()];
		npcIdStream.read(npcIdData);
		npcIdStream.close();

		final InputStream polUtilsStream = new FileInputStream(polUtilsFile);
		byte[] polUtilsData = new byte[polUtilsStream.available()];
		polUtilsStream.read(polUtilsData);
		polUtilsStream.close();

		String npcIdString = new String (npcIdData, "UTF-8");
		npcIdString = npcIdString.replaceAll("("+System.getProperty("line.separator")+")", " ");
		npcIdString = npcIdString.replaceAll("(&amp;)", "&");

		String polUtilsString = new String (polUtilsData, "UTF-8");
		polUtilsString = polUtilsString.replaceAll("("+System.getProperty("line.separator")+")", " ");
		polUtilsString = polUtilsString.replaceAll("(&amp;)", "&");

		final String insertString = "INSERT INTO `npc_list` VALUES (";
		int zoneIndex = npcIdString.indexOf("-- "+zoneName);
		
		if(npcIdString.indexOf("-- "+zoneName+" [S]")==zoneIndex && zoneName.indexOf("[S]")==-1){
			zoneIndex = npcIdString.indexOf("-- "+zoneName, zoneIndex+("-- "+zoneName+" [S]").length());
		}
		
		if(zoneIndex==-1) throw new RuntimeException("Cannot Find Zone");				
		int trustedNpcIndex = npcIdString.indexOf(trustedNpcName, zoneIndex);
		if(trustedNpcIndex==-1) {
			trustedNpcName = trustedNpcName.replace('_',' ');
			trustedNpcIndex = npcIdString.indexOf(trustedNpcName, zoneIndex);
			log("Adjusted Trusted NPC Name: "+trustedNpcName);
		}
		if(trustedNpcIndex==-1) throw new RuntimeException("Cannot Find Trusted Npc");
		final int trustedNpcStartIndex = npcIdString.lastIndexOf(insertString,trustedNpcIndex);
		final int trustedNpcEndIndex = npcIdString.lastIndexOf(",",trustedNpcIndex);
		final int trustedNpcCurrentValue = Integer.valueOf(npcIdString.substring(trustedNpcStartIndex+insertString.length(), trustedNpcEndIndex));
		log("Trusted NPC Current Value: "+trustedNpcCurrentValue);

		int polutilsTrustedNpcIndex = polUtilsString.indexOf(trustedNpcName);
		if(polutilsTrustedNpcIndex==-1) {
			trustedNpcName = trustedNpcName.replace('_',' ');
			polutilsTrustedNpcIndex = polUtilsString.indexOf(trustedNpcName);
			log("Adjusted Trusted NPC Name: "+trustedNpcName);
		}
		if(polutilsTrustedNpcIndex==-1) throw new RuntimeException("Cannot Find Trusted Npc In POLUtils");
		final int polutilsTrustedNpcStartIndex = polUtilsString.lastIndexOf("<field name=\"id\">", polutilsTrustedNpcIndex);
		final int polutilsTrustedNpcEndIndex = polUtilsString.lastIndexOf("</field>", polutilsTrustedNpcIndex);
		Integer trustedNpcNewValue = Integer.valueOf(polUtilsString.substring(polutilsTrustedNpcStartIndex+"<field name=\"id\">".length(), polutilsTrustedNpcEndIndex));
		log("Trusted NPC POLUtils: "+trustedNpcNewValue);
		String trustedNpcNewValueHexString = Integer.toHexString(trustedNpcNewValue);
		log("Trusted NPC Hex: "+trustedNpcNewValueHexString);
		final String trustedNpcHexPrefix = trustedNpcNewValueHexString.substring(0,trustedNpcNewValueHexString.length()-3);
		log("Trusted NPC Hex Prefix: "+trustedNpcHexPrefix);
		trustedNpcNewValueHexString = trustedNpcNewValueHexString.substring(trustedNpcNewValueHexString.length()-3, trustedNpcNewValueHexString.length());
		log("Trusted NPC Hex Trim: "+trustedNpcNewValueHexString);
		trustedNpcNewValue = Integer.parseInt(trustedNpcNewValueHexString, 16);
		log("Trusted NPC POLUtils Value: "+trustedNpcNewValue);

		final int shift = trustedNpcNewValue - trustedNpcCurrentValue;

		log("Shift of "+shift+" Detected!");

		final BufferedReader npcIdReader = 
				new BufferedReader(new InputStreamReader(new FileInputStream(npcIdFile), "UTF-8"));

		final StringBuilder outputFile = new StringBuilder();		

		String npcIdLine;

		boolean scanningForZone = true;
		boolean atLeastOneUpdate = false;
		boolean trustShift = true;
		boolean zoneDone = false;

		while((npcIdLine = npcIdReader.readLine())!=null){
			if(zoneDone){
				outputFile.append(npcIdLine);
				outputFile.append(System.getProperty("line.separator"));
				continue;
			}
			
			if(scanningForZone && npcIdLine.indexOf("-- "+zoneName)==-1){
				outputFile.append(npcIdLine);
				outputFile.append(System.getProperty("line.separator"));				
				continue;
			}	

			if(npcIdLine.indexOf(zoneName)>=0 && (npcIdLine.indexOf("[S]")>=0 && zoneName.indexOf("[S]")==-1)){
				outputFile.append(npcIdLine);
				outputFile.append(System.getProperty("line.separator"));				
				continue;
			}
			
			scanningForZone = false;

			if(atLeastOneUpdate && npcIdLine.indexOf("-- -")>=0){
				outputFile.append(npcIdLine);
				outputFile.append(System.getProperty("line.separator"));
				zoneDone = true;
				continue;
			}

			final int insertIndex = npcIdLine.indexOf(insertString);			

			if(insertIndex==-1){
				outputFile.append(npcIdLine);
				outputFile.append(System.getProperty("line.separator"));
				continue;
			}

			final int endIndex = npcIdLine.indexOf(",", insertIndex);
			final int currentValue = Integer.valueOf(npcIdLine.substring(insertString.length(), endIndex));
			final int newValue = currentValue + shift;
			final int npcNameStartIndex = npcIdLine.indexOf("'",endIndex);
			final int npcNameEndIndex = npcIdLine.indexOf("'",npcNameStartIndex+1);
			final String npcName = npcIdLine.substring(npcNameStartIndex+1, npcNameEndIndex);
			//log("Processing: "+npcName);
			boolean replace = true;

			if(!npcName.startsWith("_") && !npcName.startsWith("qm") && 
				npcName.indexOf("no_name")==-1 && npcName.indexOf("blank")==-1){
				try {
					String polUtilsNpcNewValueHex = Integer.toHexString(newValue);

					if(polUtilsNpcNewValueHex.length()==2){
						polUtilsNpcNewValueHex = "0"+polUtilsNpcNewValueHex;
					}

					polUtilsNpcNewValueHex = trustedNpcHexPrefix + polUtilsNpcNewValueHex;

					log("Assert: Reconstructed Hex Value: "+polUtilsNpcNewValueHex);
					final int polUtilsNpcNewValue = Integer.parseInt(polUtilsNpcNewValueHex, 16);
					log("Assert: Reconstructed POLUtils Integer Value: "+polUtilsNpcNewValue);				
					final int polutilsNpcIntegerIndex = polUtilsString.indexOf(String.valueOf(polUtilsNpcNewValue));
					log("Assert: Reconstructed POLUtils Index: "+polutilsNpcIntegerIndex);
					log("Assert: Search: "+npcName);
					String npcNameNoUnderscore = npcName.replaceAll("(_s_)","\\'s_");
					npcNameNoUnderscore = npcNameNoUnderscore.replace('_',' ');

					int polutilsNpcIndex = polUtilsString.indexOf(npcName, polutilsNpcIntegerIndex);

					if(polutilsNpcIndex==-1){
						log("Assert: Search Alternate: "+npcNameNoUnderscore);
						polutilsNpcIndex = polUtilsString.indexOf(npcNameNoUnderscore, polutilsNpcIntegerIndex);
					}

					log("Assert: Reconstructed NPC Name Index: "+polutilsNpcIndex);
					final String polutilsNpcName = polUtilsString.substring(polutilsNpcIndex, polutilsNpcIndex+npcName.length());
					log("Assert: POLUtils NPC Name: "+polutilsNpcName);
					final String polutilsNpcNameNoUnderscore = polutilsNpcName.replace('_',' '); 		

					if(polutilsNpcName.equals(npcName) || polutilsNpcNameNoUnderscore.equals(npcName)){
						log(String.format("%s %d -> %d (Cross Check: PASSED)", npcName, currentValue, newValue));
						
						if((newValue-currentValue)!=shift){
							log("WARNING: The previous Cross Check contradicted the Trusted Shift... WE CAN NO LONGER TRUST IT");
							trustShift = false;
						}
					}
					else if(trustShift){
						log(String.format("%s %d -> %d (Cross Check: FAILED, BUT SHIFT IS TRUSTED)", npcName, currentValue, newValue));
					}
					else {
						log(String.format("%s %d -> ??? (Cross Check: FAILED)", npcName, currentValue, newValue));
						replace = false;
					}
				}
				catch(Exception e){
					if(trustShift){
						log(String.format("%s %d -> %d (Cross Check: FAILED, BUT SHIFT IS TRUSTED)", npcName, currentValue, newValue));
					}
					else {
						replace = false;
					}
				}
			}
			else {
				log(String.format("%s %d -> %d (Cross Check: UNAVAILABLE)", npcName, currentValue, newValue));
			}
			
			if(replace){
				if((newValue - currentValue)!=shift){
					trustShift = false;
				}
				
				final String insertStringFragment = npcIdLine.substring(0, insertString.length());
				final String postIdFragment = npcIdLine.substring(endIndex, npcIdLine.length());
				npcIdLine = insertStringFragment + newValue + postIdFragment;
				outputFile.append(npcIdLine);
				outputFile.append(System.getProperty("line.separator"));
			}
			else {
				outputFile.append("FIXME: "+npcIdLine);
				outputFile.append(System.getProperty("line.separator"));	
			}

			atLeastOneUpdate = true;
		}

		npcIdReader.close();

		npcIdFile.delete();
		npcIdFile.createNewFile();

		final BufferedWriter outputWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(npcIdFile), "UTF-8"));
		outputWriter.write(outputFile.toString());
		outputWriter.flush();
		outputWriter.close();

		final BufferedWriter logWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(logFile, true), "UTF-8"));
		logWriter.write(log.toString());
		logWriter.flush();
		logWriter.close();
	}

	private static final void log(final String message){
		System.out.println(message);
		log.append(message);
		log.append(System.getProperty("line.separator"));		
	}
}
