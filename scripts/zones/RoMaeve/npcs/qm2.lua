-----------------------------------
-- Area: Ro'Maeve
--  NPC: qm2 (???)
-- Involved in Mission: Bastok 7-1
-- !pos 102 -4 -114 122 and <many pos>
-----------------------------------
package.loaded["scripts/zones/RoMaeve/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RoMaeve/TextIDs");
require("scripts/zones/RoMaeve/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 1) then
        if (not GetMobByID(MOKKURKALFI_I):isSpawned() and not GetMobByID(MOKKURKALFI_II):isSpawned()) then
            if (player:getVar("Mission7-1MobKilled") == 1) then
                player:addKeyItem(REINFORCED_CERMET);
                player:messageSpecial(KEYITEM_OBTAINED,REINFORCED_CERMET);
                player:setVar("Mission7-1MobKilled",0);
                player:setVar("MissionStatus",2);
            else
                -- Position of npc can change
                local x = npc:getXPos();
                local y = npc:getYPos();
                local z = npc:getZPos();

                GetMobByID(MOKKURKALFI_I):setSpawn(x+1, y, z+1);
                GetMobByID(MOKKURKALFI_II):setSpawn(x-1, y, z-1);
                SpawnMob(MOKKURKALFI_I):lookAt(player:getPos());
                SpawnMob(MOKKURKALFI_II):lookAt(player:getPos());

                local newPosition = npcUtil.pickNewPosition(bastok71QM, bastok71QMPos, true);
                npc:setStatus(STATUS_DISAPPEAR);
                GetNPCByID(bastok71QM):setPos(newPosition.x, newPosition.y, newPosition.z);
            end
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
