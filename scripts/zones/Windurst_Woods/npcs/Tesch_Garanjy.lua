-----------------------------------
-- Area: Windurst Woods
--  NPC: Tesch_Garanjy
-- Armor Storage NPC
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/armorstorage");
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 10027);
end;

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 10028);
end;

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 10028);
end;

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 10027, 10028);
end;