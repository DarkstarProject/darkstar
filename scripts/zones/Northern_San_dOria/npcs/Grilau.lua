-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Grilau
-- !pos -241.987 6.999 57.887 231
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    local CurrentMission = player:getCurrentMission(SANDORIA);
    local OrcishScoutCompleted = player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.SMASH_THE_ORCISH_SCOUTS);
    local BatHuntCompleted = player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.BAT_HUNT);
    local TheCSpringCompleted = player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.THE_CRYSTAL_SPRING);
    local MissionStatus = player:getVar("MissionStatus");
    local Count = trade:getItemCount();

    if (CurrentMission ~= dsp.mission.id.sandoria.NONE) then
        if (CurrentMission == dsp.mission.id.sandoria.SMASH_THE_ORCISH_SCOUTS and trade:hasItemQty(16656,1) and Count == 1 and OrcishScoutCompleted == false) then -- Trade Orcish Axe
            player:startEvent(1020); -- Finish Mission "Smash the Orcish scouts" (First Time)
        elseif (CurrentMission == dsp.mission.id.sandoria.SMASH_THE_ORCISH_SCOUTS and trade:hasItemQty(16656,1) and Count == 1) then -- Trade Orcish Axe
            player:startEvent(1002); -- Finish Mission "Smash the Orcish scouts" (Repeat)
        elseif (CurrentMission == dsp.mission.id.sandoria.BAT_HUNT and trade:hasItemQty(1112,1) and Count == 1 and BatHuntCompleted == false and MissionStatus == 2) then -- Trade Orcish Mail Scales
            player:startEvent(1023); -- Finish Mission "Bat Hunt"
        elseif (CurrentMission == dsp.mission.id.sandoria.BAT_HUNT and trade:hasItemQty(891,1) and Count == 1 and BatHuntCompleted and MissionStatus == 2) then -- Trade Bat Fang
            player:startEvent(1003); -- Finish Mission "Bat Hunt" (repeat)
        elseif (CurrentMission == dsp.mission.id.sandoria.THE_CRYSTAL_SPRING and trade:hasItemQty(4528,1) and Count == 1 and TheCSpringCompleted == false) then -- Trade Crystal Bass
            player:startEvent(1030); -- Dialog During Mission "The Crystal Spring"
        elseif (CurrentMission == dsp.mission.id.sandoria.THE_CRYSTAL_SPRING and trade:hasItemQty(4528,1) and Count == 1 and TheCSpringCompleted) then -- Trade Crystal Bass
            player:startEvent(1013); -- Finish Mission "The Crystal Spring" (repeat)
        else
            player:startEvent(1008); -- Wrong Item
        end
    else
        player:startEvent(1010); -- Mission not activated
    end

end;

function onTrigger(player,npc)

    local PresOfPapsqueCompleted = player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.PRESTIGE_OF_THE_PAPSQUE);

    if (player:getNation() ~= dsp.nation.SANDORIA) then
        player:startEvent(1011); -- for Non-San d'Orians
    else
        local CurrentMission = player:getCurrentMission(SANDORIA);
        local MissionStatus = player:getVar("MissionStatus");
        local pRank = player:getRank();
        local cs, p, offset = getMissionOffset(player,1,CurrentMission,MissionStatus);

        if (CurrentMission <= dsp.mission.id.sandoria.THE_SHADOW_LORD and (cs ~= 0 or offset ~= 0 or (CurrentMission == dsp.mission.id.sandoria.SMASH_THE_ORCISH_SCOUTS and offset == 0))) then
            if (cs == 0) then
                player:showText(npc,ID.text.ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission
            else
                player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
            end
        elseif (pRank == 1 and player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.SMASH_THE_ORCISH_SCOUTS) == false) then
            player:startEvent(1000); -- Start First Mission "Smash the Orcish scouts"
        elseif (player:hasKeyItem(dsp.ki.ANCIENT_SANDORIAN_BOOK)) then
            player:startEvent(1035);
        elseif (CurrentMission == dsp.mission.id.sandoria.RANPERRE_S_FINAL_REST and player:getVar("MissionStatus",4) and tonumber(os.date("%j")) == player:getVar("Wait1DayForRanperre_date")) then
            player:startEvent(1037);
        elseif (CurrentMission == dsp.mission.id.sandoria.RANPERRE_S_FINAL_REST and player:getVar("MissionStatus") == 6) then
            player:startEvent(1039);
        elseif (CurrentMission == dsp.mission.id.sandoria.RANPERRE_S_FINAL_REST and player:getVar("MissionStatus") == 9) then
            player:startEvent(1033);
        elseif (CurrentMission ~= dsp.mission.id.sandoria.THE_SECRET_WEAPON and pRank == 7 and PresOfPapsqueCompleted == true and getMissionRankPoints(player,19) == 1 and player:getVar("SecretWeaponStatus") == 0) then
            player:startEvent(52);
        elseif (CurrentMission == dsp.mission.id.sandoria.THE_SECRET_WEAPON and player:getVar("SecretWeaponStatus") == 3) then
            player:startEvent(1043);
        elseif (CurrentMission ~= dsp.mission.id.sandoria.NONE) then
            player:startEvent(1001); -- Have mission already activated
        else
            local mission_mask, repeat_mask = getMissionMask(player);
            player:startEvent(1009,mission_mask, 0, 0 ,0 ,0 ,repeat_mask); -- Mission List
        end
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdateCSID: %u",csid);
    -- printf("onUpdateOPTION: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinishCSID: %u",csid);
    -- printf("onFinishOPTION: %u",option);

    finishMissionTimeline(player,1,csid,option);
    if (csid == 1035) then
        player:setVar("MissionStatus",4);
        player:delKeyItem(dsp.ki.ANCIENT_SANDORIAN_BOOK);
        player:setVar("Wait1DayForRanperre_date", os.date("%j"));
    elseif (csid == 1037) then
        player:setVar("MissionStatus",6);
    elseif (csid == 1039) then
        player:setVar("MissionStatus",7);
        player:setVar("Wait1DayForRanperre_date",0);
    elseif (csid == 1033) then
        finishMissionTimeline(player,2,csid,option);
    elseif (csid == 52) then
        player:setVar("SecretWeaponStatus",1);
    elseif (csid == 1043) then
        finishMissionTimeline(player,2,csid,option);
    end

end;
