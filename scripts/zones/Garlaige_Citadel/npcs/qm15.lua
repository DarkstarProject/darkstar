-----------------------------------
-- Area: Garlaige Citadel
--  NPC: qm15 (???)
-- Involved in Quest: Hitting the Marquisate (THF AF3)
-- !pos 19.893 -5.500 325.767 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Garlaige_Citadel/TextIDs");
require("scripts/zones/Garlaige_Citadel/MobIDs");
-----------------------------------

function onTrade(player, npc, trade)
end;

function onTrigger(player, npc)
    local nm = GetMobByID(CHANDELIER);
    if (
        player:getVar("hittingTheMarquisateHagainCS") == 8 and
        os.time() > GetNPCByID(CHANDELIER_QM):getLocalVar("pop") and
        not nm:isSpawned()
    ) then
        player:messageSpecial(HEAT_FROM_CEILING);
        nm:spawn();
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
