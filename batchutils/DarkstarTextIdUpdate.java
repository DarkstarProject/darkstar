import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Locale;
import java.util.Scanner;

public class DarkstarTextIdUpdate {

	private static final StringBuilder log = new StringBuilder();

	public static void main(String[] args) throws IOException{
		if(args.length!=2) throw new RuntimeException("Invalid Arguments");
		
		final String textIdFilePath = args[0];
		final String polUtilsFilePath = args[1];
				
		final File textIdFile = new File(textIdFilePath);
		final File polUtilsFile = new File(polUtilsFilePath);
		final File logFile = new File("darkstar-textid-updates.log");
		
		if(!textIdFile.exists() || !textIdFile.canRead() || !textIdFile.canWrite()){
			throw new RuntimeException("Failed to access Text Id File");
		}
		
		if(!textIdFile.exists() || !textIdFile.canRead()){
			throw new RuntimeException("Failed to access Text Id File");
		}
		
		if(!logFile.exists()){
			logFile.createNewFile();
		}
		
		final InputStream polUtilsStream = new FileInputStream(polUtilsFile);
		byte[] polUtilsData = new byte[polUtilsStream.available()];
		polUtilsStream.read(polUtilsData);
		polUtilsStream.close();
		
		String polUtilsString = new String (polUtilsData, "UTF-8");
		polUtilsString = polUtilsString.replaceAll("("+System.getProperty("line.separator")+")", " ");
		polUtilsString = polUtilsString.replaceAll("(&amp;)", "&");
		
		final BufferedReader textIdReader = 
				new BufferedReader(new InputStreamReader(new FileInputStream(textIdFile), "UTF-8"));
		
		final StringBuilder outputFile = new StringBuilder();		

		String textIdLine;
		
		while((textIdLine = textIdReader.readLine())!=null){
			if(textIdLine.indexOf("=")==-1) { 
				outputFile.append(textIdLine);
				outputFile.append(System.getProperty("line.separator")); 
				continue; 
			}
			
			if(textIdLine.indexOf("--")==-1) { 
				outputFile.append(textIdLine);
				outputFile.append(System.getProperty("line.separator")); 
				continue;  
			}			
			
			final Scanner textIdScanner = new Scanner(textIdLine);
			final String variable = textIdScanner.next();			
			
			if("ITEM_OBTAINED".equals(variable) ||
					"GIL_OBTAINED".equals(variable) ||
					"KEYITEM_OBTAINED".equals(variable) ||
					"KEYITEM_LOST".equals(variable)){
				outputFile.append(textIdLine);
				outputFile.append(System.getProperty("line.separator")); 
				continue;
			}
			
			int lineEqual = textIdLine.indexOf("=")+1;
			int semiColon = textIdLine.indexOf(";", lineEqual);
			
			final int id = Integer.valueOf(textIdLine.substring(lineEqual,semiColon).trim());
			final String lastSearchIndexString = "<field name=\"index\">"+id+"</field>";
					
			final int commentIndex = textIdLine.indexOf("--");
			final String comment = textIdLine.substring(commentIndex+2).trim();
			
			String searchComment = comment;
			searchComment = searchComment.replaceAll("(<<<)","<");
			searchComment = searchComment.replaceAll("(>>>)",">");
			searchComment = searchComment.replace('<', '?');
			searchComment = searchComment.replace('>', '?');
			
			final int specialCode = searchComment.indexOf("Possible Special Code:");
			
			if(specialCode>=0){
				searchComment = searchComment.substring(0, specialCode);
			}
			
			final int multChoice = searchComment.indexOf("Multiple Choice");
			
			if(multChoice>=0){
				searchComment = searchComment.substring(0, multChoice+"Multiple Choice".length());
			}
			
			if("CHEST_FAIL".equals(variable)){
				searchComment = searchComment.toLowerCase(Locale.US);
			}
			
			log("Searching: "+searchComment);
			double confidence = 100;						
			
			int lastIndex = polUtilsString.indexOf(lastSearchIndexString);
			
			do {				
				int polUtilsIndex = polUtilsString.indexOf(searchComment, lastIndex);
				
				if(polUtilsIndex==-1){					
//					int newIndex = searchComment.indexOf("Multiple Choice (");
//					if(newIndex!=-1){
//						searchComment = searchComment.substring(0, newIndex+"Multiple Choice".length()).trim();
//						log("Retry: "+searchComment);
//						confidence = 75;
//						continue;						
//					}
							
//					newIndex = searchComment.indexOf("?. ");
//					if(newIndex!=-1){
//						searchComment = searchComment.substring(newIndex+3, searchComment.length()).trim();						
//						log("Retry: "+searchComment);
//						confidence = 55;
//						continue;
//					}						
										
					searchComment = searchComment.substring(0, searchComment.length()/2).trim();					
					confidence = confidence - 10;
					
					if(confidence < 50 || searchComment.length() < 10){			
						outputFile.append("FIXME: "+textIdLine);
						outputFile.append(System.getProperty("line.separator"));
						log(variable+": "+id+" -> Unable to Match This Line (Confidence: 0%)");
						break;
					}
					log("Retry: "+searchComment);
					continue;
				}
				
				int fieldIndex = polUtilsString.lastIndexOf("<field name=\"index\">", polUtilsIndex);
				int fieldEndIndex = polUtilsString.indexOf("</field>", fieldIndex);
				int fieldValue = Integer.valueOf(polUtilsString.substring(fieldIndex+"<field name=\"index\">".length(), fieldEndIndex));
				
				if((fieldValue - id) > 50){
					outputFile.append("FIXME: "+textIdLine);
					outputFile.append(System.getProperty("line.separator"));
					log(variable+": "+id+" -> Threshod Too Great (Confidence: 0%)");
					break;
				}
								
				log(variable+": "+id+" -> "+fieldValue+" (Confidence: "+confidence+"%");
				outputFile.append(textIdLine.replaceAll("("+id+")", String.valueOf(fieldValue)));
				outputFile.append(System.getProperty("line.separator"));				
				break;
			} while(true);			
			
			textIdScanner.close();
		}
		
		textIdReader.close();
		
		textIdFile.delete();
		textIdFile.createNewFile();
		
		final BufferedWriter outputWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(textIdFile), "UTF-8"));
		outputWriter.write(outputFile.toString());
		outputWriter.flush();
		outputWriter.close();
		
		final BufferedWriter logWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(logFile), "UTF-8"));
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
