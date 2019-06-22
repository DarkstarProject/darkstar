-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: Blank (TOAU-20 Cutscene, TOAU-27 Cutscene)
-- !pos -298 36 -38 68
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(TOAU) == dsp.mission.id.toau.TEAHOUSE_TUMULT and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(11);
    elseif (player:getCurrentMission(TOAU) == dsp.mission.id.toau.MISPLACED_NOBILITY) then
        player:startEvent(12);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 11) then
        player:completeMission(TOAU,dsp.mission.id.toau.TEAHOUSE_TUMULT);
        player:setVar("AhtUrganStatus",0);
        player:addMission(TOAU,dsp.mission.id.toau.FINDERS_KEEPERS);
    elseif (csid == 12) then
        player:completeMission(TOAU,dsp.mission.id.toau.MISPLACED_NOBILITY);
        player:addMission(TOAU,dsp.mission.id.toau.BASTION_OF_KNOWLEDGE);
    end
end;
