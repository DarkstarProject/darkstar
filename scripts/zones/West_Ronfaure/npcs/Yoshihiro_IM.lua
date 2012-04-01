-----------------------------------
-- Area: West Ronfaure
-- NPC:  Yoshihiro, I.M.
-- Outpost Conquest Guards
-- @zone 100
-- @pos -450.571 -20.807 -219.970
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/conquestguards");
require("scripts/zones/West_Ronfaure/TextIDs");

guardnation = BASTOK;	-- SANDORIA, BASTOK, WINDURST, 4 = jeuno
guardtype 	= 3;		-- 1: city, 2: foreign, 3: outpost, 4: border
region 		= RONFAURE;
csid 		= 0x7ff9;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:hasKeyItem(70 + region) and player:getNation() == guardnation) then
		if(supplyRunFresh(player) == 1) then
			player:startEvent(csid,16,0,0,0,1,0,0,255); -- you have brought us supplies !
		else
			player:showText(npc, CONQUEST - 1); -- "Hmm... These supplies you have brought us are too old to be of any use."
			player:delKeyItem(70 + region);
			player:messageSpecial(KEYITEM_OBTAINED + 1, 70 + region);
			player:setVar("supplyQuest_region",0);
		end
	else
		arg1 = getArg1(guardnation, player) - 1;
		if(arg1 >= 1792) then -- foreign, non-allied
			player:startEvent(csid,1808,0,0,0,0,player:getRank(),0,0);
		else -- citizen or allied
			player:startEvent(csid,arg1,0,0x3F0000,0,0,getArg6(player),0,0);
		end
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);

	if(option == 1) then
		duration = (player:getRank() + getNationRank(player:getNation()) + 3) * 3600;
		player:delStatusEffect(EFFECT_SIGNET);
		player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
	elseif(option == 2) then
		player:delKeyItem(70 + region);
		addCP(player,supplyReward[region - 4])
		player:messageSpecial(CONQUEST); -- "You've earned conquest points!"
		if(hasOutpost(player, region) == 0) then
			supply_quests = player:getVar("supplyQuest_BASTOK");
			supply_quests = supply_quests + 2^region;
			player:setVar("supplyQuest_BASTOK",supply_quests);
			player:setVar("supplyQuest_region",0);
		end
	elseif(option == 4) then
		SetHPGil = giltosetHP(guardnation,player);
		if(player:getGil() >= SetHPGil) then
			player:removeGil(SetHPGil);
			player:setHomePoint();
			player:specialMessage(CONQUEST + 89); -- "Your home point has been set."
		else
			player:specialMessage(CONQUEST + 90); -- "You do not have enough gil to set your home point here."
		end
	end

end;