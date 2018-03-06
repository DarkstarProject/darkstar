-----------------------------------
-- Area: North Gustaberg
--  NPC: qm2 (???)
-- Involved in Quest "As Thick As Thieves"
-- !pos -232.924 99.107 442.990 106
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/North_Gustaberg/TextIDs");
require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");

    if (thickAsThievesGamblingCS == 5 and not GetMobByID():isSpawned(GAMBILOX_WANDERLING)) then
        SpawnMob(GAMBILOX_WANDERLING):updateClaim(player);
    elseif (thickAsThievesGamblingCS == 6) then
        player:startEvent(200,1092);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 200 and npcUtil.giveItem(player, 1092)) then
        player:setVar("thickAsThievesGamblingCS",7);
    end
end;