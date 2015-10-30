-----------------------------------
-- Area: Qufim Island
-- NPC: Trodden Snow
-- Mission: ASA - THAT_WHICH_CURDLES_BLOOD
-- Mission: ASA - SUGAR_COATED_DIRECTIVE
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
    	if (asaStatus == 0) then
    		item = 2779;
    	else
    		printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
	end
    
    	if (trade:getItemCount() == 1 and trade:hasItemQty(item,1)) then
    		player:tradeComplete();
		player:startEvent(0x002c);
	end
    end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	--ASA 4 CS: Triggers With At Least 3 Counterseals.
	if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE) then
		local completedSeals = 0;
		
		if (player:hasKeyItem(AMBER_COUNTERSEAL)) then
			completedSeals = completedSeals + 1;
		end;
		
		if (player:hasKeyItem(AZURE_COUNTERSEAL)) then
			completedSeals = completedSeals + 1;
		end;
		
		if (player:hasKeyItem(CERULEAN_COUNTERSEAL)) then
			completedSeals = completedSeals + 1;
		end;
		
		if (player:hasKeyItem(EMERALD_COUNTERSEAL)) then
			completedSeals = completedSeals + 1;
		end;
		
		if (player:hasKeyItem(SCARLET_COUNTERSEAL)) then
			completedSeals = completedSeals + 1;
		end;
		
		if (player:hasKeyItem(VIOLET_COUNTERSEAL)) then
			completedSeals = completedSeals + 1;
		end;
		
		if (completedSeals >= 3) then
			player:setVar("ASA_Status", completedSeals);
			player:startEvent(0x002d);
		end;
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
    
 	if (csid==0x002c) then
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
		player:setVar("ASA4_Amber","0");
		player:setVar("ASA4_Azure","0");
		player:setVar("ASA4_Cerulean","0");
		player:setVar("ASA4_Emerald","0");
		player:setVar("ASA4_Scarlet","0");
		player:setVar("ASA4_Violet","0");
	elseif (csid==0x002d) then
	    	local completedSeals = player:getVar("ASA_Status");

		-- Calculate Reward    	
	    	if (completedSeals == 3) then
	    		player:addGil(GIL_RATE*3000);
	    	elseif (completedSeals == 4) then
	    		player:addGil(GIL_RATE*10000);
	    	elseif (completedSeals == 5) then
	    		player:addGil(GIL_RATE*30000);
	       	elseif (completedSeals == 6) then
	    		player:addGil(GIL_RATE*50000);
	    	end

		-- Clean Up Remaining Key Items    	
		player:delKeyItem(DOMINAS_SCARLET_SEAL);
	    	player:delKeyItem(DOMINAS_CERULEAN_SEAL);
	    	player:delKeyItem(DOMINAS_EMERALD_SEAL);
	    	player:delKeyItem(DOMINAS_AMBER_SEAL);
	    	player:delKeyItem(DOMINAS_VIOLET_SEAL);
	    	player:delKeyItem(DOMINAS_AZURE_SEAL);
    	
	    	player:delKeyItem(SCARLET_COUNTERSEAL);
		player:delKeyItem(CERULEAN_COUNTERSEAL);
		player:delKeyItem(EMERALD_COUNTERSEAL);
		player:delKeyItem(AMBER_COUNTERSEAL);
		player:delKeyItem(VIOLET_COUNTERSEAL);
	    	player:delKeyItem(AZURE_COUNTERSEAL);

		-- Advance Mission    	
	    	player:completeMission(ASA,SUGAR_COATED_DIRECTIVE);
		player:addMission(ASA,ENEMY_OF_THE_EMPIRE_I);
		player:setVar("ASA_Status",0);
    end
end;