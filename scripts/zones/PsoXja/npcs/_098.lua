-----------------------------------
-- Area: Pso'Xja
--  NPC: _098 (Stone Gate)
-- Notes: Spawns Gargoyle when triggered
-- !pos 258.399 -1.925 -70.000 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)

    if ((trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1 and player:getMainJob() == JOBS.THF) then

        local X=player:getXPos();

        if (npc:getAnimation() == 9) then
            if (X >= 259) then
                if (GetMobAction(16814089) == 0) then
                    local Rand = math.random(1,2); -- estimated 50% success as per the wiki
                    if (Rand == 1) then -- Spawn Gargoyle
                        player:messageSpecial(DISCOVER_DISARM_FAIL + 0x8000, 0, 0, 0, 0, true);
                        SpawnMob(16814089):updateClaim(player); -- Gargoyle
                    else
                        player:messageSpecial(DISCOVER_DISARM_SUCCESS + 0x8000, 0, 0, 0, 0, true);
                        npc:openDoor(30);
                    end
                    player:tradeComplete();
                else
                    player:messageSpecial(DOOR_LOCKED);
                end
            end
        end
    end

end;

function onTrigger(player,npc)

    local X=player:getXPos();

    if (npc:getAnimation() == 9) then
        if (X >= 259) then
            if (GetMobAction(16814089) == 0) then
                local Rand = math.random(1,10);
                if (Rand <=9) then -- Spawn Gargoyle
                    player:messageSpecial(TRAP_ACTIVATED + 0x8000, 0, 0, 0, 0, true);
                    SpawnMob(16814089):updateClaim(player); -- Gargoyle
                else
                    player:messageSpecial(TRAP_FAILS + 0x8000, 0, 0, 0, 0, true);
                    npc:openDoor(30);
                end
            else
                player:messageSpecial(DOOR_LOCKED);
            end
        elseif (X <= 258) then
            player:startEvent(26);
        end
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    if (csid == 26 and option == 1) then
        player:setPos(260,-0.25,-20,254,111);
    end
end;