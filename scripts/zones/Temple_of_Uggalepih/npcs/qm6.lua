-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Sacrificial Goblet NM)
-- !pos 300 1 255 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs");

function onTrade(player,npc,trade)
    -- Trade Uggalepih Whistle
    if (trade:hasItemQty(1184,1) and trade:getItemCount() == 1 and not GetMobByID(ID.mob.SACRIFICIAL_GOBLET):isSpawned()) then
        player:tradeComplete();
        SpawnMob(ID.mob.SACRIFICIAL_GOBLET):updateClaim(player);
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;
