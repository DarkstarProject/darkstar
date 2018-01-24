-----------------------------------
-- Area: Misareaux_Coast
-- NPC:  ??? (Spawn Ziphius)
-- !pos 253 -16 411.5 25
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Misareaux_Coast/TextIDs");
require("scripts/zones/Misareaux_Coast/MobIDs");
require("scripts/globals/npc_util");

function onTrade(player,npc,trade)
    local baited = GetServerVariable("[Ziphius]Bait Trap");

    -- Trade Slice of Carp
    if (npcUtil.tradeHas(trade, 16994) and bit.band(baited, bit.lshift(1, (npc:getID() - ZIPHIUS_QM_BASE))) == 0) then
        baited = bit.bor(baited, bit.lshift(1, (npc:getID() - ZIPHIUS_QM_BASE)));
        player:tradeComplete();
        player:messageSpecial(PUT_IN_TRAP, 16994)
        SetServerVariable("[Ziphius]Bait Trap", baited);
    end
end;

function onTrigger(player,npc)
    local baited = GetServerVariable("[Ziphius]Bait Trap");

    if (VanadielHour() >= 22 or VanadielHour() < 4) then
        if (bit.band(baited, bit.lshift(1, (npc:getID() - ZIPHIUS_QM_BASE))) == 0) then
            player:messageSpecial(APPEARS_TO_BE_TRAP);
        else
            player:messageSpecial(NOTHING_HERE_YET);
        end
    elseif (VanadielHour() >= 4 and VanadielHour() < 7) then
        if (bit.band(baited, bit.lshift(1, 11)) == 0) then
            if (math.random(1,1000) <= 176) then
                SpawnMob(ZIPHIUS):updateClaim(player);
                GetMobByID(ZIPHIUS):setPos(npc:getXPos(),npc:getYPos(),npc:getZPos()-1);
                npc:setStatus(STATUS_DISAPPEAR);
                for i = 6, 11, 1 do
                    baited = bit.bor(baited, bit.lshift(1, i));
                    SetServerVariable("[Ziphius]Bait Trap", baited);
                end
            else
                player:messageSpecial(DID_NOT_CATCH_ANYTHING);
            end
            baited = bit.bor(baited, bit.lshift(1, 11));
            SetServerVariable("[Ziphius]Bait Trap", baited);
        else
            player:messageSpecial(DID_NOT_CATCH_ANYTHING);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;