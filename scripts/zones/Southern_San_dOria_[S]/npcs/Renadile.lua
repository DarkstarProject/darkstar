-----------------------------------
-- Area: Southern San d'Oria [S]
--  NPC: Renadile
-- Armor Storage NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/armorstorage");
-----------------------------------

function onTrade(player,npc,trade)
    dsp.armorStorage.onTrade(player, trade, 626);
end;

function onTrigger(player,npc)
    dsp.armorStorage.onTrigger(player, 627);
end;

function onEventUpdate(player,csid,option)
    dsp.armorStorage.onEventUpdate(player, csid, option, 627);
end;

function onEventFinish(player,csid,option)
    dsp.armorStorage.onEventFinish(player, csid, option, 626, 627);
end;