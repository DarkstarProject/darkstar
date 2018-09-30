-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Genbu's Spawn)
-- Allows players to spawn the HNM Genbu with a Gem of the North and a Winterstone.
-- !pos 257 -70 517 130
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade Gem of the North and Winterstone
    if (not GetMobByID(ID.mob.GENBU):isSpawned() and trade:hasItemQty(1424,1) and trade:hasItemQty(1425,1) and trade:getItemCount() == 2) then
        player:tradeComplete();
        SpawnMob(ID.mob.GENBU):updateClaim(player);
        player:showText(npc,ID.text.SKY_GOD_OFFSET + 5);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.SKY_GOD_OFFSET);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
