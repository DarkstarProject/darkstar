-----------------------------------
-- Area:  Bibiki Bay
-- NPC:   ??? (qm1)
-- Notes: Used to spawn Shen
-- !pos -115.108 0.300 -724.664 4
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/zones/Bibiki_Bay/MobIDs");

function onTrade(player,npc,trade)
    if (not GetMobByID(SHEN):isSpawned() and trade:hasItemQty(1823,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(SHEN):updateClaim(player);
        for i = 1, 2 do
            if (not GetMobByID(SHEN+i):isSpawned()) then
                SpawnMob(SHEN+i):updateEnmity(target);
            end
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
