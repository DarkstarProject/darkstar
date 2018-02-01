-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Granite Door
-- Notes: Door blocked by Temple Guardian
-- !pos -62 0 -99 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/zones/Temple_of_Uggalepih/MobIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local guardian = GetMobByID(TEMPLE_GUARDIAN);

    if ( npc:getAnimation() == 9) then
        player:messageSpecial(PROTECTED_BY_UNKNOWN_FORCE);
    end

    if (guardian ~= nil and guardian:getHP() > 0 and guardian:getTarget() == nil) then
        guardian:updateClaim(player);
    end

    return 1;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
