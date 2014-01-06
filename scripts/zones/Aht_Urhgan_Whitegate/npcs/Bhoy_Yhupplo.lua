-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Bhoy Yhupplo
--  Type: Assault Mission Giver
--  @pos 127.474 0.161 -30.418 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/besieged");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local rank = getMercenaryRank(player);
local haveimperialIDtag;
local IlrusiAtollPoint = player:getAssaultPoint(ILRUSI_ASSAULT_POINT);
  if (player:hasKeyItem(IMPERIAL_ARMY_ID_TAG))then
   haveimperialIDtag = 1;
   else
   haveimperialIDtag = 0;
  end
    if(rank > 0 )then
    player:startEvent(0x0115,rank,haveimperialIDtag,IlrusiAtollPoint);
    else
	player:startEvent(0x011b); -- no rank
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    local itemID = 0;  
	local pointlost = 0;
	-- printf("CSID: %u",csid);
	printf("RESULT: %u",option);
	if(csid == 0x0115)then
	  if (option == 657)then -- Golden Salvage
	    player:addMission(ASSAULT,GOLDEN_SALVAGE);
      --elseif (option == ??)then--Lamia No.13
	  --player:addMission(ASSAULT,LAMIA_NO_13);
      --elseif (option == ??)then--Extermination
	  --player:addMission(ASSAULT,EXTERMINATION);
     -- elseif (option == ??)then--Demolition Duty
	  --player:addMission(ASSAULT,DEMOLITION_DUTY);
     -- elseif (option == ??)then--Searat Salvation
	 -- player:addMission(ASSAULT,SEARAT_SALVATION);
     -- elseif (option == ??)then--Apkallu Seizure
	  --player:addMission(ASSAULT,APKALLU_SEIZURE);
     -- elseif (option == ??)then--Lost and Found
	 -- player:addMission(ASSAULT,LOST_AND_FOUND);
     -- elseif (option == ??)then--Deserter
	 -- player:addMission(ASSAULT,DESERTER);
     -- elseif (option == ??)then--Desperately
	  --player:addMission(ASSAULT,DESPERATELY_SEEKING_CEPHALOPODS);
     -- elseif (option == ??)then--Bellerophon's Bliss 
	  --player:addMission(ASSAULT,BELLEROPHON_S_BLISS);
	  elseif (option == 16386)then--Velocity Earring 3,000
	    itemID = 15974 ;   pointlost = 3000 ;
	  elseif (option == 32770)then--Garrulous Ring 5,000
	    itemID = 15779 ;   pointlost = 5000 ;		
	  elseif (option == 49154)then--Grandiose Chain 8,000
	    itemID = 15525 ;   pointlost = 8000 ;	
	  elseif (option == 65538)then--Hurling Belt 10,000
	    itemID = 15888 ;   pointlost = 10000 ;	
	  elseif (option == 81922)then--Invigorating Cape 10,000
	    itemID = 15494 ;   pointlost = 10000 ;
	  elseif (option == 98306)then --Imperial Kaman 15,000
	    itemID = 18685 ;   pointlost = 15000 ;		
	  elseif (option == 114690)then--Storm Zaghnal 15,000
	    itemID = 18065  ;   pointlost = 15000 ;
	  elseif (option == 131074)then--Storm Fife 15,000
	    itemID = 17851 ;   pointlost = 15000 ;			
	  elseif (option == 147458)then--Yigit Turban 20,000
	    itemID =  16064  ;   pointlost = 20000 ;	
	  elseif (option == 163842)then 
	    itemID = 15604 ;   pointlost = 20000 ;--Amir Dirs 20,000		
	  elseif (option == 180226)then -- Pahluwan Khazagand 
	    itemID =  14530;   pointlost = 20000 ;
	  end  
	  if (option == 657)then --  add other assault option here !
	     player:delKeyItem(IMPERIAL_ARMY_ID_TAG);
		 player:addKeyItem(ILRUSI_ASSUALT_ORDERS);
		 player:messageSpecial(KEYITEM_OBTAINED,ILRUSI_ASSUALT_ORDERS);
	  end
	  if(itemID > 0)then
	     player:addItem(itemID);
		 player:messageSpecial(ITEM_OBTAINED,itemID);
		 player:delAssaultPoint(ILRUSI_ASSAULT_POINT,pointlost);
	  end	
	end	
end;

