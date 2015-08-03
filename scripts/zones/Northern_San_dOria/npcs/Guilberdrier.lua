-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Guilberdrier
--  Type: Standard Info NPC
--  Involved in Quest: Flyers for Regine, Exit the Gambler
--  @zone: 231
--  @pos -159.082 12.000 253.794
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) ==QUEST_ACCEPTED) then
if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeGuilberdrier") == 0) then 
player:messageSpecial(11936);
player:setVar("FFR",player:getVar("FFR") - 1);
player:setVar("tradeGuilberdrier",1);
		player:messageSpecial(FLYER_ACCEPTED);
		trade:complete();
elseif (player:getVar("tradeGuilberdrier") ==1) then
player:messageSpecial(11936);
end
end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x020a);	
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
