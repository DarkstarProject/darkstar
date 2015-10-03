-----------------------------------
-- Area: Celennia_Memorial_Library
-- NPC:  Jedelaih
-- Type: Standard 0NPC
-----------------------------------
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
-----------------------------------


require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();


itemQuality = 0;

		 

	if(trade:hasItemQty(18294,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18295); -- Bravura 80
     
	 elseif(trade:hasItemQty(18295,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18642); -- Bravura 85

     elseif(trade:hasItemQty(18642,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18656); -- Bravura 90
      
	 elseif(trade:hasItemQty(18656,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18670); -- Bravura 95
	  
	 elseif(trade:hasItemQty(18670,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19844); -- Bravura 99 afterglow

	 elseif(trade:hasItemQty(19844,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20836); -- Bravura 99 119 Afterglow	 
		 
	 elseif(trade:hasItemQty(18318,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18319); -- Amanomurakumo 80
     
	 elseif(trade:hasItemQty(18319,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18646); -- Amanomurakumo 85

     elseif(trade:hasItemQty(18646,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18660); -- Amanomurakumo 90
      
	 elseif(trade:hasItemQty(18660,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18674); -- Amanomurakumo 95
	  
	 elseif(trade:hasItemQty(18674,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19848); -- Amanomurakumo 99 afterglow

	 elseif(trade:hasItemQty(19848,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(21016); -- Amanomurakumo 99 119  Afterglow
		 
	 	 elseif(trade:hasItemQty(18312,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18313); -- Kikoku 80
     
	 elseif(trade:hasItemQty(18313,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18645); -- Kikoku 85

     elseif(trade:hasItemQty(18645,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18659); -- Kikoku 90
      
	 elseif(trade:hasItemQty(18659,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18673); -- Kikoku 95
	  
	 elseif(trade:hasItemQty(18673,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19847); -- Kikoku 99 No afterglow

	 elseif(trade:hasItemQty(19847,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20971); -- Kikoku 99 Afterglow	

elseif(trade:hasItemQty(15070,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(16195); -- Aegis 80
	 
	 elseif(trade:hasItemQty(16195,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(16196); -- Aegis 85

     elseif(trade:hasItemQty(16196,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(16197); -- Aegis 90
      
	 elseif(trade:hasItemQty(16197,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(16198); -- Aegis 95
	  
	 elseif(trade:hasItemQty(16198,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(11927); -- Aegis 99 No afterglow

	 elseif(trade:hasItemQty(11927,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(16200); -- Aegis 99 Afterglow
     
	 elseif(trade:hasItemQty(18270,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18271); -- Mandau 80
     
	 elseif(trade:hasItemQty(18271,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18638); -- Mandau 85

     elseif(trade:hasItemQty(18638,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18652); -- Mandau 90
      
	 elseif(trade:hasItemQty(18652,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18666); -- Mandau 95
	  
	 elseif(trade:hasItemQty(18666,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19840); -- Mandau 99 afterglow

	 elseif(trade:hasItemQty(19840,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20556); -- Mandau 99 119 Afterglow

        	
	elseif(trade:hasItemQty(18306,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18307); -- Apocalypse 80
     
	 elseif(trade:hasItemQty(18307,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18644); -- Apocalypse 85

     elseif(trade:hasItemQty(18644,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18658); -- Apocalypse 90
      
	 elseif(trade:hasItemQty(18658,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18672); -- Apocalypse 95
	  
	 elseif(trade:hasItemQty(18672,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19846); -- Apocalypse 99 No afterglow

	 elseif(trade:hasItemQty(19846,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20881); -- Apocalypse 99 Afterglow	
		 
	 elseif(trade:hasItemQty(18264,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18265); -- Spharai 80
     
	 elseif(trade:hasItemQty(18265,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18637); -- Spharai 85

     elseif(trade:hasItemQty(18637,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18651); -- Spharai 90
      
	 elseif(trade:hasItemQty(18651,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18665); -- Spharai 95
	  
	 elseif(trade:hasItemQty(18665,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19839); -- Spharai 99 No afterglow

	 elseif(trade:hasItemQty(19839,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20481); -- Spharai 99 Afterglow	

    
        elseif(trade:hasItemQty(18276,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18277); -- Excalibur 80
     
	 elseif(trade:hasItemQty(18277,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18639); -- Excalibur 85

     elseif(trade:hasItemQty(18639,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18653); -- Excalibur 90
      
	 elseif(trade:hasItemQty(18653,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18667); -- Excalibur 95
	  
	 elseif(trade:hasItemQty(18667,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19841); -- Excalibur 99 No afterglow

	 elseif(trade:hasItemQty(19841,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20646); -- Excalibur 99 Afterglow		 
		 
	elseif(trade:hasItemQty(18282,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18283); -- Ragnarok 80
     
	 elseif(trade:hasItemQty(18283,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18640); -- Ragnarok 85

     elseif(trade:hasItemQty(18640,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18654); -- Ragnarok 90
      
	 elseif(trade:hasItemQty(18654,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18668); -- Ragnarok 95
	  
	 elseif(trade:hasItemQty(18668,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19842); -- Ragnarok 99 No afterglow

        elseif(trade:hasItemQty(18288,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18289); -- Guttler 80
     
	 elseif(trade:hasItemQty(18289,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18641); -- Guttler 85

     elseif(trade:hasItemQty(18641,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18655); -- Guttler 90
      
	 elseif(trade:hasItemQty(18655,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18669); -- Guttler 95
	  
	 elseif(trade:hasItemQty(18669,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19843); -- Guttler 99 No afterglow

	 elseif(trade:hasItemQty(19843,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20791); -- Guttler 99 Afterglow	 
		 
	elseif(trade:hasItemQty(18300,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18301); -- Gungnir 80
     
	 elseif(trade:hasItemQty(18301,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18643); -- Gungnir 85

     elseif(trade:hasItemQty(18643,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18657); -- Gungnir 90
      
	 elseif(trade:hasItemQty(18657,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18671); -- Gungnir 95
	  
	 elseif(trade:hasItemQty(18671,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19845); -- Gungnir 99 No afterglow

	 elseif(trade:hasItemQty(19845,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(20926); -- Gungnir 99 Afterglow	
		 
	elseif(trade:hasItemQty(18324,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18325); -- mjollnir 80

 elseif(trade:hasItemQty(18325,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18647); -- Mjollnir 85

     elseif(trade:hasItemQty(18647,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18661); -- Mjollnir 90
      
	 elseif(trade:hasItemQty(18661,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18675); -- Mjollnir 95
	  
	 elseif(trade:hasItemQty(18675,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19849); -- Mjollnir 99 No afterglow

	 elseif(trade:hasItemQty(19849,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(21061); -- Mjollnir 99 Afterglow


     elseif(trade:hasItemQty(18330,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18331); -- Claustrum 80
     
	 elseif(trade:hasItemQty(18331,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18648); -- Claustrum 85

     elseif(trade:hasItemQty(18648,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18662); -- Claustrum 90
      
	 elseif(trade:hasItemQty(18662,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18676); -- Claustrum 95
	  
	 elseif(trade:hasItemQty(18676,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19850); -- Claustrum 99 No afterglow

	 elseif(trade:hasItemQty(19850,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(21136); -- Claustrum 99 Afterglow
		 
		 
	elseif(trade:hasItemQty(18336,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18337); -- Annihilator 80
     
	 elseif(trade:hasItemQty(18337,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18649); -- Annihilator 85

     elseif(trade:hasItemQty(18649,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18663); -- Annihilator 90
      
	 elseif(trade:hasItemQty(18663,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18677); -- Annihilator 95
	  
	 elseif(trade:hasItemQty(18677,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19851); -- Annihilator 99 No afterglow

	 elseif(trade:hasItemQty(19851,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(21261); -- Annihilator 99 Afterglow	

    elseif(trade:hasItemQty(18348,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18349); -- Yoichinoyumi 80
     
	 elseif(trade:hasItemQty(18349,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18650); -- Yoichinoyumi 85

     elseif(trade:hasItemQty(18650,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18664); -- Yoichinoyumi 90
      
	 elseif(trade:hasItemQty(18664,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18678); -- Yoichinoyumi 95
	  
	 elseif(trade:hasItemQty(18678,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(19852); -- Yoichinoyumi 99 No afterglow

	 elseif(trade:hasItemQty(19852,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(21211); -- Yoichinoyumi 99 Afterglow	


    elseif(trade:hasItemQty(18342,1) == true and trade:hasItemQty(270,1) == true and trade:hasItemQty(267,1) == true and trade:hasItemQty(266,1) == true and trade:getItemCount() == 4) then 
player:tradeComplete();
		 player:addItem(18577); -- Gjallarhorn 80
     
	 elseif(trade:hasItemQty(18577,1) == true and trade:hasItemQty(1750,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18578); -- Gjallarhorn 85

     elseif(trade:hasItemQty(18578,1) == true and trade:hasItemQty(1752,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18579); -- Gjallarhorn 90
      
	 elseif(trade:hasItemQty(18579,1) == true and trade:hasItemQty(1753,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18580); -- Gjallarhorn 95
	  
	 elseif(trade:hasItemQty(18580,1) == true and trade:hasItemQty(1754,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18840); -- Gjallarhorn 99 No afterglow

	 elseif(trade:hasItemQty(18840,1) == true and trade:hasItemQty(1751,1) == true and trade:getItemCount() == 2) then 
player:tradeComplete();
		 player:addItem(18572); -- Gjallarhorn 99 Afterglow	
      
      end
   
  
   

end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   player:startEvent(0x278D);
end; 


-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

   if (csid == 0x278D and option == 1002) then
      player:tradeComplete();
      player:addItem(objecttrade);
      player:messageSpecial(ITEM_OBTAINED,objecttrade);
      
      
   end
end;