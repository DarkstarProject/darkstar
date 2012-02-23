-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Endracion
-- @zone 230
-- @pos -110 1 -34
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(trade:hasItemQty(16656,1) and trade:getItemCount() == 1) then -- Trade Orcish Axe
		if(player:getCurrentMission(SANDORIA) == SMASH_THE_ORCISH_SCOUTS) then
			player:startEvent(0x03ea); -- Finish Mission "Smash the Orcish scouts"
		else
			player:startEvent(0x03f2); -- Mission not activated
		end
	elseif(trade:hasItemQty(1112,1) and trade:getItemCount() == 1) then -- Trade Orcish Mail Scales
		if(player:getCurrentMission(SANDORIA) == BAT_HUNT) then
			player:startEvent(0x03eb); -- Finish Mission "Bat Hunt"
		else
			player:startEvent(0x03f2); -- Mission not activated
		end
	else
		player:startEvent(0x03f0); -- Wrong Item
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
-- 0x03f3 for non san d'orians
-- 0x03e8 Start Mission "Smash the Orcish scouts"
-- 0x03ea Finish Mission "Smash the Orcish scouts" by trade 
-- 0x03f0 Qu'est ce que c'est ? je ne veut pas de ca
-- 0x03f2 ecoutez avant de m'apporter quelque chose, vous devez accepter la mission...
-- 0x03f1 menu
-- 0x03e9 terminez d'abord votre mission. Ensuite, vous pourrez en demander une nouvelle
-- 0x03eb Finish Mission "Bat Hunt"
-- 0x03ec Finish Mission "Save the Children" with rank
-- 0x0400 Finish Mission "Save the Children" (repeat)
-- 0x03ed Finish Mission "The Rescue Drill"
-- 0x03ee Finish Mission "The Davoi Report"
-- 0x03ef During Mission "Journey Abroad"
-- 0x03f4 Finish Mission "Infiltrate Davoi"
--0x01f7  0x03f3  0x03e8  0x03ea  0x03f0  0x03f2  0x03f1  0x03e9  0x03eb  0x03ec  0x0400  0x03ed  0x03ee  0x03ef  0x03f4  0x03f5  0x03f7  0x003d  0x040b  0x040d  0x040f  0x0409  0x0411  0x0413  0x0415  0x03fc  0x03fd  0x03fe  0x03ff  0x0401  0x0402  0x0403  0x0404  0x0405  0x0408  0x0406  0x0407
function onTrigger(player,npc)
	
	if(player:getNation() ~= SANDORIA) then
		player:startEvent(0x03F3); -- for Non-San d'Orians
	elseif(player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and player:getVar("saveTheChildrenMissionCS") == 5) then
		if(player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN) == false) then
			player:startEvent(0x03ec); -- Finish Mission "Save the Children" with rank
		else
			player:startEvent(0x0400); -- Finish Mission "Save the Children" (repeat)
		end
	elseif(player:getCurrentMission(SANDORIA) ~= 255) then
		player:startEvent(0x03e9); -- Have mission already activated
	else
		if(player:getRank() == 1 and player:hasCompletedMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS) == false) then
			player:startEvent(0x03e8); -- Start First Mission "Smash the Orcish scouts"
		else
			mission_mask, repeat_mask = getMissionMask(player);
			player:startEvent(0x03F1,mission_mask, 0, 0 ,0 ,0 ,repeat_mask); -- Mission List
		end
	end
	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("onUpdateCSID: %u",csid);
printf("onUpdateOPTION: %u",option);
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("onFinishCSID: %u",csid);
printf("onFinishOPTION: %u",option);
	
	if((csid == 0x03e8 or csid == 0x03F1) and option == 0) then
		player:addMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03ea) then
		player:tradeComplete();
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS);
	elseif(csid == 0x03F1 and option == 101) then
		player:addMission(SANDORIA,BAT_HUNT);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03eb) then
		player:tradeComplete();
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,BAT_HUNT);
	elseif(csid == 0x03F1 and option == 102) then
		if(player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN) == false) then
			player:setVar("saveTheChildrenMissionCS",1);
		else
			player:setVar("saveTheChildrenMissionCS",2);
		end
		player:addMission(SANDORIA,SAVE_THE_CHILDREN);
		player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	elseif(csid == 0x03ec) then
		player:setRank(2);
		player:delKeyItem(ORCISH_HUT_KEY);
		player:setVar("saveTheChildrenMissionCS",6);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,SAVE_THE_CHILDREN);
	elseif(csid == 0x0400) then
		player:delKeyItem(ORCISH_HUT_KEY);
		player:setVar("saveTheChildrenMissionCS",0);
		player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
		player:completeMission(SANDORIA,SAVE_THE_CHILDREN);
	end
	
end;