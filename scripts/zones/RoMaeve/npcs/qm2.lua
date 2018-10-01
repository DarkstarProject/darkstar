-----------------------------------
-- Area: Ro'Maeve
--  NPC: qm2 (???)
-- Involved in Mission: Bastok 7-1
-- !pos 102 -4 -114 122 and <many pos>
-----------------------------------
local ID = require("scripts/zones/RoMaeve/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 1) then
        if (not GetMobByID(ID.mob.MOKKURKALFI_I):isSpawned() and not GetMobByID(ID.mob.MOKKURKALFI_II):isSpawned()) then
            if (player:getVar("Mission7-1MobKilled") == 1) then
                player:addKeyItem(dsp.ki.REINFORCED_CERMET);
                player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.REINFORCED_CERMET);
                player:setVar("Mission7-1MobKilled",0);
                player:setVar("MissionStatus",2);
            else
                -- Position of npc can change
                local x = npc:getXPos();
                local y = npc:getYPos();
                local z = npc:getZPos();

                GetMobByID(ID.mob.MOKKURKALFI_I):setSpawn(x+1, y, z+1);
                GetMobByID(ID.mob.MOKKURKALFI_II):setSpawn(x-1, y, z-1);
                SpawnMob(ID.mob.MOKKURKALFI_I):lookAt(player:getPos());
                SpawnMob(ID.mob.MOKKURKALFI_II):lookAt(player:getPos());

                local newPosition = npcUtil.pickNewPosition(ID.npc.BASTOK_7_1_QM, ID.npc.BASTOK_7_1_QM_POS, true);
                npc:setStatus(dsp.status.DISAPPEAR);
                GetNPCByID(ID.npc.BASTOK_7_1_QM):setPos(newPosition.x, newPosition.y, newPosition.z);
            end
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
