-----------------------------------
-- Area: Ilrusi Atoll
--  NPC: Treasure Coffer
-----------------------------------
package.loaded["scripts/zones/Ilrusi_Atoll/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Ilrusi_Atoll/TextIDs");
require("scripts/zones/Ilrusi_Atoll/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(CHEST);
    
    local npcID = npc:getID();

    if (npcID == GetServerVariable("correctcoffer")) then
        GetNPCByID(npcID):setAnimation(89); --coffer open anim
        player:messageSpecial(GOLDEN);
        if (player:getCurrentMission(ASSAULT) == GOLDEN_SALVAGE) then
            player:completeMission(ASSAULT, GOLDEN_SALVAGE);
        end
        GetNPCByID(ILRUSI_ANCIENT_LOCKBOX):setStatus(dsp.status.NORMAL);
        ILRUSI_ATOLL.despawnMimics();
    else
        SpawnMob(npcID);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
