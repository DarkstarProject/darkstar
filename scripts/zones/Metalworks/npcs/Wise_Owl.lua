-----------------------------------
-- Area: Metalworks
--  NPC: Wise Owl
-- Type: Smithing Adv. Image Support
-- !pos -106.336 2.000 26.117 237
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/crafting");
local ID = require("scripts/zones/Metalworks/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local guildMember = isGuildMember(player,8);
    local SkillLevel = player:getSkillLevel(dsp.skill.SMITHING);
    local Cost = getAdvImageSupportCost(player,dsp.skill.SMITHING);

    if (guildMember == 1) then
        if (player:hasStatusEffect(dsp.effect.SMITHING_IMAGERY) == false) then
            player:startEvent(103,Cost,SkillLevel,0,207,player:getGil(),0,4095,0);
        else
            player:startEvent(103,Cost,SkillLevel,0,207,player:getGil(),28721,4095,0);
        end
    else
        player:startEvent(103); -- Standard Dialogue
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    local Cost = getAdvImageSupportCost(player,dsp.skill.SMITHING);

    if (csid == 103 and option == 1) then
        player:delGil(Cost);
        player:messageSpecial(ID.text.SMITHING_SUPPORT,0,2,0);
        player:addStatusEffect(dsp.effect.SMITHING_IMAGERY,3,0,480);
    end
end;
