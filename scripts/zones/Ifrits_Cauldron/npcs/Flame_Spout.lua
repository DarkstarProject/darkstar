----------------------------------
-- Area: Ifrit's Cauldron
-- NPC: Flame Spout
-- @pos 193.967 -0.400 19.492 205
-----------------------------------

require("scripts/zones/Ifrits_Cauldron/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   local npcid = npc:getID();
   if (trade:getItemCount() == 1 and trade:hasItemQty(4105,1) == true) then -- Ice Cluster Trade
      GetNPCByID(npcid+5):openDoor(90);
      player:tradeComplete();
   end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- printf("%u",npc:getID())
	local npcid = npc:getID();
	
   -- Commented out to preserve CSIDs for the quest, since the workaround was removed.
	--[[if (npcid == 17617204) then
		player:startEvent(0x000b);
	elseif (npcid == 17617205) then
		player:startEvent(0x000c);
	elseif (npcid == 17617206) then
		player:startEvent(0x000d);
	elseif (npcid == 17617207) then
		player:startEvent(0x000e);
	end]]
	
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
end;