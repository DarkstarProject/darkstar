-----------------------------------
--  Area: Dynamis-Tavnazia
--  NPC:  ???
--  @pos 
-----------------------------------
package.loaded["scripts/zones/Dynamis-Tavnazia/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Tavnazia/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (GetServerVariable("[DynaTavnazia]Boss_Trigger")== 0 and trade:getItemCount() == 1  and trade:hasItemQty(3459,1) ) then
        
		local npcX = npc:getXPos();
		local npcY = npc:getYPos();
		local npcZ = npc:getZPos();
		
		local DiabolosID = TavnaziaDiabolosList[math.random(1,4)];
		
			local ShortID = GetMobByID(DiabolosID):getShortID()	
		                SpawnMob(DiabolosID):updateClaim(player);
			            GetMobByID(DiabolosID):setMobMod(MOBMOD_SUPERLINK,ShortID);
						GetMobByID(DiabolosID):setPos(npcX-1,npcY-2,npcZ-1);
						GetMobByID(DiabolosID):setSpawn(npcX-1,npcY-2,npcZ-1);		 
	--printf("DiabolosID: %u",DiabolosID);	 
	

            if (DiabolosID == 16949252) then -- diabolos smn				
		        SpawnMob(16949253):setMobMod(MOBMOD_SUPERLINK, ShortID);
						GetMobByID(16949253):setPos(npcX-1,npcY-2,npcZ-1);
						GetMobByID(16949253):setSpawn(npcX-1,npcY-2,npcZ-1);					
				SpawnMob(16949254):setMobMod(MOBMOD_SUPERLINK, ShortID);
						GetMobByID(16949254):setPos(npcX-3,npcY-2,npcZ-1);
						GetMobByID(16949254):setSpawn(npcX+3,npcY-2,npcZ-1);					
		    end
			
        SetServerVariable("[DynaTavnazia]Boss_Trigger",1);
	    player:tradeComplete();	
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
     player:messageSpecial(DIABOLOS,3459);
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

end;