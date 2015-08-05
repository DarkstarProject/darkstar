-----------------------------------
--  Area: Western Adoulin
--  NPC: Divainy-Gamainy
--  @zone 256
--  @pos 
--
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Western_Adoulin/TextIDs");
require("scripts/globals/armor_upgrade");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

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
