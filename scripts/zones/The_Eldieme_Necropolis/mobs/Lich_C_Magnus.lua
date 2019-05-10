-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Lich_C_Magnus
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.LICH_BANISHER);
    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.BLUE_RIBBON_BLUES) == QUEST_ACCEPTED) then
        player:setVar("Lich_C_Magnus_Died",1);
    end
end;