-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Coullene
--  Type: Involved in Quest (Flyers for Regine)
--  @zone: 231
--  @pos 146.420 0.000 127.601
--
-----------------------------------

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) ==QUEST_ACCEPTED) then
	if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeCoulene") == 0) then 
		player:messageSpecial(11932);
		player:setVar("FFR",player:getVar("FFR") - 1);
		player:setVar("tradeCoulene",1);
		player:messageSpecial(FLYER_ACCEPTED);
		trade:complete();
	elseif (player:getVar("tradeCoulene") ==1) then
		player:messageSpecial(11936);
	end
end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:showText(npc,COULLENE_DIALOG);
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
