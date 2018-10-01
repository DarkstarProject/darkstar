-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Beryl-footed Molberry NM)
-- !pos -57 0 4 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs");

function onTrade(player,npc,trade)
    -- Trade Tonberry Rattle
    if (
        trade:hasItemQty(1266,1) and trade:getItemCount() == 1 and
        os.time() > GetServerVariable("[POP]Beryl-footed_Molberry") and
        not GetMobByID(ID.mob.BERYL_FOOTED_MOLBERRY):isSpawned()
    ) then
        player:tradeComplete();
        SpawnMob(ID.mob.BERYL_FOOTED_MOLBERRY):updateClaim(player);
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS);
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NM_OFFSET);
end;
