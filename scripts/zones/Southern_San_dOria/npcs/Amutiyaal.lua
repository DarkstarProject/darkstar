-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Amutiyaal
--  Warp NPC (Aht Urhgan)
--	@pos 116 0.1 84 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria/TextIDs");

--[[
Bitmask Designations:
Southern San d'Oria (East to West)
00001    (K-5) Daggao (Lion Springs Tavern) 
00002    (J-9) Authere (a small boy under a tree to the east of the Auction House) 
00004    (I-8) Rouva (under a tree in west Victory Square) 
00008    (I-8) Femitte (Rouva's attache) 
00010    (G-8) Deraquien (guarding entrance to Watchdog Alley) 

Northern San d'Oria (South to North)
00020    (I-9) Giaunne (west of the fountain) 
00040    (J-8) Anilla (north of the fountain) 
00080    (J-8) Maloquedil (east of Anilla, under a tree) 
00100    (H-8) Phairupegiont (north of Windurstian Consul, looking into the moat) 
00200    (E-4) Bertenont (upstairs outside the Royal Armoury) 

Port San d'Oria (West to East)
00400    (G-7) Perdiouvilet (Rusty Anchor Pub) 
00800    (H-8) Pomilla (outside the Rusty Anchor, watching Joulet fish) 
01000    (H-8) Cherlodeau (just before the docks where two fisherman are having a contest) 
02000    (H-10) Parcarin (on top of the Auction House) 
04000    (J-8) Rugiette (Regine's Magicmart) 

Chateau d'Oraguille (East to West)
08000    (I-9) Curilla (Temple Knights' Quarters) 
10000    (I-9) Halver (main room) 
20000    (H-9) Rahal (Royal Knights' Quarters) 
40000    (H-7) Perfaumand (guarding Prince Royal Trion I d'Oraguille's Room) 
80000    (F-7) Chalvatot (Her Majesty's garden) 
--]]

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	if (trade:getGil() == 300 and trade:getItemCount() == 1 and player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_COMPLETED and player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then 
		-- Needs a check for at least traded an invitation card to Naja Salaheem
		player:startEvent(0x0371);
	end
	
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------

function onTrigger(player,npc)

	local LureSandy = player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA);
	local WildcatSandy = player:getVar("WildcatSandy");
	
	if (LureSandy ~= QUEST_COMPLETED and ENABLE_TOAU == 1) then
		if (LureSandy == QUEST_AVAILABLE) then
			player:startEvent(0x032c);
		else
			if (WildcatSandy == 0) then
				player:startEvent(0x032d);
			elseif (player:isMaskFull(WildcatSandy,20) == true) then
				player:startEvent(0x032f);
			else
				player:startEvent(0x032e);
			end
		end
	elseif (player:getCurrentMission(TOAU) >= 2) then
		player:startEvent(0x0370);
	else
		player:startEvent(0x0330);
	end
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
	if (csid == 0x032c) then
		player:addQuest(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA);
		player:setVar("WildcatSandy",0);
		player:addKeyItem(RED_SENTINEL_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED,RED_SENTINEL_BADGE);
	elseif (csid == 0x032f) then
		player:completeQuest(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA);
		player:addFame(SANDORIA,150);
		player:setVar("WildcatSandy",0);
		player:delKeyItem(RED_SENTINEL_BADGE);
		player:addKeyItem(RED_INVITATION_CARD);
		player:messageSpecial(KEYITEM_LOST,RED_SENTINEL_BADGE);
		player:messageSpecial(KEYITEM_OBTAINED,RED_INVITATION_CARD);
	elseif (csid == 0x0371) then
		player:tradeComplete();
		toAhtUrhganWhitegate(player);
	end
end;