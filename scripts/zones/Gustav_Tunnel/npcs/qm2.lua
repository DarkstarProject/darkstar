-----------------------------------
-- Area: Gustav tunnel
--  NPC: qm2 (???)
-- Note: Part of mission "The Salt of the Earth"
-- !pos -130 1.256 252.696 212
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gustav_Tunnel/TextIDs");
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local basty = player:getCurrentMission(BASTOK);
    local soteStat = player:getVar("BASTOK91");
    
    local anyPlasmsAlive = false;
    for i = GIGAPLASM, GIGAPLASM + 14 do
        if (GetMobByID(i):isAlive()) then
            anyPlasmsAlive = true;
            break;
        end
    end

    if (basty == THE_SALT_OF_THE_EARTH and soteStat == 2 and not anyPlasmsAlive) then
        SpawnMob(GIGAPLASM):updateClaim(player);
    elseif (basty == THE_SALT_OF_THE_EARTH and soteStat == 3 and not player:hasKeyItem(dsp.ki.MIRACLESALT)) then
        player:addKeyItem(dsp.ki.MIRACLESALT);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.MIRACLESALT);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
