-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Beryl-footed Molberry NM)
-- !pos -57 0 4 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");

function onTrade(player,npc,trade)
    -- Trade Tonberry Rattle
    if (
        trade:hasItemQty(1266,1) and trade:getItemCount() == 1 and
        os.time() > GetServerVariable("[POP]Beryl-footed_Molberry") and
        not GetMobByID(BERYL_FOOTED_MOLBERRY):isSpawned()
    ) then
        player:tradeComplete();
        SpawnMob(BERYL_FOOTED_MOLBERRY):updateClaim(player);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(NM_OFFSET);
end;
