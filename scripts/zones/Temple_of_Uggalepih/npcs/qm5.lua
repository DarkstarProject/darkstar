-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Crimson-toothed Pawberry NM)
-- !pos -39 -24 27 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs");

function onTrade(player,npc,trade)
    -- Trade Uggalepih Offering
    if (
        trade:hasItemQty(1183,1) and trade:getItemCount() == 1 and
        os.time() > GetServerVariable("[POP]Crimson-toothed_Pawberry") and
        not GetMobByID(ID.mob.CRIMSON_TOOTHED_PAWBERRY):isSpawned() and
        not GetMobByID(ID.mob.CRIMSON_TOOTHED_PAWBERRY + 2):isSpawned()
    ) then
        player:tradeComplete();
        SpawnMob(ID.mob.CRIMSON_TOOTHED_PAWBERRY):updateClaim(player);
        SpawnMob(ID.mob.CRIMSON_TOOTHED_PAWBERRY + 2):updateClaim(player);
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NM_OFFSET + 1);
end;
