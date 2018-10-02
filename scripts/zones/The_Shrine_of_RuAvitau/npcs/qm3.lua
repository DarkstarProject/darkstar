-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  ??? (Spawn Ullikummi)
-- !pos 739 -99 -581 178
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    if (not GetMobByID(ID.mob.ULLIKUMMI):isSpawned() and trade:hasItemQty(2388,1) and trade:getItemCount() == 1) then -- Trade Diorite
        player:tradeComplete();
        SpawnMob(ID.mob.ULLIKUMMI):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
