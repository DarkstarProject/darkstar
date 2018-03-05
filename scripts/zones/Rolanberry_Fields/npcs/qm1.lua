-----------------------------------
-- Area: Rolanberry Fields
--  NPC: qm1 (???)
-- !pos -686.216 -31.556 -369.723 110
-- Notes: Spawns Chuglix Berrypaws for ACP mission "Gatherer of Light (I)"
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Rolanberry_Fields/TextIDs");
require("scripts/zones/Rolanberry_Fields/MobIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (
        not GetMobByID(CHUGLIX_BERRYPAWS):isSpawned() and
        player:hasKeyItem(JUG_OF_GREASY_GOBLIN_JUICE) and
        not player:hasKeyItem(SEEDSPALL_CAERULUM) and
        not player:hasKeyItem(VIRIDIAN_KEY)
    ) then
        SpawnMob(CHUGLIX_BERRYPAWS):updateClaim(player);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
