-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Death From Above NM)
-- Involved In Mission: Death From Above
-- !pos 53 1 -32 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs");

function onTrade(player,npc,trade)
    -- Trade Bee Larvae
    if (trade:hasItemQty(1267,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.DEATH_FROM_ABOVE):isSpawned()) then
        player:tradeComplete();
        SpawnMob(ID.mob.DEATH_FROM_ABOVE):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NM_OFFSET + 4);
end;
