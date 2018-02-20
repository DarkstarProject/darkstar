-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: qm1 (???)
-- !pos 203.939 0.000 -238.811 120
-- Notes: Spawns Dribblix Greasemaw for ACP mission "Gatherer of Light (I)"
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sauromugue_Champaign/TextIDs");
require("scripts/zones/Sauromugue_Champaign/MobIDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (
        not GetMobByID(DRIBBLIX_GREASEMAW):isSpawned() and
        player:hasKeyItem(CHUNK_OF_SMOKED_GOBLIN_GRUB) and
        not player:hasKeyItem(SEEDSPALL_VIRIDIS) and
        not player:hasKeyItem(VIRIDIAN_KEY)
    ) then
        SpawnMob(DRIBBLIX_GREASEMAW):updateClaim(player);
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
