-----------------------------------
-- Area: Qufim Island
-- NPC: Trodden Snow
-- Mission: ASA - THAT_WHICH_CURDLES_BLOOD
-- @zone 126
-- @pos -19 -17 104
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Qufim_Island/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Enfeebling Kit
    if (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD) then
	local item = 0;
	local asaStatus = player:getVar("ASA_Status");
    					
    	-- TODO: Other Enfeebling Kits
    	if(asaStatus == 0) then
    		item = 2779;
    	else
    		printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
	end
    
    	if(trade:getItemCount() == 1 and trade:hasItemQty(item,1)) then
    		player:tradeComplete();
		player:startEvent(0x002c);
	end
    end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
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
    
    if(csid==0x002c) then
    	player:addKeyItem(DOMINAS_SCARLET_SEAL);
    	player:messageSpecial(KEYITEM_OBTAINED,DOMINAS_SCARLET_SEAL);
    	player:addKeyItem(DOMINAS_CERULEAN_SEAL);
    	player:messageSpecial(KEYITEM_OBTAINED,DOMINAS_CERULEAN_SEAL);
    	player:addKeyItem(DOMINAS_EMERALD_SEAL);
    	player:messageSpecial(KEYITEM_OBTAINED,DOMINAS_EMERALD_SEAL);
    	player:addKeyItem(DOMINAS_AMBER_SEAL);
    	player:messageSpecial(KEYITEM_OBTAINED,DOMINAS_AMBER_SEAL);
    	player:addKeyItem(DOMINAS_VIOLET_SEAL);
    	player:messageSpecial(KEYITEM_OBTAINED,DOMINAS_VIOLET_SEAL);
    	player:addKeyItem(DOMINAS_AZURE_SEAL);
    	player:messageSpecial(KEYITEM_OBTAINED,DOMINAS_AZURE_SEAL);
    	
    	player:completeMission(ASA,THAT_WHICH_CURDLES_BLOOD);
	player:addMission(ASA,SUGAR_COATED_DIRECTIVE);
	player:setVar("ASA_Status",0);
    end
end;