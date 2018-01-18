-----------------------------------
-- Area: Xarcabard
-- NPC:  qm7 (???)
-- Involved in Quests: RNG AF3 quest - Unbridled Passion
-- !pos -295.065 -25.054 151.250 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Xarcabard/TextIDs");
require("scripts/zones/Xarcabard/MobIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("unbridledPassion") == 4 and not GetMobByID(KOENIGSTIGER):isSpawned()) then
        player:startEvent(8);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 8) then
        SpawnMob(KOENIGSTIGER):updateClaim(player);
    end
end;
