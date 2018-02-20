-----------------------------------
-- Area: Pso'Xja
--  NPC: _09d (Stone Gate)
-- Notes: Spawns Gargoyle when triggered
-- !pos 301.600 -1.925 -10.000 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/PsoXja/TextIDs");
require("scripts/zones/PsoXja/MobIDs");
require("scripts/globals/status");
-----------------------------------

function attemptPickLock(player, npc, correctSideOfDoor)
    if (npc:getAnimation() == ANIMATION_CLOSE_DOOR and correctSideOfDoor) then
        local offset = npc:getID() - STONE_DOOR_OFFSET;
        local gargoyle = GARGOYLE_OFFSET + offset;

        if (GetMobByID(gargoyle):isSpawned()) then
            player:messageSpecial(DOOR_LOCKED);
        else
            if (math.random(1,2) == 1) then
                player:messageSpecial(DISCOVER_DISARM_FAIL + 0x8000, 0, 0, 0, 0, true); -- + 0x8000 and 6th param true makes it display player name in message.
                SpawnMob(gargoyle):updateClaim(player);
            else
                player:messageSpecial(DISCOVER_DISARM_SUCCESS + 0x8000, 0, 0, 0, 0, true);
                npc:openDoor(30);
            end
            player:tradeComplete();
        end
    end
end

function attemptOpenDoor(player, npc, correctSideOfDoor)
    if (npc:getAnimation() == ANIMATION_CLOSE_DOOR) then
        if (correctSideOfDoor) then
            local offset = npc:getID() - STONE_DOOR_OFFSET;
            local gargoyle = GARGOYLE_OFFSET + offset;
            
            if (GetMobByID(gargoyle):isSpawned()) then
                player:messageSpecial(DOOR_LOCKED);
            else
                if (math.random(1,10) <= 9) then -- Spawn Gargoyle
                    player:messageSpecial(TRAP_ACTIVATED + 0x8000, 0, 0, 0, 0, true); -- + 0x8000 and 6th param true makes it display player name in message.
                    SpawnMob(gargoyle):updateClaim(player);
                else
                    player:messageSpecial(TRAP_FAILS + 0x8000, 0, 0, 0, 0, true);
                    npc:openDoor(30);
                end
            end
        else
            player:startEvent(26); -- return to beginning of spiral
        end
    end
end

function onTrade(player,npc,trade)
    if ( player:getMainJob() == JOBS.THF and trade:getItemCount() == 1 and (trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) ) then
        attemptPickLock(player, npc, player:getXPos() <= 301);
    end        
end;

function onTrigger(player,npc)
    attemptOpenDoor(player, npc, player:getXPos() <= 301);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 26 and option == 1) then
        player:setPos(260,-0.25,-20,254,111);
    end
end;
