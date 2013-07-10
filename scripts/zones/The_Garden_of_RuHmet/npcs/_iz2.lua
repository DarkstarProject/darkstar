-----------------------------------
--  Area: the dargen of ruhmet
--  NPC:  Ebon_Panel
--  @pos 
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
  --printf("npcid: %u",npc:getID());
  local Race = player:getRace();
 -- printf("race: %u",Race);
    if(player:getCurrentMission(COP) ==  WHEN_ANGELS_FALL  and player:getVar("PromathiaStatus")==1)then
      player:startEvent(0x00CA);     
   elseif(player:getCurrentMission(COP) ==  WHEN_ANGELS_FALL  and player:getVar("PromathiaStatus")==2)then		
	switch (npc:getID()) : caseof {
		[16921073] = function (x)-- hume tower
		   if( Race==2 or Race==1)then
		      player:startEvent(0x0078);
		   end	
		end,
		[16921076] = function (x)-- mithra tower
	   	   if( Race==7 )then
		      player:startEvent(0x007C);
		   end
	 	end,			
		[16921077] = function (x)-- elvann tower
		   if( Race==3 or Race==4)then
		   player:startEvent(0x0079);		      
		   end
	 	end,		
		[16921078] = function (x)-- taru tower
		   if( Race==5 or Race==6  )then
		      player:startEvent(0x007B);
		   end
	 	end,
		[16921079] = function (x)-- galka tower
		   if( Race==8)then
		   player:startEvent(0x007A);	      
		   end
	 	end,	
        }	 
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
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
    if(csid == 0x00CA)then
	   player:setVar("PromathiaStatus",2);
	elseif(0x0078 and option ~=0)then --hume
	  player:addTitle(WARRIOR_OF_THE_CRYSTAL);	
	  player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_VAHZL);
	  player:setVar("PromathiaStatus",3);
	  if(player:hasKeyItem(LIGHT_OF_VAHZL) == false)then player:addKeyItem(LIGHT_OF_VAHZL);end
	elseif(0x007C and option ~=0)then --mithra
	player:setVar("PromathiaStatus",3);
	  player:addTitle(WARRIOR_OF_THE_CRYSTAL);	
	  player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_DEM);
	  if(player:hasKeyItem(LIGHT_OF_DEM) == false)then player:addKeyItem(LIGHT_OF_DEM);end
	elseif(0x0079 and option ~=0)then --elvann
	  player:setVar("PromathiaStatus",3);
	  player:addTitle(WARRIOR_OF_THE_CRYSTAL);	
	  player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_MEA);
	  if(player:hasKeyItem(LIGHT_OF_MEA) == false)then player:addKeyItem(LIGHT_OF_MEA);end
	elseif(0x007B and option ~=0)then --taru
	  player:setVar("PromathiaStatus",3);
	  player:addTitle(WARRIOR_OF_THE_CRYSTAL);	
	  player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_HOLLA);
	  if(player:hasKeyItem(LIGHT_OF_HOLLA) == false)then player:addKeyItem(LIGHT_OF_HOLLA);end
	elseif(0x007A and option ~=0)then --galka
    	player:setVar("PromathiaStatus",3);
	  player:addTitle(WARRIOR_OF_THE_CRYSTAL);	
	  player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_ALTAIEU);
	  if(player:hasKeyItem(LIGHT_OF_ALTAIEU) == false)then player:addKeyItem(LIGHT_OF_ALTAIEU);end	   
	end
end;