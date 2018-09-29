-----------------------------------
-- Area: Palborough Mines
--  NPC: ???
-- Involved In Quest: The Talekeeper's Truth
-- @zone 143
-- !pos 15 -31 -94
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Palborough_Mines/TextIDs");
require("scripts/zones/Palborough_Mines/MobIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("theTalekeeperTruthCS") == 3 and not GetMobByID(NI_GHU_NESTFENDER):isSpawned()) then
        player:messageSpecial(SENSE_OF_FOREBODING);
        SpawnMob(NI_GHU_NESTFENDER):updateClaim(player);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
